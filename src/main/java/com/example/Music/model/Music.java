/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Music.model;

/**
 *
 * @author DreamRig 2.0
 */
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 *
 * @author DreamRig 2.0
 */
@Entity
@Table(name = "tbl_music")
public class Music {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "music_id")
    private Long id;
    
    @Column(name = "music_genre")
    private String genre;
    
    @Column(name = "music_singer")
    private String singer;
    
    @Column(name = "music_name")
    private String name;
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
       public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getSinger() {
        return singer;
    }
    
    public void setSinger(String singer) {
        this.singer = singer;
    }
    
    public String getGenre() {
        return genre;
    }
    
    public void setGenre(String genre) {
        this.genre = genre;
    }
}

