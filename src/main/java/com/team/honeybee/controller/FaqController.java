package com.team.honeybee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.service.FaqService;

@Controller
@RequestMapping("faq")
public class FaqController {

	@Autowired
	private FaqService service;


	@GetMapping("insert")
	public void writeBoard() {

	}
	@RequestMapping("login")
	private void login() {
		
	}

	@PostMapping("insert")
	public String writeBoard(FaqDto faq,RedirectAttributes rttr) {
		
		boolean success = service.addBoard(faq);
		if (success) {
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 글이 등록되지 않았습니다.");
		}

		return "redirect:/faq/question";

	}
	
	@RequestMapping("question")
	public void questionBoard() {
		
	}
	@RequestMapping("notice")
	public void indexBoard() {
		
	}
}