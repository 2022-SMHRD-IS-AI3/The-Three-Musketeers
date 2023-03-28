package com.smhrd.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter

@AllArgsConstructor
@NoArgsConstructor
public class pollDTO {

	private int vote_num;
	private String vote_title;
	private String vote_content;
	private int ovlerlap;
	private int anonymity;
	private String id;
	
	public pollDTO(int vote_num) {
		this.vote_num = vote_num;
	}
}
