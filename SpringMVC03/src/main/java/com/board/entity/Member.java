package com.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Member {

	private int memIdx; 
	private String memId; 
	private String memPw;
	private String memName;
	private int memAge;
	private String memGender; 
	private String memEmail; 
	private String memProfile;
	
}
