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

public class directorController{

private final servi sV;

public directorController(servi sV){
this.sV=sV;
}
@GetMapping("/director/{id}")
    public String imprimer (@PathVariable("id") int id,  
                            @RequestParam(required = false) String req,
                               Model model) throws Exception{
String href = new String();
String h_ref = new String();
String h_rel = new String();
String a_key = new String();
String a_ref = new String();
String c_key = new String();
String c_ref = new String();
String n_ref = new String();
if(req == null){
href = "";
h_ref = "";
h_rel = "";
a_key = "LOGIN";
a_ref = "login";
c_key = "SIGN UP";
c_ref = "signup";
n_ref = "deuxieme_";
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
StringBuilder sb__ = new StringBuilder();
sb__.append("?req=");
sb__.append(req);
h_rel = sb__.toString();
a_key = "LOGOUT";
a_ref = "deuxieme_";
c_key = "ACCOUNT";
c_ref = "account";
StringBuilder sb___ = new StringBuilder();
sb___.append("deuxieme_?req=");
sb___.append(req);
n_ref = sb___.toString();
}
HashSet<Integer> actor =   sV.retourInt(id);
List<cle> actContainer = new ArrayList<>();
Iterator<Integer> iterAct = actor.iterator();
while(iterAct.hasNext()){
 cle key =  new cle();
 int actId = iterAct.next();
 String name = sV.nameExtract(actId);
 key.setValue(name);
 key.setKey(actId);
 actContainer.add(key);
     }
HashSet<String> title = sV.retourSt(id);
List<tirer> titContainer = new ArrayList<>();
Iterator<String> iterTit = title.iterator();
while(iterTit.hasNext()){
  tirer tir = new tirer();
  String titId =  iterTit.next();
  HashSet<String>set = sV.extractTitle(titId);
  String name = (String)set.toArray()[0];
  tir.setName(name);
  tir.setId(titId);
  titContainer.add(tir);
     }

//haute
model.addAttribute("nr", n_ref);
model.addAttribute("ak", a_key);
model.addAttribute("ar", a_ref);
model.addAttribute("ck", c_key);
model.addAttribute("cr", c_ref);

model.addAttribute("id", h_rel);
model.addAttribute("rq", h_ref);
model.addAttribute("req", href);
model.addAttribute("aC", actContainer );
model.addAttribute("tC", titContainer);


List<plusTitre> chronologie  = sV.timeDetail(id);
Map<String, List<plusTitre>> cart = new HashMap<>();
String unique = sV.nameExtract(id);
cart.put(unique, chronologie);
model.addAttribute("timeInfo", cart);
//bas
return "cinquieme_";


   }

}

