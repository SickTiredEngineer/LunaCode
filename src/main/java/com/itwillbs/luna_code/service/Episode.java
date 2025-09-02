package com.itwillbs.luna_code.service;

public class Episode {
    private String episode_name;
    private String episode_video_path;

    public Episode(String name, String path) {
        this.episode_name = name;
        this.episode_video_path = path;
    }

    public String getEpisode_name() { return episode_name; }
    public String getEpisode_video_path() { return episode_video_path; }
}