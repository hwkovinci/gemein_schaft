package com.example.access;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;


import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.util.TreeMap;

import com.example.access.service.servi;
import com.example.access.dir.aFaire;
import com.example.access.dir.titre;
import com.example.access.dir.tirer;
import com.example.access.dir.cle;
import com.example.access.dir.carte;
import com.example.access.dir.util;
@Controller

@RequestMapping("/")

public class mainController{

private final servi sV;

public mainController(servi sV){
this.sV=sV;
}

@GetMapping("/deuxieme_")
    public String imprimer (Model model) throws Exception{
int bas = 0;
int count = sV.countGenre();
Map<String, List<titre>> cart = new HashMap<>();
while(bas< count){
List<titre> poster = new ArrayList<>();
String unique = new String();
unique = sV.nameExtract(bas);
poster = sV.mapPoster(bas);
cart.put(unique, poster);
bas += 1;
}
TreeMap<String, List<titre>> sort = new TreeMap<>(cart);

List<carte> rankList  = new ArrayList<>();
 
for (Map.Entry<String, List<titre>> element : cart.entrySet()){
carte ct = new carte();
ct.setGenre(element.getKey());
ct.setRank(element.getValue());
rankList.add(ct);

}
//horizontal
model.addAttribute("poster", sort);
//haute
List<cle> actContainer = new ArrayList<>();
List<cle> dirContainer = new ArrayList<>();
List<tirer> titContainer = new ArrayList<>();
String insure = "";
int cA = sV.countActor() + 20000000;
int cD = sV.countDirector()+ 10000000;
for(int i = 20000000;i < cA ;i++){
cle key = new cle();
String unique = new String();
unique = sV.nameExtract(i);
key.setKey(i);
key.setValue(unique);
actContainer.add(key);
}
for(int j = 10000000; j<cD; j++){
cle key = new cle();
String unique = new String();
unique = sV.nameExtract(j);
key.setKey(j);
key.setValue(unique);
dirContainer.add(key);
}
HashSet<String> tousLesTitre = sV.extractTitle(insure);
for(String ligne : tousLesTitre){
   tirer tr = new tirer();
   tr.setId(ligne);
   HashSet<String> unique = sV.extractTitle(ligne);
   String rst = (String)unique.toArray()[0];

   tr.setName(rst);
   titContainer.add(tr);
}
model.addAttribute("aL", actContainer);
model.addAttribute("dL", dirContainer);
ObjectMapper objectMapper = new ObjectMapper();
String aC = objectMapper.writeValueAsString(actContainer);
String dC = objectMapper.writeValueAsString(dirContainer);
String tC = objectMapper.writeValueAsString(titContainer);
model.addAttribute("actorList", aC);
model.addAttribute("directorList", dC);
model.addAttribute("titleList", tC );
//bas

return "deuxieme_";
}
@GetMapping("/titleJson")
@ResponseBody String tJ()throws Exception{
List<tirer> titContainer = new ArrayList<>();
String insure = "";
HashSet<String> tousLesTitre = sV.extractTitle(insure);
for(String ligne : tousLesTitre){
   tirer tr = new tirer();
   tr.setId(ligne);
   HashSet<String> unique = sV.extractTitle(ligne);
   String rst = (String)unique.toArray()[0];

   tr.setName(rst);
   titContainer.add(tr);
}
ObjectMapper objectMapper = new ObjectMapper();
String tC = objectMapper.writeValueAsString(titContainer);
return tC;

}
//tJ
@GetMapping("/actorJson")
@ResponseBody String aJ()throws Exception{
List<cle> actContainer = new ArrayList<>();
int cA = sV.countActor() + 20000000;
for(int i = 20000000;i < cA ;i++){
cle key = new cle();
String unique = new String();
unique = sV.nameExtract(i);
key.setKey(i);
key.setValue(unique);
actContainer.add(key);
}
ObjectMapper objectMapper = new ObjectMapper();
String aC = objectMapper.writeValueAsString(actContainer);
return aC;

}
//aJ
@GetMapping("/directorJson")
@ResponseBody String dJ()throws Exception{
List<cle> dirContainer = new ArrayList<>();
int cD = sV.countDirector()+ 10000000;
for(int j = 10000000; j<cD; j++){
cle key = new cle();
String unique = new String();
unique = sV.nameExtract(j);
key.setKey(j);
key.setValue(unique);
dirContainer.add(key);
}
ObjectMapper objectMapper = new ObjectMapper();
String dC = objectMapper.writeValueAsString(dirContainer);
return dC;

}
//dJ


}
