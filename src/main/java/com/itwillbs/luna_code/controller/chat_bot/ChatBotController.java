package com.itwillbs.luna_code.controller.chat_bot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.luna_code.service.chat_bot.ChatGPTService;

@Controller
public class ChatBotController {
	
	@Autowired
	private ChatGPTService chatGPTService;
	
	@GetMapping("ChatBot")
	public String chatBot() {
		return "chat_bot";
	}
	
	
	@ResponseBody
	@PostMapping(value = "/AskToGPT",  produces = "application/json; charset=UTF-8")
	public String askToGpt(String prompt, Model model) {
		
		String result = chatGPTService.askChatGpt(prompt);
		
		return result;
	}
	
	
}
