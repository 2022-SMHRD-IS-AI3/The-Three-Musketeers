package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Getter

@AllArgsConstructor
@NoArgsConstructor


public class boardDTO {

	private int board_num;
	private String board_title;
	private String board_content;
	private String board_photo;
	private Timestamp board_datetime;
	private String category;
	private String id;
	
public boardDTO(int board_num) {
	this.board_num = board_num;
}
}
