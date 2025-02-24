//package kh.lclass.jjapkorea.chat.model.service;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import kh.lclass.jjapkorea.chat.model.dto.ChatRoomDto;
//import kh.lclass.jjapkorea.chat.model.repository.ChatRoomRepository;
//
//@Service
//public class ChatRoomService {
//	@Autowired
//	private ChatRoomRepository chatRoomRepository;
//	
//	
//	public List<ChatRoomDto> findAllRooms(){
//		return chatRoomRepository.findAllRooms();
//	}
//
//	
//	
//	public ChatRoomDto findRoomById(String id) {
//		return chatRoomRepository.findRoomById(id);
//	}
//
//	
//	public int createChatRoomDto(String name) {
//		ChatRoomDto room = ChatRoomDto.create(name);
//		return chatRoomRepository.createChatRoomDto(name);
//	}
//}


package kh.lclass.jjapkorea.chat.model.service;

import kh.lclass.jjapkorea.chat.model.dto.ChatRoomDto;
import kh.lclass.jjapkorea.chat.model.repository.ChatRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatRoomService {

    private final ChatRoomRepository chatRoomRepository;

    @Autowired
    public ChatRoomService(ChatRoomRepository chatRoomRepository) {
        this.chatRoomRepository = chatRoomRepository;
    }

    public List<ChatRoomDto> findAllRooms() {
        return chatRoomRepository.findAllRooms();
    }

    public ChatRoomDto findRoomById(String id) {
        return chatRoomRepository.findRoomById(id);
    }

    public int createChatRoomDto(String name, String writer) {
        return chatRoomRepository.createChatRoomDto(name, writer);
    }
}
