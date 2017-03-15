/**
package com.karl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;




@RestController
@RequestMapping(value = "/")
public class EventController {

    @Autowired
    private EventService eventService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView messages() {
        ModelAndView mav = new ModelAndView("index","data", eventService.getAllEvents());
        mav.addObject("alldata", eventService.getAllEvents());
        return mav;
    }

    @RequestMapping(value = "/{E_id}", method = RequestMethod.GET)
    public Event getEventById(@PathVariable("id") int id){
        return eventService.getEventsById(id);
    }

    @RequestMapping(value = "/{E_id}", method = RequestMethod.DELETE)
    public void deleteEventById(@PathVariable("E_id") int id){
        eventService.removeEventById(id);
    }

    @RequestMapping(method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public void deleteEventById(@RequestBody Event event){
        eventService.updateEvent(event);
    }

    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public void insertEvent(@RequestBody Event event){
        eventService.insertEvent(event);
    }
}


**/