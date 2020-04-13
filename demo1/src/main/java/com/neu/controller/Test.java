package com.neu.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class Test {
	@RequestMapping("/test")
	public ModelAndView test() {
		System.out.println("aaaaa");
		ModelAndView mv = new ModelAndView();
		mv.addObject("hi", "你好啊");
		mv.setViewName("hello");
		return mv;
	}
}
