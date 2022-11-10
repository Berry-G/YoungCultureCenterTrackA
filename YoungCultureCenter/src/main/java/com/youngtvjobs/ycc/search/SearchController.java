package com.youngtvjobs.ycc.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//검색창 컨트롤러
@Controller
public class SearchController {

		@RequestMapping("/search")
		public String searchPage()
		{
			return "search/search";
		}

		@RequestMapping("/search/all")
		public String searchAll()
		{
			return "search/all";
		}

		

}
