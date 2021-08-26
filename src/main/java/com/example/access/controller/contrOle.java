package com.example.access;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

import com.example.access.service.servi;
import com.example.access.dir.aFaire;
import com.example.access.dir.titre;
import com.example.access.dir.cle;
@Controller

@RequestMapping("/")

public class contrOle{

private final servi sV;

public contrOle(servi sV){
this.sV=sV;
}
/*
@GetMapping("/premiere")
    public String chAmp (Model model){
List<aFaire> aF = sV.aF();
model.addAttribute("coffees", aF);
return "premiere";
}
*/
@GetMapping("/deuxieme")
    public String imprimer (Model model){
int bas = 0;
int count = sV.countGenre();
Map<String, List<titre>> cart = new HashMap<>();
while(bas< count){
List<titre> poster = new ArrayList<>();
String unique = new String();
unique = sV.nameExtract(bas);
poster = sV.mapPoster(bas);
cart.put(unique, poster);
bas +=1;
}
//horizontal
model.addAttribute("poster", cart);
return "deuxieme";
}
@GetMapping("/troisieme")
    public String recherche (Model model) throws Exception {
List<cle> contenir = new ArrayList<>();
List<titre> contenirT = new ArrayList<>();
String insure = "";
int cA = sV.countActor() + 20000000;
int cD = sV.countDirector()+ 10000000;
for(int i = 20000000;i < cA ;i++){
cle key = new cle();
String unique = new String();  
unique = sV.nameExtract(i);
key.setKey(i);
key.setValue(unique);
contenir.add(key);
}
for(int j = 10000000; j<cD; j++){
cle key = new cle();
String unique = new String();
unique = sV.nameExtract(j);
key.setKey(j);
key.setValue(unique);
contenir.add(key);
}
HashSet<String> tousLesTitre = sV.extractTitle(insure);
for(String ligne : tousLesTitre){
   titre tr = new titre();
   tr.setName(ligne);
   HashSet<String> unique = sV.extractTitle(ligne);
   String rst = (String)unique.toArray()[0];
    
   tr.setPoster(rst);
   contenirT.add(tr);
}
ObjectMapper objectMapper = new ObjectMapper();
String convert = objectMapper.writeValueAsString(contenir);
String converT = objectMapper.writeValueAsString(contenirT);
model.addAttribute("LisT", converT);
model.addAttribute("List", convert );
return "troisieme";
}
//haute






}
