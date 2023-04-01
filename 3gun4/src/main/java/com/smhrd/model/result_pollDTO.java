package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor

public class result_pollDTO {

	private int vote_num;
	private String vote_content;
	private String id;

	public result_pollDTO(int vote_num) {
		this.vote_num = vote_num;
	}
	
	public result_pollDTO(String id) {
		this.id = id;
	}
}
