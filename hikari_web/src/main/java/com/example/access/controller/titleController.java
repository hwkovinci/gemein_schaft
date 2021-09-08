package com.example.access.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.context.ApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;


import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;

import com.example.access.service.servi;
import com.example.access.dir.aFaire;
import com.example.access.dir.titre;
import com.example.access.dir.tirer;
import com.example.access.dir.cle;
import com.example.access.dir.carte;
import com.example.access.dir.plusTitre;

@Controller

@RequestMapping("/")

public class titleController{

private final servi sV;

public titleController(servi sV){
this.sV=sV;
}
@GetMapping("/title/{id}")

   public String imprimer (@PathVariable("id") String id, Model model) throws Exception{
StringBuilder sb = new StringBuilder();
sb.append("\"");
sb.append(id);
sb.append("\""); 
String imdbId = sb.toString();
List<HashSet<Integer>> actAndDir =  sV.doubleInt(imdbId);
List<cle> actContainer = new ArrayList<>();
Iterator<Integer> iterAct = actAndDir.get(0).iterator();
while(iterAct.hasNext()){
  cle key = new cle();
  int actId =  iterAct.next();
  String name = sV.nameExtract(actId);
  key.setValue(name);
  key.setKey(actId);
  actContainer.add(key);
}
List<cle> dirContainer = new ArrayList<>();
Iterator<Integer> iterDir = actAndDir.get(1).iterator();
while(iterDir.hasNext()){
  cle key = new cle();
  int dirId =  iterDir.next();
  String name = sV.nameExtract(dirId);
  key.setValue(name);
  key.setKey(dirId);
  dirContainer.add(key);

}

model.addAttribute("listAct", sV.actorJason());
model.addAttribute("listDir", sV.directorJason());
model.addAttribute("listTit", sV.titleJason());

//haute
model.addAttribute("aC",actContainer );
model.addAttribute("dC", dirContainer);
plusTitre mD  = sV.movieDetail(imdbId);
model.addAttribute("movieInfo", mD);
//bas
return "troisieme_";
}



}
