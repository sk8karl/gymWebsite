package com.karl.Entity;

/**
 * Created by Karl on 2017-02-27.
 */
public class Gym {

    private int G_id;
    private String gym_name;
    private String logo_path;
    private int price;
    private String category;
    private String activity;
    private String town_area;
    private String town_name;
    private String website;
    private int t_id;
    private String gymma_logo_path;
    private String mapsSearchString;
    private String latitude;
    private String longitude;
    private String description;
    private String price_unit;
    private String BackgroundImagePath;
    private String BackgroundImagePath2;


    public Gym(int G_id, String gym_name, String logo_path, int price, String category, String activity,
               String town_area, String town_name, String website, int t_id, String gymma_logo_path,
               String mapsSearchString, String latitude, String longitude, String description, String price_unit,
               String BackgroundImagePath, String BackgroundImagePath2) {
        this.G_id = G_id;
        this.gym_name = gym_name;
        this.logo_path = logo_path;
        this.price = price;
        this.category = category;
        this.category = activity;
        this.town_area = town_area;
        this.town_name = town_name;
        this.website = website;
        this.t_id = t_id;
        this.gymma_logo_path = gymma_logo_path;
        this.mapsSearchString = mapsSearchString;
        this.latitude = latitude;
        this.longitude = longitude;
        this.description = description;
        this.price_unit = price_unit;
        this.BackgroundImagePath = BackgroundImagePath;
        this.BackgroundImagePath2 = BackgroundImagePath2;
    }

    public Gym() {
    }

    public int getG_id() {
        return G_id;
    }

    public void setG_id(int G_id) {
        this.G_id = G_id;
    }

    public String getLogo_path() {
        return logo_path;
    }

    public void setLogo_path(String logo_path) {
        this.logo_path = logo_path;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getTown_area() {
        return town_area;
    }

    public void setTown_area(String town_area) {
        this.town_area = town_area;
    }

    public String getTown_name() {
        return town_name;
    }

    public void setTown_name(String town_name) {
        this.town_name = town_name;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String getGymma_logo_path() {
        return gymma_logo_path;
    }

    public void setGymma_logo_path(String gymma_logo_path) {
        this.gymma_logo_path = gymma_logo_path;
    }

    public String getGym_name() {
        return gym_name;
    }

    public void setGym_name(String gym_name) {
        this.gym_name = gym_name;
    }

    public String getMapsSearchString() {
        return mapsSearchString;
    }

    public void setMapsSearchString(String mapsSearchString) {
        this.mapsSearchString = mapsSearchString;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice_unit() {
        return price_unit;
    }

    public void setPrice_unit(String price_unit) {
        this.price_unit = price_unit;
    }

    public String getBackgroundImagePath() {
        return BackgroundImagePath;
    }

    public void setBackgroundImagePath(String backgroundImagePath) {
        BackgroundImagePath = backgroundImagePath;
    }

    public String getBackgroundImagePath2() {
        return BackgroundImagePath2;
    }

    public void setBackgroundImagePath2(String backgroundImagePath2) {
        BackgroundImagePath2 = backgroundImagePath2;
    }
}



