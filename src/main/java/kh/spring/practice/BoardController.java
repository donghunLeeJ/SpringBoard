package kh.spring.practice;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.DTO.BoardDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.boardservice.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/goBoard")
	public String goBoard() {
		session.setAttribute("arr", bs.selectAllByBoard());
		return "board";
	}
	@RequestMapping("/goBoardWrite")
	public String goBoardWriter() {
		return "boardWrite";
	}
	@RequestMapping("/BoardWriteProc")
	public String BoardWriterProc(MultipartFile boardFile , BoardDTO bdto ) {
		String realPath = session.getServletContext().getRealPath("/resources/file/");
		System.out.println(realPath);
		File file = new File(realPath+"/"+bdto.getWriter()+"_"+boardFile.getOriginalFilename());
		try {
			boardFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		bdto.setFilePath("file/"+bdto.getWriter()+"_"+boardFile.getOriginalFilename());
		System.out.println(bs.insertBoard(bdto));
		return "redirect:/goBoard";
	}
	@RequestMapping("/showContentsProc")
	public ModelAndView showContentsProc(String seq) {
		ModelAndView mav = new ModelAndView();
		int seq2 = Integer.parseInt(seq);
		mav.addObject("dto",bs.select_bySeq(seq2));
		mav.setViewName("showCon");
		return mav;
	}
}
