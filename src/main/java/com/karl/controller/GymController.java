package com.karl.controller;
import com.karl.Entity.Gym;
import com.karl.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@RestController

    @RequestMapping(value = "/")
    public class GymController {
/*
    private static final String PATH = "/error";

    @RequestMapping(value = PATH)
    public String error() {
        return "Det här va inte bra. Aj aj aj. Verkar som att URL:en inte är giltig." + PATH;
    }

    @Override
    public String getErrorPath() {
        return PATH;
    }
*/
    @Autowired
    private GymService gymService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView allgym() {
        ModelAndView mav = new ModelAndView("index","data", gymService.getAllGyms_year());
        mav.addObject("gymData", gymService.getAllGyms_year());
        mav.addObject("towns", gymService.getTowns());
        mav.addObject("gymmaLogo", gymService.getGymmaInfoLogo());
        return mav;
    }

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public ModelAndView map() {
        ModelAndView mav = new ModelAndView("google","data", gymService.getAllGyms_year());
        return mav;
    }

    @RequestMapping(value = "/city={t_id}", method = RequestMethod.GET)
    public ModelAndView allGymTownFilter(@PathVariable("t_id") int id) {
        ModelAndView mav = new ModelAndView("citySelected","data", gymService.getGymByTownId(id));
        mav.addObject("gymData", gymService.getGymByTownId(id));
        mav.addObject("towns", gymService.getTowns());
        mav.addObject("gymmaLogo", gymService.getGymmaInfoLogo());
        mav.addObject("townById", gymService.getTownById(id));

        return mav;
    }

    @RequestMapping(value = "/gym/{g_id}/{t_id}", method = RequestMethod.GET)
    public ModelAndView gymPage(@PathVariable("g_id") int g_id, @PathVariable("t_id") int t_id) {
        ModelAndView mav = new ModelAndView("gymPage","data", gymService.getPricelistOfGym(g_id));
        mav.addObject("priceInfo", gymService.getPricelistOfGym(g_id));
        mav.addObject("gymActivities", gymService.getGymsActivitiesById(g_id));
        mav.addObject("gymmaLogo", gymService.getGymmaInfoLogo());
        mav.addObject("googleMapsInfo", gymService.getGoogleMapsInfo(g_id, t_id));
        mav.addObject("gymInfo", gymService.getGeneralGymInfo(g_id));
        mav.addObject("town_name", gymService.getTownById(t_id));
        mav.addObject("descriptions", gymService.getGymDescriptionById(g_id));
        mav.addObject("towns", gymService.getTowns());
        return mav;
    }

    @RequestMapping(value = "/{g_id}", method = RequestMethod.DELETE)
    public void deleteGymById(@PathVariable("g_id") int id){
        gymService.removeGymById(id);
    }

    @RequestMapping(method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public void deleteGymById(@RequestBody Gym gym){
        gymService.updateGym(gym);
    }

    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public void insertGym(@RequestBody Gym gym){
        gymService.insertGym(gym);
    }
}


