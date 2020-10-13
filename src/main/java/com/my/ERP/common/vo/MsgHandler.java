package com.my.ERP.common.vo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.my.ERP.Human.model.vo.Human;

public class MsgHandler extends TextWebSocketHandler{
	
	//1:1
	Map<String, WebSocketSession> userSession = new HashMap<String, WebSocketSession>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getId(session);
		userSession.put(senderId, session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getId(session);
		userSession.remove(senderId);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(userSession);
		String eno = message.getPayload();
		System.out.println(eno);
		WebSocketSession reciever = userSession.get(eno);
		if(reciever != null) {
			String msg = "도착";
			TextMessage tmpMsg = new TextMessage(msg);
			reciever.sendMessage(tmpMsg);
		}
	}
	
	private String getId(WebSocketSession sess) {
		Map<String, Object> httpSess = sess.getAttributes();
		Human loginUser = (Human)httpSess.get("loginUser");
		
		if(loginUser != null) return loginUser.getEno();
		else return sess.getId();
	}
	
}
