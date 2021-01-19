/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Music.service;

/**
 *
 * @author DreamRig 2.0
 */
import com.example.Music.model.Music;
import com.example.Music.repository.MusicRepository;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MusicService {
 @Autowired
 private MusicRepository repository;
 
 public List<Music> listAll(String keyword){
      if (keyword != null) {
            return repository.search(keyword);
        }
      return repository.findAll();
 }
 
 public void create(Music Music) {
  
  repository.save(Music);
 }
 
 public Music updateid(Long id) {
  
  return repository.findById(id).get();
 }
 
 public void delete(Long id) {
  
  repository.deleteById(id);
 }
}