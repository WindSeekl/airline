package com.neu.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HiController {
	@RequestMapping("/hello")
	public String hello() {
		return "hello world!!!!!";
	}
}
