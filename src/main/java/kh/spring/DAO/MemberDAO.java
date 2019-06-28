package kh.spring.DAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import kh.spring.DTO.MemberDTO;

@Component
public class MemberDAO {
	@Autowired
	private JdbcTemplate jdbc;
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private HttpSession session;
	
	public int insert(MemberDTO dto) {
		return sst.insert("mybatis_member.insert_member", dto);
	}
	public int update_image(String path, String id) {
		Map<String,String> map = new HashMap();
		map.put("path", path);
		map.put("id",id);
		return sst.update("mybatis_member.update_image",map);
	}
	public String check_login(String id) {
		return sst.selectOne("mybatis_member.select_pw", id);
	}
	
	public int check_sameId(String id) {
		String sql = "select * from member where lastname = ? ";
		try {
			return jdbc.update(sql,id);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public MemberDTO select_info(String id) {
		
		return sst.selectOne("mybatis_member.select_info",id);
				
	}
}
