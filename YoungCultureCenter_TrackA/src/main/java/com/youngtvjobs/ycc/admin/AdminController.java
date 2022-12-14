package com.youngtvjobs.ycc.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.youngtvjobs.ycc.common.YccMethod;

@Controller
public class AdminController
{
	
	@Autowired
	AdminService adminService;
	

	//관리자페이지 메인메뉴
	@GetMapping("/admin")
	public String adminmain(HttpServletRequest request, Authentication auth ) throws Exception
	{
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {roleNames.add(authority.getAuthority());});

		if(!roleNames.contains("ROLE_ADMIN")) {

			return "redirect:/error/403";
		}
		return "admin/adminmain";
	}
	
	//관리자페이지 : 공지사항 관리
	@GetMapping("/admin/popup")
	public String popupSetting(HttpServletRequest request,  Authentication auth) throws Exception
	{	
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {roleNames.add(authority.getAuthority());});

		if(!roleNames.contains("ROLE_ADMIN")) {

			return "redirect:/error/403";
		}
		return "admin/profile";
	}
	
	//공지사항 관리 : 저장 버튼 눌렀을 때 동작
	@PostMapping("/admin/popup")
	public String popupSave(String action, String url, String files, Model m) throws Exception
	{
		if(action.equals("save"))
		{
			m.addAttribute("alert", "<script>alert('저장 되었습니다.')</script>");
		}
		
		else if(action.equals("delete"))
		{
			m.addAttribute("alert", "<script>alert('삭제 되었습니다.')</script>");
		}
		System.out.println("post 구문 시작");
		return "redirect:/admin/popup";
	}
	
	//이용약관 관리
	@GetMapping("/admin/agreement")
	public String agreement(HttpServletRequest request, Model m , Authentication auth) throws Exception
	{
		
		AdminDto adminDto = adminService.select();
		
		try {

			m.addAttribute("adminDto", adminDto);
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {roleNames.add(authority.getAuthority());});
		
		// 관리자 권한이 없을 때 동작
		if(!roleNames.contains("ROLE_ADMIN")) {

			return "redirect:/error/403";
		}
		return "admin/agreement";
	}
	
	//약관 수정 후 등록
	@PostMapping("/admin/agreement")
	public String agreement(HttpServletRequest request, String join_privacy_terms, String join_terms) throws Exception
	{
		//System.out.println(join_terms);
		//System.out.println(join_privacy_terms);
		AdminDto adminDto = new AdminDto();
		adminDto.setJoin_terms(join_terms);
		adminDto.setJoin_privacy_terms(join_privacy_terms);
		//System.out.println(adminDto);
		
		try {
			
			if(adminService.joinTermsUpdate(adminDto) != 1) {
				throw new Exception("업데이트 에러");
			}else{
				System.out.println("업데이트 성공");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("업데이트 실패");
		}
		
		
		return "admin/adminmain";
	}


}
