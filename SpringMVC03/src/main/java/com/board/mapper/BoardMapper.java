package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.board.entity.Board;

@Mapper
public interface BoardMapper {

	public List<Board> boardSelectList();

	public void boardInsert(Board board);

	public Board boardContent(int idx);
	
	public void boardDelete(int idx);

	public void boardUpdate(Board board);
	
	@Update("UPDATE BOARD SET count= count + 1 WHERE idx = #{idx}")
	public void boardCount(int idx);
}
