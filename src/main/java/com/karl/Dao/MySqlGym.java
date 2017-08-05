package com.karl.Dao;

import com.karl.Entity.Gym;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

@Repository("Gymmysql")
public class MySqlGym implements GymDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static class GymRowMapper implements RowMapper<Gym>{

        @Override
        public Gym mapRow(ResultSet rs, int i) throws SQLException {

            Gym gym = new Gym();

            gym.setG_id(rs.getInt("g_id"));
            gym.setGym_name(rs.getString("gym_name"));
            gym.setLogo_path(rs.getString("logo_path"));
            gym.setPrice(rs.getInt("price"));
            gym.setCategory(rs.getString("category"));
            gym.setActivity(rs.getString("activity"));
            gym.setT_id(rs.getInt("t_id"));
            gym.setPrice_unit(rs.getString("price_unit"));
            return gym;
        }
    }

    @Override
    public Collection<Gym> getAllGyms_year() {
        final String sql = "SELECT gym.g_id, town.t_id, gym.logo_path, pricelist.price_unit, gym.gym_name, gym.website, pricelist.price, pricelist.category, group_concat(DISTINCT activities.activity separator ', ') as activity FROM gym " +
                "JOIN gym_activity ON gym.g_id=gym_activity.g_id " +
                "JOIN activities ON gym_activity.a_id=activities.a_id " +
                "Join pricelist ON gym.g_id=pricelist.g_id " +
                "Join gym_town ON gym.g_id=gym_town.g_id " +
                "Join town ON gym_town.t_id=town.t_id " +
                "AND (pricelist.category='Årskort' OR pricelist.category='Månadskort autogiro' OR pricelist.category='Livsstilsprogram - Bas, dagsavgift') " +
                "GROUP by gym.g_id ";

        List<Gym> gyms = jdbcTemplate.query(sql, new GymRowMapper());

        return gyms;
    }

    @Override
    public Collection<Gym> getGymByTownId(int t_id) {
        final String sql = "SELECT gym.g_id, town.town_name, town.t_id, pricelist.price_unit, gym.logo_path, gym.gym_name, gym.website, pricelist.price, pricelist.category, " +
                "                           group_concat(distinct activities.activity separator ', ') as activity FROM gym " +
                "                            JOIN gym_activity ON gym.g_id=gym_activity.g_id " +
                "                            JOIN activities ON gym_activity.a_id=activities.a_id " +
                "                            Join pricelist ON gym.g_id=pricelist.g_id " +
                "                            Join gym_town ON gym.g_id=gym_town.g_id " +
                "                            Join town ON gym_town.t_id=town.t_id " +
                "                            where town.t_id=? " +
                "                            AND (pricelist.category='Årskort' OR pricelist.category='Månadskort autogiro' OR pricelist.category='Livsstilsprogram - Bas, dagsavgift')" +
                "                            GROUP by gym.gym_name ";

        List<Gym> gyms = jdbcTemplate.query(sql, new RowMapper<Gym>(){
            @Override
            public Gym mapRow(ResultSet rs, int i) throws SQLException {
                Gym gym = new Gym();
                gym.setG_id(rs.getInt("g_id"));
                gym.setGym_name(rs.getString("gym_name"));
                gym.setLogo_path(rs.getString("logo_path"));
                gym.setPrice(rs.getInt("price"));
                gym.setCategory(rs.getString("category"));
                gym.setActivity(rs.getString("activity"));
                gym.setT_id(rs.getInt("t_id"));
                gym.setPrice_unit(rs.getString("price_unit"));

                return gym;
            }
        }, t_id);

        return gyms;
    }


    @Override
    public Collection<Gym> getPricelistOfGym(int g_id) {
        final String sql = "SELECT gym.g_id, pricelist.category, pricelist.price, pricelist.price_unit FROM gym " +
                "                            join pricelist on gym.G_id=pricelist.g_id " +
                "                            join gym_town on gym.G_id=gym_town.g_id " +
                "                            where gym.g_id=?" +
                "                            group by pricelist.category " +
                "                            order by pricelist.price ";

        List<Gym> gym = jdbcTemplate.query(sql, new RowMapper<Gym>() {
            @Override
            public Gym mapRow(ResultSet rs, int i) throws SQLException {
                Gym gym = new Gym();

                gym.setG_id(rs.getInt("g_id"));
                gym.setCategory(rs.getString("category"));
                gym.setPrice(rs.getInt("price"));
                gym.setPrice_unit(rs.getString("price_unit"));
                return gym;
            }
        }, g_id);

        return gym;
    }


//Get activities for a specific gym
    @Override
    public Collection<Gym> getGymsActivitiesById(int g_id) {
        final String sql = "SELECT gym.G_id, group_concat(activities.activity separator ', ') as activity from gym " +
                "JOIN gym_activity on gym.g_id=gym_activity.g_id " +
                "JOIN activities on gym_activity.a_id=activities.a_id " +
                "where gym.g_id=? " +
                "group by gym.G_id";

        List<Gym> gym = jdbcTemplate.query(sql, new RowMapper<Gym>() {
            @Override
            public Gym mapRow(ResultSet rs, int i) throws SQLException {
                Gym gym = new Gym();

                gym.setG_id(rs.getInt("g_id"));

                gym.setActivity(rs.getString("activity"));
                return gym;
            }
        }, g_id);

        return gym;
    }

    @Override
    public Collection<Gym> getGoogleMapsInfo(int g_id, int t_id) {
        final String sql = "SELECT gym.g_id, gym_town.mapsSearchString, town.t_id, town.longitude, town.latitude from gym " +
                "join gym_town on gym.G_id=gym_town.g_id " +
                "join town on gym_town.t_id=town.T_id " +
                "where gym.g_id = ? AND town.t_id = ? ";

        List<Gym> gym = jdbcTemplate.query(sql, new RowMapper<Gym>() {
            @Override
            public Gym mapRow(ResultSet rs, int i) throws SQLException {
                Gym gym = new Gym();

                gym.setG_id(rs.getInt("g_id"));
                gym.setT_id(rs.getInt("t_id"));
                gym.setMapsSearchString(rs.getString("mapsSearchString"));
                gym.setLatitude(rs.getString("latitude"));
                gym.setLongitude(rs.getString("longitude"));

                return gym;
            }
        }, g_id, t_id);

        return gym;
    }

    // Get gymma logo
    @Override
    public Collection<Gym> getGymmaInfoLogo() {
        final String sql = "Select * from general_info ";

        List<Gym> gym = jdbcTemplate.query(sql, new RowMapper<Gym>() {
            @Override
            public Gym mapRow(ResultSet rs, int i) throws SQLException {
                Gym gym = new Gym();
                gym.setGymma_logo_path(rs.getString("gymma_logo_path"));
                gym.setBackgroundImagePath(rs.getString("backgroundImagePath"));
                gym.setBackgroundImagePath2(rs.getString("backgroundImagePath2"));
                return gym;
            }
        });

        return gym;
    }

    //Get genereal gym info

    @Override
    public Collection<Gym> getGeneralGymInfo(int g_id) {
        final String sql = "Select * from gym WHERE gym.g_id=? ";

        List<Gym> gym = jdbcTemplate.query(sql, new RowMapper<Gym>() {
            @Override
            public Gym mapRow(ResultSet rs, int i) throws SQLException {
                Gym gym = new Gym();
                gym.setG_id(rs.getInt("g_id"));
                gym.setWebsite(rs.getString("website"));
                gym.setGym_name(rs.getString("gym_name"));
                gym.setLogo_path(rs.getString("logo_path"));
                return gym;
            }
        }, g_id);

        return gym;
    }

    @Override
    public Collection<Gym> getTowns() {
        final String sql = "SELECT * from town";

        List<Gym> gym = jdbcTemplate.query(sql, new RowMapper<Gym>() {
            @Override
            public Gym mapRow(ResultSet rs, int i) throws SQLException {
                Gym gym = new Gym();

                gym.setTown_name(rs.getString("town_name"));
                gym.setT_id(rs.getInt("t_id"));

                return gym;
            }
        });

        return gym;
    }

    @Override
    public Collection<Gym> getTownById(int t_id) {
        final String sql = "SELECT * from town where town.t_id = ? ";

        List<Gym> gym = jdbcTemplate.query(sql, new RowMapper<Gym>() {
            @Override
            public Gym mapRow(ResultSet rs, int i) throws SQLException {
                Gym gym = new Gym();

                gym.setTown_name(rs.getString("town_name"));
                gym.setT_id(rs.getInt("t_id"));
                gym.setLatitude(rs.getString("latitude"));
                gym.setLongitude(rs.getString("longitude"));
                return gym;
            }
        }, t_id);

        return gym;
    }

    @Override
    public Collection<Gym> getGymDescriptionById(int g_id) {
        final String sql = "SELECT gym.g_id, membership_info.description from gym " +
                "JOIN membership_info on gym.g_id = membership_info.g_id " +
                "where gym.g_id =? ";

        List<Gym> gym = jdbcTemplate.query(sql, new RowMapper<Gym>() {
            @Override
            public Gym mapRow(ResultSet rs, int i) throws SQLException {
                Gym gym = new Gym();

                gym.setDescription(rs.getString("description"));
                gym.setG_id(rs.getInt("g_id"));

                return gym;
            }
        }, g_id);

        return gym;
    }

    @Override
    public void removeGymById(int g_id) {
        jdbcTemplate.update("DELETE FROM gyms where G_id = ?", g_id);
    }

    @Override
    public void updateGym(Gym gym) {
        final String sql = "UPDATE gym SET name = ?, logo_path = ?, WHERE g_id=?";
        final int g_id = gym.getG_id();
        final String name = gym.getGym_name();
        final String logo_path = gym.getLogo_path();

        
        jdbcTemplate.update(sql, new Object[] {name, logo_path, g_id});

    }

    @Override
    public void insertGymToDb(Gym gym) {
        final String sql = "INSERT INTO gyms (name, logo_path) VALUES (?, ?)";
        final String name = gym.getGym_name();
        final String logo_path = gym.getLogo_path();

        jdbcTemplate.update(sql, new Object[] {name, logo_path});
    }
}
