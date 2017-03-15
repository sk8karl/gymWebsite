package com.karl.service;

import com.karl.Dao.GymDao;
import com.karl.Entity.Gym;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class GymService {

    @Autowired
    @Qualifier("Gymmysql")
    private GymDao gymDao;

    public Collection<Gym> getAllGyms_year(){
        return gymDao.getAllGyms_year();
    }

    public Collection<Gym> getGymByTownId(int t_id) {return this.gymDao.getGymByTownId(t_id); }

    public Collection<Gym> getPricelistOfGym(int G_id) {return this.gymDao.getPricelistOfGym(G_id); }

    public Collection<Gym> getGymsActivitiesById(int G_id) {return this.gymDao.getGymsActivitiesById(G_id); }

    public Collection<Gym> getGymDescriptionById(int g_id) {return this.gymDao.getGymDescriptionById(g_id); }

    public Collection<Gym> getGoogleMapsInfo(int g_id, int t_id) {return this.gymDao.getGoogleMapsInfo(g_id, t_id); }

    public Collection<Gym> getTowns(){
        return gymDao.getTowns();
    }

    public Collection<Gym> getTownById(int t_id){
        return gymDao.getTownById(t_id);
    }

    public Collection<Gym> getGymmaInfoLogo() { return gymDao.getGymmaInfoLogo(); }

    public Collection<Gym> getGeneralGymInfo(int G_id) {return this.gymDao.getGeneralGymInfo(G_id); }

    public void removeGymById(int G_id) {
        this.gymDao.removeGymById(G_id);
    }

    public void updateGym(Gym gym){
        this.gymDao.updateGym(gym);
    }

    public void insertGym(Gym gym) {
        this.gymDao.insertGymToDb(gym);
    }

}
