/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Music.controller;

/**
 *
 * @author DreamRig 2.0
 */
import com.example.Music.model.Music;
import com.example.Music.service.MusicService;
import java.util.List;
import javassist.compiler.ast.Keyword;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MusicController {
 
 @Autowired
 private MusicService service;
 
 @RequestMapping("/")
 public String viewIndexPage(Model model, @Param("keyword") String keyword){
  List<Music> musicList = service.listAll(keyword);
  model.addAttribute("getAllMusic", musicList);
  model.addAttribute("keyword", keyword); /* Search */
  return "index";
 }
 
 @RequestMapping("/new_add")
 public String viewNewMusicForm(Model model) {
  Music music = new Music();
  model.addAttribute("music", music);
  return "insert";
 }
 
 @RequestMapping(value = "/save_music", method = RequestMethod.POST)
 public String addNewMusic(@ModelAttribute("music") Music music) {
  service.create(music);
  return "redirect:/";
 }
 
 @RequestMapping("/edit/{id}")
 public ModelAndView viewEditMusicForm(@PathVariable(name = "id") long id) {
  
  ModelAndView mav = new ModelAndView("update"); 
  Music music = service.updateid(id);
  mav.addObject("music", music);
  return mav; 
 }
 
 @RequestMapping("/delete/{id}")
 public String deleteMusic(@PathVariable(name = "id") long id) {
  
  service.delete(id);
  return "redirect:/";
 }

}

