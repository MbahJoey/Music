/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Music.repository;

/**
 *
 * @author DreamRig 2.0
 */
import com.example.Music.model.Music;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MusicRepository extends JpaRepository<Music, Long> {
    
    /* Search */
    @Query("SELECT m FROM Music m WHERE m.name LIKE %?1%"
    + " OR m.singer LIKE %?1%" )
    public List<Music> search(String keyword);
}