package com.itwillbs.luna_code.service.chat_bot;

import javax.inject.Inject;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class ChatGPTService {

	@Inject
	private ChatGPTClient chatGptClient;
	
	public String askChatGpt(String prompt) {
		
		String result = chatGptClient.askChatGpt(prompt);
		
		JSONObject jsonObject = new JSONObject(result);
		JSONArray jsonArray = jsonObject.getJSONArray("choices");
		
		JSONObject firstChoice = jsonArray.getJSONObject(0);
		JSONObject messaege = firstChoice.getJSONObject("message");
		String content = messaege.getString("content");
		
		System.out.println("ChatGPT Client -> COntent: " + content);
		
		return content;
	}

}
