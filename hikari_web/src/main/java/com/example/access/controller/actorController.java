package com.example.access;

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

public class actorController{

private final servi sV;

public actorController(servi sV){
this.sV=sV;
}
@GetMapping("/actor/{id}")
    public String imprimer (@PathVariable("id") int id,  Model model) throws Exception{
HashSet<Integer> director =   sV.retourInt(id);
List<cle> dirContainer = new ArrayList<>();
Iterator<Integer> iterDir = director.iterator();
while(iterDir.hasNext()){
 cle key =  new cle();
 int dirId = iterDir.next();
 String name = sV.nameExtract(dirId);
 key.setValue(name);
 key.setKey(dirId);
 dirContainer.add(key);
     }
HashSet<String> title = sV.retourSt(id);
List<tirer> titContainer = new ArrayList<>();
Iterator<String> iterTit = title.iterator();
while(iterTit.hasNext()){
 // StringBuilder sb = new StringBuilder();
  tirer tir = new tirer();
 // sb.append("\"");
  String titId =  iterTit.next();
 // sb.append(titId);
 // sb.append("\"");
  HashSet<String>set = sV.extractTitle(titId);
  String name = (String)set.toArray()[0];
  tir.setName(name);
  tir.setId(titId);
  titContainer.add(tir);
     }

ObjectMapper objectMapper = new ObjectMapper();
String dirConvert = objectMapper.writeValueAsString(dirContainer);
String titConvert = objectMapper.writeValueAsString(titContainer);
model.addAttribute("listDir", dirConvert);
model.addAttribute("listTit", titConvert );
//haute

model.addAttribute("dC",dirContainer );
model.addAttribute("tC", titContainer);


List<plusTitre> chronologie  = sV.timeDetail(id);
Map<String, List<plusTitre>> cart = new HashMap<>();
String unique = sV.nameExtract(id);
cart.put(unique, chronologie);
model.addAttribute("timeInfo", cart);
//bas
return "quatrieme_";
   }

}
