package kh.spring.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.DAO.ShopDAO;
import kh.spring.DTO.ShopDTO;
import kh.spring.DTO.ReplyDTO;

@Service
public class ShopService {

	@Autowired
	private ShopDAO sdao;
	
	public int shop_board_insert(ShopDTO dto) {
		return sdao.shop_insert(dto);
	}
	public List<ShopDTO> select_all(int presentNum){
		return sdao.shop_select(presentNum);
	}
	public ShopDTO select_shop_seq(int seq){
		return sdao.select_shop(seq);
	}
	public int insert_reply(ReplyDTO dto){
		return sdao.insert_reply(dto);
	}
	public List<ReplyDTO> select_reply_all(int shop_seq) {
		return sdao.select_reply_all(shop_seq);
	}
}
