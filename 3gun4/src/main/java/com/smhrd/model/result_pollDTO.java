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
	private int count;
	private String vote_result;
}
