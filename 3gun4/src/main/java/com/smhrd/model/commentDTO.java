package com.smhrd.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter

@AllArgsConstructor
@NoArgsConstructor

public class commentDTO {
	private int com_num;
	private int board_num;
	private String com_content;
	private Timestamp com_datetime;
	private String id;


}
