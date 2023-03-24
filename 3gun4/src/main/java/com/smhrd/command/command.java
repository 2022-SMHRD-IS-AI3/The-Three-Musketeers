package com.smhrd.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface command {

	public abstract String execute(HttpServletRequest request, HttpServletResponse response);
}
