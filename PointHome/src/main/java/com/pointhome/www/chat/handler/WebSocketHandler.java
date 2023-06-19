package com.pointhome.www.chat.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


	public class WebSocketHandler extends TextWebSocketHandler {
		private Logger logger = LoggerFactory.getLogger(this.getClass());
		
		// 유저의 세션을 저장
		List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		
		// 채팅방넘버 / uri
		Map<String, List<WebSocketSession>> roomUser = new HashMap<String, List<WebSocketSession>>();
		
		// 채팅방 번호, 여러개의 세션값 
//		userId의 webSession을 저장
//		Map<String, WebSocketSession> userSessions = new HashMap<>();
		
		// 유저가 연결 되었을 때
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			super.afterConnectionEstablished(session);
			
			// 방번호를 split으로 잘라서 방번호를 받기
			String roomId = session.getUri().toString().split("/")[4];

			//logger.debug("**roomid***{}", roomId);
			
			session.getAttributes().put("roomId", roomId);
			
			String chk = (String) session.getAttributes().get("roomId");
			logger.debug("---- session의 roomId 확인 ----{}", chk);
			
			
			
			// roomUser Map의 키, 값을 확인 하기 위해 .containsKey를 사용
			if(!roomUser.containsKey(chk)) {
				sessionList = new ArrayList<WebSocketSession>();
				sessionList.add(session);
				roomUser.put(chk, sessionList);
			}else {
				sessionList.add(session);
			}
			
			logger.debug("---------------{}", session);
			
			System.out.println(session.getUri());
			
			// 유저가 연결했을 때 sessionMap에 추가
			
			System.out.println("연결됨 : " + session.getId());
			
		}
		
		// 유저의 연결이 끊겼을 때
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			System.out.println("연결끊김 : " + session.getId());
			sessionList.remove(session);
			super.afterConnectionClosed(session, status);

		}

		
		//메시지 발송
		@Override
		public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
			String roomId = session.getUri().toString().split("/")[4];
			
			logger.debug("-------------- {}", roomId);
			logger.debug("--------------------{}", roomUser);
//			chatService.chatMessage(roomId, message);
			
			String msg = (String) message.getPayload();
			System.out.println("MESSAGE : " + message);
			System.out.println("testsetset : " + msg);

			for(WebSocketSession se : roomUser.get(roomId)) {
		         logger.info("testtesttest - {}",roomUser.get(roomId));
		         se.sendMessage(message);
		      }	
		
		}

}
