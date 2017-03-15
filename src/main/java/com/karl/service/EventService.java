/*
package com.karl.service;

import com.karl.Dao.GymDao;
import com.karl.Entity.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class EventService {

    @Autowired
    @Qualifier("mysql")
    private GymDao eventDao;

    public Collection<Event> getAllEvents(){
        return eventDao.getAllEvents();
    }

    public Event getEventsById(int E_id) {
        return this.eventDao.getEventsById(E_id);
    }

    public void removeEventById(int E_id) {
        this.eventDao.removeEventById(E_id);
    }

    public void updateEvent(Event event){
        this.eventDao.updateEvent(event);
    }

    public void insertEvent(Event event) {
        this.eventDao.insertEventToDb(event);
    }

}
*/