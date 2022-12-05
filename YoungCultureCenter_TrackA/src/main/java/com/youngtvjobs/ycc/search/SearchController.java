package com.youngtvjobs.ycc.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.club.ClubDto;
import com.youngtvjobs.ycc.course.CourseDto;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	BoardDto boardDto;
	
	// 검색결과 메인 페이지
	@RequestMapping("/search")
	public String searchPage(SearchItem sc, Model m, ModelAndView mav) {

		try {
			
			// 검색결과수 5개 제한
			sc.setPageSize(5);
			
			// 총 검색결과수 (공지사항, 이벤트, 강좌, ...)
			int totalCnt = searchService.getSearchAllResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);
			
			// 각각 공지사항, 이벤트, 동아리, 강좌 검색결과 select
			List<BoardDto> nList = searchService.getNoticePage(sc);
			m.addAttribute("noticeList", nList);
	        
			List<BoardDto> eList = searchService.getEventPage(sc);
			m.addAttribute("eventList", eList);

			List<ClubDto> clubList = searchService.getClubPage(sc);
			m.addAttribute("clubList", clubList);
			
			List<CourseDto> courseList = searchService.getCoursePage(sc);
			m.addAttribute("courseList", courseList);
			
			// 자동완성 구현 중 //////////////////////////////////////////////////
			// 위의 List를 map으로 변환 --> 검색어자동완성 기능에 사용
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
	        for (BoardDto dto : nList) {
	            map.add("article_title", dto.getArticle_title());
	        }
	        
	        // map -> json 변환
	        JSONObject jsonObject = new JSONObject(map);
	        System.out.println(jsonObject);
	        //////////////////////////////////////////////////////////////////
	        
//	        System.out.println(map.get("article_title"));
	        
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "search/search";
	}

	// 검색결과수 제한없이 모두 출력 (페이지네이션 적용) -> 검색결과가 5개 이상일 때 '더보기' 버튼 활성화되고, 더보기 버튼 눌렀을 때 이동하는 페이지 
	@RequestMapping("/search/all")
	public String searchAll(SearchItem sc, BoardDto boardDto, Integer article_id, Model m, HttpServletRequest req) {

		try {
			
			// mapper의 searchResultCnt 에서 사용. 
			// 파라미터타입으로 SearchItem과 Article 두 가지가 필요해서 각각의 파라미터를 따로 가져와 map에 저장하고 그 map을 파라미터타입으로 줬음
			String keyword = req.getParameter("keyword");
			String article_Board_type = req.getParameter("type");
			String type = req.getParameter("type");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("keyword", keyword);
			map.put("article_Board_type", article_Board_type);
			map.put("type", type);
			
			// search페이지에서 넘겨받은 파라미터 type을 통해 파라미터와 일치하는 테이블의 검색결과를 카운트
			int totalCnt = searchService.getSearchResultCnt(map);
			m.addAttribute("totalCnt", totalCnt);
			
			// 페이징
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			m.addAttribute("pr", pageResolver);
			
			// 각각 공지사항, 이벤트, 동아리, 강좌 검색결과 select
			// article:공지사항
			List<BoardDto> nList = searchService.getNoticePage(sc);
			m.addAttribute("noticeList", nList);
			// article:이벤트
			List<BoardDto> eList = searchService.getEventPage(sc);
			m.addAttribute("eventList", eList);
			// 동아리
			List<ClubDto> clubList = searchService.getClubPage(sc);
			m.addAttribute("clubList", clubList);
			// 강좌
			List<CourseDto> courseList = searchService.getCoursePage(sc);
			m.addAttribute("courseList", courseList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "search/all";
	}
	
	// 진행중) 검색어 자동완성 구현을 위한 ajax 컨트롤러//////////////////////////////////////////////////
	@ResponseBody
	@GetMapping(value = "/search/autocomplete", produces="application/json;charset=UTF-8") 
	public String autocomplete(Model m, SearchItem sc) throws Exception {
		List<BoardDto> nList = null;
		nList = searchService.getNoticePage(sc);
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
	    for (BoardDto dto : nList) {
	        map.add("article_title", dto.getArticle_title());
	    }
	    JSONObject jsonObject = new JSONObject(map);
	    String data = jsonObject.toString();
	  
	    return data; 
	}
}
