package com.example.access.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.ui.ModelMap;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;

import javax.validation.Valid;

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
import com.example.access.dir.userBasic;

@Controller

@RequestMapping("/")

public class scriptController{

private final servi sV;

public scriptController(servi sV){
this.sV=sV;
}
@GetMapping("/sixieme_")

   public RedirectView reponse (@RequestParam String want, 
                          @RequestParam(required = false)String req,
                          RedirectAttributes rA, Model model){
  StringBuilder sb = new StringBuilder();
  sb.append("\"");
  sb.append(want);
  sb.append("\"");
  String imdbId = sb.toString(); 
  if(req == null){
  return new RedirectView("/hikari_web/login");
  }
  else{
  cle keyChain = new cle();
  keyChain.setKey(Integer.parseInt(req));
  keyChain.setValue(imdbId);
  String likeOrNot = new String();
  int result = sV.countFav(keyChain);
  if(result == 0){
  likeOrNot = "neutral"; 
  }
  else{
  likeOrNot = "like";  
  }
  rA.addAttribute("title", want);
  rA.addAttribute("bool", result );
  rA.addAttribute("user", req ); 
  return new RedirectView("/hikari_web/septieme_");
  }
}
@GetMapping("/septieme_")
 public String manipuler(@RequestParam String title,
                           @RequestParam int bool,
                           @RequestParam int user, Model model)throws Exception{
String a_key = new String();
String a_ref = new String();
String c_key = new String();
String c_ref = new String();
String n_ref = new String();
a_key = "LOGOUT";
a_ref = "deuxieme_";
c_key = "ACCOUNT";
c_ref = "account";
StringBuilder sb___ = new StringBuilder();
sb___.append("deuxieme_?req=");
sb___.append(user);
n_ref = sb___.toString();

String h_ref = new String();
StringBuilder sb_ = new StringBuilder();
sb_.append("/");
sb_.append(user);
h_ref = sb_.toString();
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
  likeOrNot = "https://github.com/notlelis/img-url/blob/main/likeheartbutton/heartwhite.png?raw=true";
  }
  else{ 
  likeOrNot = "https://github.com/notlelis/img-url/blob/main/likeheartbutton/heartred.png?raw=true";
  
  }
 
  model.addAttribute("nr", n_ref);
  model.addAttribute("ak", a_key);
  model.addAttribute("ar", a_ref);
  model.addAttribute("ck", c_key);
  model.addAttribute("cr", c_ref);  

model.addAttribute("rq" , h_ref);  
model.addAttribute("oui" , result);
model.addAttribute("ouNon", result+1);
model.addAttribute("want", uF.getTitle().substring(1,10));
model.addAttribute("userId", uF.getUser());
model.addAttribute("lon", likeOrNot);
String imdbId = build.toString();
plusTitre mD  = sV.movieDetail(imdbId);
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
List<cle> genContainer = new ArrayList<>();
HashSet<Integer> genre = sV.singleInt(imdbId);
Iterator<Integer> iterGenre = genre.iterator();
while(iterGenre.hasNext()){
cle key = new cle();
int genreId = iterGenre.next();
String name  = sV.nameExtract(genreId);
key.setValue(name);
key.setKey(genreId);
genContainer.add(key);
}
model.addAttribute("gC", genContainer );
model.addAttribute("aC", actContainer );
model.addAttribute("dC", dirContainer );

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
//loginscript

@PostMapping("/loginAuth")
public ModelAndView subir(@Valid @ModelAttribute("userBasic") final userBasic uB, 
                    final BindingResult result,
                    ModelMap model) {
 int verifier = sV.extractUser(uB);
 if(verifier == 0){
 ModelAndView mav =   new ModelAndView("redirect:/response");
 mav.addObject("log", 1);
 return mav;
 }
 else{
 ModelAndView mav = new ModelAndView("redirect:/deuxieme_");
 
 mav.addObject("req", verifier);
 return mav;
 }

}
@GetMapping("/login")
  public ModelAndView deformation() {
        userBasic uB = new userBasic();
        return  new ModelAndView("loginPage", "userBasic", uB);
       
    }

}
