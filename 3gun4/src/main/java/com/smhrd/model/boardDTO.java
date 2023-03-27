package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter

@AllArgsConstructor
public class boardDTO {

	private BigDecimal board_num;
	private String board_title;
	private String board_content;
	private String board_photo;
	private Timestamp board_datetime;
	private String category;
	private String id;
	
	
}
