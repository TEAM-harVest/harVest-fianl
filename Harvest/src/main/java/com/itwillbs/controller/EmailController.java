package com.itwillbs.controller;


import java.time.LocalDate;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.AlramService;
import com.itwillbs.service.ProjectListService;


@Controller
public class EmailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	private ProjectListService projectListService;
	
	@RequestMapping(value = "/email", method = RequestMethod.GET)
    public String sendMail(ProjectDTO projectDTO, HttpSession session, HttpServletRequest request) throws Exception{
        
		// 오늘날짜 불러오기 테스트용
		LocalDate todaysDate = LocalDate.now();
		
		String subject = request.getParameter("title");
        String content = "프로젝트 후원하러가기 https://tumblbug.com/";
        String from = "ki6532@naver.com";
        String to = (String)session.getAttribute("id");
        
        try {
        	// 이메일 보내는 구문
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
            
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject("["+subject+"] 프로젝트 펀딩이 시작되었습니다.");
            mailHelper.setText(content);
            
            mailSender.send(mail);
            
            // 이메일보내기와 동시에 디비에 알람 카운트 인서트
            int idx=Integer.parseInt(request.getParameter("idx"));
            projectListService.updateAlramcount(idx);
        	
            System.out.println("성공^^");
            System.out.println(todaysDate);
            
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("전송실패");
        }
        
        return "redirect:/projectList/expect";
    }



}