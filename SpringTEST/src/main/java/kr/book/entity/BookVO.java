package kr.book.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString 
public class BookVO {
	
	private int num;
	private String title;
	private String author;
	private String company;
	private String isbn;
	private int count;
}
