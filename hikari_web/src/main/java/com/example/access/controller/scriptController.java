package com.example.access;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

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
import com.example.access.dir.userFavor;

@Controller

@RequestMapping("/")

public class scriptController{

private final servi sV;

public scriptController(servi sV){
this.sV=sV;
}
@GetMapping("/sixieme_")

   public String reponse (@RequestParam String want, RedirectAttributes rA, Model model){
  StringBuilder sb = new StringBuilder();
  sb.append("\"");
  sb.append(want);
  sb.append("\"");
  String imdbId = sb.toString(); 
  cle keyChain = new cle();
  int userId = 57;
  keyChain.setKey(userId);
  keyChain.setValue(imdbId);
  String likeOrNot = new String();
  int result = sV.countFav(keyChain);
  if(result == 0){
  likeOrNot = "neutral"; 
  }
  else{
  likeOrNot = "like";
  
  }
  model.addAttribute("oui" , result); 
  model.addAttribute("ouNon", result +1);
  model.addAttribute("want", want);
  model.addAttribute("userId", userId);
  model.addAttribute("lon", likeOrNot);
  plusTitre mD  = sV.movieDetail(imdbId);
  model.addAttribute("movieInfo", mD);
 // rA.addAttribute("want", want );
 // rA.addAttribute("oui", result) ;
 // return new RedirectView("/hikari_web/septieme_");
  return "premiere_";
}
@GetMapping("/septieme_")
 public String manipuler(@RequestParam String title,
                           @RequestParam int bool,
                           @RequestParam int user, Model model){
userFavor uF = new userFavor();
StringBuilder build = new StringBuilder();
build.append("\"");
build.append(title);
build.append("\"");
uF.setFavor(bool);
uF.setUser(user);
uF.setTitle(build.toString());
sV.favorUpdate(uF);
cle keychain = new cle();
keychain.setKey(uF.getUser());
keychain.setValue(uF.getTitle());
String likeOrNot = new String();
int result = sV.countFav(keychain);
  if(result == 0){ 
  likeOrNot = "neutral";
  }
  else{ 
  likeOrNot = "like";
  
  }
model.addAttribute("oui" , result);
model.addAttribute("ouNon", result+1);
model.addAttribute("want", uF.getTitle().substring(1,10));
model.addAttribute("userId", uF.getUser());
model.addAttribute("lon", likeOrNot);
plusTitre mD  = sV.movieDetail(build.toString());
model.addAttribute("movieInfo", mD);
return "premiere_";
}
@PostMapping("/huitieme_")
public ModelAndView submit(@RequestParam String title,
                           @RequestParam int bool,
                           @RequestParam int user) {
 ModelAndView mav = new ModelAndView("redirect:/septieme_");
 mav.addObject("title",title );
 mav.addObject("bool", bool);
 mav.addObject("user", user);
 return mav;
}


/*
@GetMapping("/sixieme_")

   public String imprimer (@RequestParam String id, Model model) throws Exception{
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
ObjectMapper objectMapper = new ObjectMapper();
String actConvert = objectMapper.writeValueAsString(actContainer);
String dirConvert = objectMapper.writeValueAsString(dirContainer);
model.addAttribute("listAct", actConvert);
model.addAttribute("listDir", dirConvert );
//haute
model.addAttribute("aC",actContainer );
model.addAttribute("dC", dirContainer);
plusTitre mD  = sV.movieDetail(imdbId);
model.addAttribute("movieInfo", mD);
//bas
return "troisieme_";
}
*/


}
