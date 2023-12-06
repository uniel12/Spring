package com.board.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.board.entity.Member;

@Mapper
public interface MemberMapper {

	public Member registerCheck(String memId);

	public int join(Member m);

	public Member login(Member m);

	public int update(Member m);
	
	public int imageUpdate(Member mvo);
}
