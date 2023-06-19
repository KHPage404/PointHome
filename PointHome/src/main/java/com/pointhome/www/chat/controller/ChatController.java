package com.pointhome.www.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pointhome.www.chat.dto.ChatRoom;
import com.pointhome.www.chat.service.face.ChatService;

@Controller
public class ChatController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ChatService chatService;
	
	List<ChatRoom> roomList = new ArrayList<ChatRoom>();
	static int roomNumber = 0;
	
	@RequestMapping(value = "/chat/chatting", method = RequestMethod.GET)
	public void chat(HttpSession session, Model model) {
		
		
	}
	
	// 채팅방페이지
	@RequestMapping("/chat/room")
	public void chatRoom() {
		
	}	
	
	@RequestMapping("/chat/createroom")
	public @ResponseBody List<ChatRoom> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			ChatRoom room = new ChatRoom();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;	
	}
	
	@RequestMapping("/chat/getroom")
	public @ResponseBody List<ChatRoom> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	@RequestMapping("/chat/movechating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params, HttpSession session, Model model) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));

		
		List<ChatRoom> new_list = roomList.stream().filter(o -> o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber")); //쿼리스트링 값을 roomNumber로 사용 
			mv.setViewName("/chat/chatting");
		}else {
			mv.setViewName("/chat/room");
		}
		
		return mv;
		
	}
	
}
