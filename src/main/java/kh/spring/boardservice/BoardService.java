package kh.spring.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.DAO.BoardDAO;
import kh.spring.DTO.BoardDTO;
import kh.spring.DTO.ReplyDTO;

@Component
public class BoardService {
	@Autowired
	private BoardDAO dao;
	
	public List<BoardDTO> selectAllByBoard(){
		return dao.select_all();
	}
	public List<BoardDTO> insertBoard(BoardDTO bdto,String path){
		return dao.select_all();
	}
	public int insertBoard(BoardDTO bdto){
		return dao.insert_board(bdto);
	}
	public BoardDTO select_bySeq(int seq){
		return dao.select_seq(seq);
	}
	
}

