package com.youngtvjobs.ycc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

//홈페이지 메인 컨트롤러
public class IndexController
{
	@RequestMapping("/")
	public String index()
	{
		return "index";
	}
	
	@RequestMapping("/map")
	public String map()
	{
		return "map_page/map";
	}

}
