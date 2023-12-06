package com.board.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString // -> 필드들을 문자열로 보여줌
public class Board {
	
	private int idx; // 번호
	private String memId; //아이디
	private String title; // 제목
	private String content; // 내용
	private String writer; // 작성자
	private String indate; // 작성일
	private int count; // 조회수
	
	
}
