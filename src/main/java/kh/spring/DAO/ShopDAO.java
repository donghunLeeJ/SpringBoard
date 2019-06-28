package kh.spring.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ShopDTO;
import kh.spring.DTO.ReplyDTO;

@Repository
public class ShopDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public int shop_insert(ShopDTO dto) {
		return sst.insert("shop-mapper.insert_shop", dto);
	}
	public List<ShopDTO> shop_select(int startNum) {
		int lastNum = startNum*10;
		return sst.selectList("shop-mapper.select_all",lastNum);
	}
	public int total_count() {
		return sst.selectOne("shop-mapper.count_all");
	}
	public ShopDTO select_shop(int seq) {
		return sst.selectOne("shop-mapper.select_shop", seq);
	}
	public int insert_reply(ReplyDTO dto) {
		return sst.insert("reply-mapper.insert_reply", dto);
	}
	public List<ReplyDTO> select_reply_all(int shop_seq) {
		return sst.selectList("reply-mapper.select_reply", shop_seq);
	}
}
