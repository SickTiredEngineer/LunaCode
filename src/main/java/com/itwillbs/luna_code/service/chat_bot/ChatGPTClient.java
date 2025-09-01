package com.itwillbs.luna_code.service.chat_bot;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class ChatGPTClient {
	
	@Value("${gpt.API_KEY}")
	private String apiKey;
	
	private String url = "https://api.openai.com/v1/chat/completions";
	private String model = "gpt-4o-mini";
	
	/* 답변 온도? */
	private double temperature = 0.5;
	
	public String askChatGpt(String prompt) {
		
		/* REST API 요청을 위한 HTTP 통신 */
		
		// 헤더정보 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Authorization", "Bearer " + apiKey);
		
		// 요청 파라미터 생성 (JSON 형식)  
		Map<String, String> roleSystem = new HashMap<String, String>();
		roleSystem.put("role", "system");
		roleSystem.put("content", ""
				+ "너는 IT에 관련된 질문들을 받게 될거야"
				+ "다만 꼭 IT가 아니더라도 다양한 질문들을 친절하게 대답해주도록 해."
				+ "최대한 친절하게 답변을 하되, 욕을 해보라거나, 비윤리적인 행위를 시킨다면 단호히 거부해."
				+ "공격 등 해킹에 대한 질문을 하면 이론 같은거를 알려주되, 절때 코드를 주거나 하지는 마.");

		Map<String, String> roleUser = new HashMap<String, String>();
		roleUser.put("role", "user");
		roleUser.put("content", prompt);
		
		List<Map<String, String>> message = new ArrayList<Map<String,String>>();
		message.add(roleSystem);
		message.add(roleUser);
		
		JSONObject requestData = new JSONObject();
		requestData.put("model", model);
		requestData.put("temperature", temperature);
		requestData.put("messages", message);
		
		// HTTP 요청 정보를 관리하는 HttpEntity 객체 생성
		HttpEntity<String> httpEntity = new HttpEntity<String>(requestData.toString(), headers);
		System.out.println(httpEntity);
		
		RestTemplate restTemplate = new RestTemplate();
		
		// UTF-8
		List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();
		messageConverters.add(new StringHttpMessageConverter(StandardCharsets.UTF_8));
		messageConverters.addAll(restTemplate.getMessageConverters());
		restTemplate.setMessageConverters(messageConverters);
		
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, httpEntity, String.class);
		System.out.println("responseEntity: " + responseEntity);
		
		
		// RESTFUL API 요청 RestTemplate 객체생성

		return responseEntity.getBody();
	}

}
