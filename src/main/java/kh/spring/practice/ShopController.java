package kh.spring.practice;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.ShopDAO;
import kh.spring.DTO.PagingDTO;
import kh.spring.DTO.ShopDTO;
import kh.spring.DTO.ReplyDTO;
import kh.spring.boardservice.ShopService;
import kh.spring.paging.Paging;
@Controller
public class ShopController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Paging paging;
	
	@Autowired
	private ShopService ss;
	
	@Autowired
	private ShopDAO dao;
	
	
	@RequestMapping("/shop")
	public String goShop(HttpServletRequest request) {
		String page = request.getParameter("page");
		System.out.println(dao.total_count());
		int pageNum = Integer.parseInt(page);
		List<ShopDTO> arr = ss.select_all(pageNum);
		request.setAttribute("arr", arr);
		try {
		PagingDTO dto = paging.getNavi(pageNum);
		System.out.println(dto.getStartNavi());
		System.out.println(dto.getEndNavi());
		request.setAttribute("paging", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "shop";
	}
	@RequestMapping("/register")
	public String registerProduct() {
		return "registerPro";
	}
	@RequestMapping("/shopRegister")
	public String registerProductinBoard(ShopDTO dto, MultipartFile boardFile) {
		String realPath = session.getServletContext().getRealPath("/resources/image/shop/");
		File savedFile = new File(realPath+"/"+System.currentTimeMillis()+boardFile.getOriginalFilename());
		try {
			boardFile.transferTo(savedFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dto.setFilePath("/shop/"+savedFile.getName());
		System.out.println(ss.shop_board_insert(dto));
		return "redirect:shop?page=1";
	}
	@RequestMapping("/shopView")
	public String registerProductinBoard(String seq,HttpServletRequest request) {
		int shopSeq = Integer.parseInt(seq);
		request.setAttribute("dto",ss.select_shop_seq(shopSeq));
		request.setAttribute("Rarr", ss.select_reply_all(shopSeq));
		return "shopView";
	}
	@RequestMapping("/inputReply")
	public String inputRe(ReplyDTO dto) {
		ss.insert_reply(dto);
		int seqNum = dto.getShop_seq();
		return "redirect:shopView?seq="+seqNum;
	}
}
