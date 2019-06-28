package kh.spring.socket;

import java.nio.charset.Charset;
import java.text.MessageFormat.Field;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import kh.spring.DTO.MemberDTO;

@ServerEndpoint(value="/message",configurator=SessionSetter.class)
public class WebSocket {
	private MemberDTO loginSession;
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	@OnMessage
	public void onMessage(String message, Session session) throws Exception {
		
		
		synchronized (clients) {
			for(Session each : clients) {
				if(each != session) {
					String name = loginSession.getLastName();
					System.out.println(name);
					each.getBasicRemote().sendText(name+":"+message);
				}
			}
		}
	}
	@OnOpen
	public void onOpen(Session session, EndpointConfig ec) {
		HttpSession hsession = (HttpSession)ec.getUserProperties().get("httpSession");
		loginSession = (MemberDTO)hsession.getAttribute("mem");
		clients.add(session);
	
	}
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("¿¬°á²÷¾îÁü");
	}
}