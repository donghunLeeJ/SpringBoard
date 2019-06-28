package kh.spring.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import kh.spring.DTO.BoardDTO;

@Component
public class BoardDAO {

	@Autowired
	private JdbcTemplate jdbc;
	public List<BoardDTO> select_all(){
		String sql = "select * from d_board";
		return jdbc.query(sql, new RowMapper<BoardDTO>() {
			@Override
			public BoardDTO mapRow(ResultSet rs, int arg1) throws SQLException {
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContents(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setTime(rs.getTimestamp(5));
				return dto;
			}
		});
	}

	public int insert_board(BoardDTO dto ){
		String sql = "insert into d_board values(board_seq.nextval,?,?,?,default,?)";
		return jdbc.update(sql,new Object[] {dto.getTitle(),dto.getContents(),dto.getWriter(),dto.getFilePath()});
	};
	public BoardDTO select_seq(int seq){
		String sql = "select * from d_board where board_seq=?";
		return jdbc.queryForObject(sql, new Object[] {seq},new RowMapper<BoardDTO>() {
			@Override
			public BoardDTO mapRow(ResultSet rs, int arg1) throws SQLException {
				BoardDTO dto = new BoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp(5),rs.getString(6));
				return dto;
			}
			
		});
	};
}

