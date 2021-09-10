package com.example.access.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.bind.annotation.ResponseBody;

import  javax.servlet.http.HttpServletRequest;

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
import com.example.access.dir.util;
@Controller

@RequestMapping("/")

public class redirController{

private final servi sV;

public redirController(servi sV){
this.sV=sV;
}
@GetMapping("/redirect/{req}")
    public RedirectView imprimer (@PathVariable("req") String req,
                                  @RequestParam String id,
                                  RedirectAttributes rA) {
String[] bisect = id.split("\\s"); 
String retour = new String();
for(int i= 0; i < bisect.length ; i++){
if(bisect[i].equals("actor")){
StringBuilder sb = new StringBuilder();
sb.append("/hikari_web/actor/");
sb.append(bisect[i+1]);
retour = sb.toString();
 }
else if(bisect[i].equals("director")){
StringBuilder sb = new StringBuilder();
sb.append("/hikari_web/director/");
sb.append(bisect[i+1]);
retour = sb.toString();
 }
else if(bisect[i].equals("title")){
StringBuilder sb = new StringBuilder();
sb.append("/hikari_web/title/");
sb.append(bisect[i+1]);
retour = sb.toString();
 }
}
rA.addAttribute("req", req);
return new RedirectView(retour);
}

//fin
@GetMapping("/redirect")
    public RedirectView dupliquer (@RequestParam String id) {
String[] bisect = id.split("\\s");
String retour = new String();
for(int i= 0; i < bisect.length ; i++){
if(bisect[i].equals("actor")){
StringBuilder sb = new StringBuilder();
sb.append("/hikari_web/actor/");
sb.append(bisect[i+1]);
retour = sb.toString();
 }
else if(bisect[i].equals("director")){
StringBuilder sb = new StringBuilder();
sb.append("/hikari_web/director/");
sb.append(bisect[i+1]);
retour = sb.toString();
 }
else if(bisect[i].equals("title")){
StringBuilder sb = new StringBuilder();
sb.append("/hikari_web/title/");
sb.append(bisect[i+1]);
retour = sb.toString();
 }
}
return new RedirectView(retour);
}
}
