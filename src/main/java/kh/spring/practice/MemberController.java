package kh.spring.practice;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.MemberDAO;
import kh.spring.DTO.MemberDTO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping("/")
	public String index() {
		return "home";
	}
	@RequestMapping("/joinMemForm")
	public String joinMemForm() {
		return "joinMemForm";
	}
	@RequestMapping("/joinMemProc")
	public String joinMemProc(MemberDTO dto) {
		dao.insert(dto);
		return "redirect:/";
	}
	@RequestMapping("/loginProc")
	public String loginProc(String id , String pw) {
		if(dao.check_login(id).equals(pw)) {
			session.setAttribute("mem",dao.select_info(id));
			return "main";
		}else {
			return "home";
		}
	}
	@ResponseBody
	@RequestMapping(value = "/idCheck", produces = "application/text; charset=utf8")
	public String idCheck(String id , HttpServletResponse response) {
		response.setCharacterEncoding("utf8");
		String result = Integer.toString(dao.check_sameId(id));
		return result;
	}
	@RequestMapping("changeImage")
	public String changeImage(MultipartFile image,String id) {
		String realPath = session.getServletContext().getRealPath("/resources/image");
		System.out.println(realPath);
		System.out.println(id);
		try {
			File saveFile = new File(realPath+"/"+image.getOriginalFilename());
			image.transferTo(saveFile);
			String path = saveFile.getAbsolutePath();
			System.out.println(dao.update_image("image/"+image.getOriginalFilename(), id));
			session.setAttribute("mem",dao.select_info(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main";
	}
	@RequestMapping("/logout")
	public String logout(MemberDTO dto) {
		session.invalidate();
		return "redirect:/";
	}
}
