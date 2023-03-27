package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor

@Getter

@RequiredArgsConstructor

public class memberDTO {
	
	@NonNull
	private String id;
	@NonNull
	private String pw;
	private String name;
	private String phonenum;
	private String class_name;
	
}