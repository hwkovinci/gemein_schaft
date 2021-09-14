package com.example.access.controller;

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
    public String imprimer (@RequestParam(required = false) String req,Model model) throws Exception{
String href = new String();
String h_ref = new String();
if(req == null){
href = "";
h_ref = "";
}
else{
StringBuilder sb = new StringBuilder();
sb.append("&req=");
sb.append(req);
href = sb.toString();
StringBuilder sb_ = new StringBuilder();
sb_.append("/");
sb_.append(req);
h_ref = sb_.toString();
}
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
model.addAttribute("rq", h_ref);
model.addAttribute("req", href);
model.addAttribute("poster", sort);
//haute
model.addAttribute("actorList", sV.actorJason());
model.addAttribute("directorList", sV.directorJason());
model.addAttribute("titleList", sV.titleJason());
//bas

return "deuxieme_";
}
@GetMapping("/instant")
@ResponseBody List<String> communiquer(@RequestParam  String term) throws Exception{
List<String> result =  sV.melanger(term);
return result;
}


}
