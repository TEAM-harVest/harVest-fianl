package com.itwillbs.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.ProjectInfoService;


@Controller
public class ProjectInfoController {
	
	@Inject
	private ProjectInfoService projectService;
	
	@RequestMapping(value = "/main/mainList", method = RequestMethod.GET)
	public String mainList(HttpServletRequest request, Model model) {
		List<ProjectDTO> projectList = projectService.getProjectList();
		model.addAttribute("projectList", projectList);
		return "main/list";
	}
	
	@RequestMapping(value = "/project/projectInfo", method = RequestMethod.GET)
	public String projectInfo(@RequestParam("idx")int idx, Model model, HttpSession session) {
		
		Map<String, String> param = new HashMap<String, String>();
		
		String sessionId = (String)session.getAttribute("iD");
		
		if(sessionId != null) {
			param.put("SESSIONID", sessionId);
		}
		param.put("IDX", idx + "");
		
		ProjectDTO projectDTO = projectService.getProjectInfo(param);
		model.addAttribute("projectDTO", projectDTO);
		
		
		Date date = projectDTO.getEnd();
		SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		// 결제일 계산
		cal.add(Calendar.DATE, 1);
		String payDate = sdfYMD.format(cal.getTime());
		
		model.addAttribute("projectDTO", projectDTO);
		model.addAttribute("payDate", payDate);
		
		
		return "projectInfo/projectInfoPage";
	}
	
	@RequestMapping(value = "/payment/payment", method = RequestMethod.POST)
	public String minDona(@RequestParam("idx")int idx, HttpServletRequest request, Model model) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("IDX", idx + "");
		
		String userDona = request.getParameter("userDona");
		String funding_name = request.getParameter("funding_name");
		
		ProjectDTO projectDTO = projectService.getProjectInfo(param);
		
		if(funding_name.equals("0")) {
			model.addAttribute("funding_name", userDona);
		} else {
			model.addAttribute("funding_name", funding_name);
		}
		
		model.addAttribute("idx", idx);
		model.addAttribute("projectDTO", projectDTO);
		return "payment/payment";
	}
	
	
	// 공개예정 페이지
	@RequestMapping(value = "/project/projectOpen", method = RequestMethod.GET)
	public String projectOpen(@RequestParam("idx")int idx, Model model, HttpSession session) {
		Map<String, String> param = new HashMap<String, String>();
		
		String sessionId = (String)session.getAttribute("id");
		
		if(sessionId != null) {
			param.put("SESSIONID", sessionId);
		}
		param.put("IDX", idx + "");
		
		ProjectDTO projectDTO = projectService.getProjectInfo(param);
		
		model.addAttribute("projectDTO", projectDTO);
		return "projectInfo/projectOpenPage";
	}
	@RequestMapping(value = "/payment/paySuccess", method = RequestMethod.GET)
	public String paySuccess() {
		return "payment/paySuccess";
	}

}
