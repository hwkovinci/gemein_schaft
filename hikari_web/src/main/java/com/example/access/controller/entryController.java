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

import com.example.access.dir.userPrelude;
import com.example.access.dir.userPlus;
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

public class entryController{

private final servi sV;

public entryController(servi sV){
this.sV=sV;
}

@PostMapping("/findProcess/{quel}")
public ModelAndView subir(@Valid @ModelAttribute("userPrelude") final userPrelude uP,
                    @PathVariable("quel") String ql,
                    final BindingResult result) {
 if(ql.equals("nick")){
   userPlus uP_ = new userPlus();
   StringBuilder sb_ = new StringBuilder();
   sb_.append(uP.getPref());
   sb_.append("@");
   sb_.append(uP.getSuf());
   uP_.setName(uP.getName());
   uP_.setEmail(sb_.toString());
   
   List<userPlus> verifier = sV.nickFind(uP_);
   if(verifier.isEmpty()){
     ModelAndView mav = new ModelAndView("redirect:/response");
     mav.addObject("log", "1");
     return mav;

     }
   else{
      ModelAndView mav = new ModelAndView("redirect:/finder");
      StringBuilder sb = new StringBuilder();
      for(userPlus info : verifier){
 
      sb.append("nick ");
      sb.append(info.getNick());
 
       }
      mav.addObject("log", sb.toString());
      return mav;
     //else  
     }
   //nick
   }
 else if(ql.equals("pw")){
	  userPlus uP_ = new userPlus();
	   StringBuilder sb_ = new StringBuilder();
	   sb_.append(uP.getPref());
	   sb_.append("@");
	   sb_.append(uP.getSuf());
	   uP_.setNick(uP.getNick());
	   uP_.setEmail(sb_.toString());
	   
	List<userPlus> verifier = sV.pwFind(uP_); 

    if(verifier.isEmpty()){ 
     ModelAndView mav = new ModelAndView("redirect:/response");
     mav.addObject("log", "1");
     return mav;

     }
    else{
      ModelAndView mav = new ModelAndView("redirect:/finder");
      StringBuilder sb = new StringBuilder();
      for(userPlus info : verifier){
 
      sb.append("pw ");
      sb.append(info.getPassWd());
      sb.append(" ");
      sb.append(info.getEmail());
 
       }
      mav.addObject("log", sb.toString());
      return mav;
  //else
  }
 //pw
 }
 return new ModelAndView("redirect:/login");
}
@GetMapping("/trouver")
  public ModelAndView deformation() {
        userPrelude uP = new userPrelude();
        return new ModelAndView("findPage", "userPrelude", uP);
    }
@PostMapping("/entryProcess")
public ModelAndView subir_(@Valid @ModelAttribute("userPrelude") final userPrelude pld) {
if(pld.getNick().length() == 0 ||
   pld.getPassWd().length() == 0 || 
   pld.getPwVrf().length() == 0 || 
   pld.getName().length() == 0 || 
   pld.getPref().length() == 0 ||
   pld.getSuf().length() == 0    ){
ModelAndView mav = new ModelAndView("redirect:/response");
mav.addObject("log",  0 );
return mav;
}



else if(!pld.getPassWd().equals(pld.getPwVrf()) ){
 ModelAndView mav = new ModelAndView("redirect:/response");
 mav.addObject("log", 4 );
 return mav;
 }
 
else{
 userBasic uB = new userBasic();
 uB.setNick(pld.getNick() );
 uB.setPassWd(pld.getPassWd());
 int verifier = sV.extractUser(uB);



      if(verifier == 0){
      ModelAndView mav = new ModelAndView("redirect:/response");
      userPlus uP = new userPlus();
      StringBuilder sb = new StringBuilder();
      sb.append(pld.getPref());
      sb.append("@");
      sb.append(pld.getSuf());
      uP.setNick(pld.getNick());
      uP.setPassWd(pld.getPassWd());
      uP.setName(pld.getName());
      uP.setEmail(sb.toString());
      int signup = sV.signUp(uP);
      if(signup == 0 ){
         mav.addObject("log", 3);
         return mav;
         }
      }
     else {
     ModelAndView mav = new ModelAndView("redirect:/response");
     mav.addObject("log", 5);
     return mav; 
     }
   

  }
 ModelAndView mav = new ModelAndView("redirect:/response");
 mav.addObject("log",  0 );
 return mav;
}
@GetMapping("/signup")
  public ModelAndView deformation_() {
        userPrelude pld = new userPrelude();
        return new ModelAndView("signupPage", "userPrelude", pld);
    }

@GetMapping("/response")
String repondre(@RequestParam int log, Model model){
String alert = new String();
if(log == 0){
alert = "all of forms must be filled";
model.addAttribute("alert", alert);
return "messageHandler";
}
else if(log == 1){
alert = "There is no matching information";
model.addAttribute("alert", alert );
return "messageHandler";
}

else if(log == 3 ){

return "signup_result";

}
else if(log  == 4){
alert = "passwd not correspond";
model.addAttribute("alert", alert);
return "messageHandler";
  }
else if(log == 5){
alert = "use another passwd";
model.addAttribute("alert", alert);
return "messageHandler";
}
return "deuxieme_";
}
@GetMapping("/finder")
String logArray(@RequestParam String log, Model model){
      String [] bisect = log.split("\\s");
      if(bisect[0].equals("nick")){
      model.addAttribute("nick", bisect[1]);
      return "nickResult";

      }
      else{
      model.addAttribute("pw", bisect[1]);
      model.addAttribute("email", bisect[2]);
      return "pwResult";
      }


   }

}
