package com.youngtvjobs.ycc.course;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CourseController {

	@RequestMapping("/course/search")
	public String courseSearch() {
		return "/course/courseSearch";
	}
	
	@RequestMapping("/course/detail")
	public String coursedetail() {
		return "/course/coursedetail";
	}
	
	@RequestMapping("/course/courseinfo")
	public String courseinfo() {
		return "/course/courseinfo";
	}
	
	@RequestMapping("/course/schedule")
	public String courseSchedule() {
		return "/course/courseSchedule";
	}

	@RequestMapping("/course/regcomplete")
	public String courseRegComplete() {
		return "/course/courseRegComplete";
	}
}