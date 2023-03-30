package com.smhrd.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class msgDTO {
	
	private int msg_num;
	@NonNull
	private String send_id;
	@NonNull
	private String accept_id;
	@NonNull
	private String msg_content;
	private Timestamp msg_datetime;

}
