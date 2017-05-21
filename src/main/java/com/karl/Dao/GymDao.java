package com.karl.Dao;

import com.karl.Entity.Gym;

import java.util.Collection;
import java.util.List;

/**
 * Created by Karl on 2017-02-28.
 */
public interface GymDao {
    Collection<Gym> getAllGyms_year();

    Collection<Gym> getPricelistOfGym(int id);

    Collection<Gym> getGymsActivitiesById(int id);

    Collection<Gym> getGymDescriptionById(int g_id);

    Collection<Gym> getTowns();

    Collection<Gym> getTownById(int t_id);

    Collection<Gym> getGymByTownId(int t_id);

    Collection<Gym> getGymByTownIdDaypass(int t_id);

    Collection<Gym> getGoogleMapsInfo(int g_id, int t_id);

    Collection<Gym> getGeneralGymInfo(int g_id);

    Collection<Gym> getGymmaInfoLogo();

    void removeGymById(int id);

    void updateGym(Gym gym);

    void insertGymToDb(Gym gym);
}
