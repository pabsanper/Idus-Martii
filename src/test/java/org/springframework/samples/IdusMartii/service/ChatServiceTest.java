package org.springframework.samples.IdusMartii.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.samples.IdusMartii.model.Chat;
import org.springframework.samples.IdusMartii.model.Match;
import org.springframework.stereotype.Service;

@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
public class ChatServiceTest {

    @Autowired
    private MatchService matchService;
    
    @Autowired
    private ChatService ChatService;


    @Test
    public void testFindAll(){
        Iterable<Chat> chatT= ChatService.findAll();
        List <Integer> chat = new ArrayList<>();
		chatT.forEach(l -> chat.add(l.getId()));

        assertEquals(chat.get(0), 1);

    }
    @Test
    public void findById() {
    	Chat chatT = ChatService.findById(1);
        assertNotNull(chatT);


    }
    
    @Test
    public void save() {
    	Chat chat = new Chat();
    	chat.setId(2);
    	Integer i = chat.getId();
    	ChatService.save(chat);
    	Chat chatT = ChatService.findById(i);

        assertNotNull(chatT);


    }
    
    @Test
    public void findByMatch() {
    	Match m = matchService.findById(1);
    	List<Chat> chatT = ChatService.findByMach(m);
    	
    	assertNotNull(chatT);


    }
    
    
   
}
