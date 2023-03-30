package com.smhrd.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter

@AllArgsConstructor
@NoArgsConstructor

public class scheduleDTO {

	private int schedule_code;
	private String class_name;
	private String start_date;
	private String end_date;
	private String allday;
	
	
	
}
