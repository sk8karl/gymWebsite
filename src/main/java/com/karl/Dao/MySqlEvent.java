/*
package com.karl.Dao;

import com.karl.Entity.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

@Repository("mysql")
public class MySqlEvent implements GymDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static class EventRowMapper implements RowMapper<Event>{

        @Override
        public Event mapRow(ResultSet rs, int i) throws SQLException {

            Event event = new Event();

            event.setId(rs.getInt("E_id"));
            event.setTitle(rs.getString("title"));
            event.setLocation(rs.getString("location"));
            event.setDescription(rs.getString("description"));
            event.setWebsite(rs.getString("website"));
            event.setEvent_date(rs.getString("event_date"));
            event.setSignup_deadline(rs.getString("signup_deadline"));
            return event;
        }
    }

    @Override
    public Collection<Event> getAllEvents() {

        final String sql = "SELECT * FROM events";
        List<Event> events = jdbcTemplate.query(sql, new EventRowMapper());
        return events;
    }

    @Override
    public Event getEventsById(int E_id) {
        final String sql = "SELECT * FROM events where id = ?";
        Event event = jdbcTemplate.queryForObject(sql, new EventRowMapper(), E_id);
        return event;
    }

    @Override
    public void removeEventById(int E_id) {
        //final String sql = "DELETE FROM events where id = ?";
        jdbcTemplate.update("DELETE FROM events where id = ?", E_id);
    }

    @Override
    public void updateEvent(Event event) {
        final String sql = "UPDATE events SET title = ?, location = ?, description = ?, website = ?, event_date = ?, signup_deadline = ? WHERE E_id=?";
        final int E_id = event.getId();
        final String title = event.getTitle();
        final String location = event.getLocation();
        final String description = event.getDescription();
        final String website = event.getWebsite();
        final String event_date = event.getEvent_date();
        final String signup_deadline = event.getSignup_deadline();
        jdbcTemplate.update(sql, new Object[] {title, location, description, website, event_date, signup_deadline, E_id});

    }

    @Override
    public void insertEventToDb(Event event) {
        final String sql = "INSERT INTO events (title, location, description, website, event_date, signup_deadline) VALUES (?, ?, ?, ?, ?, ?)";
        final String title = event.getTitle();
        final String location = event.getLocation();
        final String description = event.getDescription();
        final String website = event.getWebsite();
        final String event_date = event.getEvent_date();
        final String signup_deadline = event.getSignup_deadline();

        jdbcTemplate.update(sql, new Object[] {title, location, description, website, event_date, signup_deadline});
    }
}
*/