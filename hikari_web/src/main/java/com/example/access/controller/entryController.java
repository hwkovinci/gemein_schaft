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

@PostMapping("/findProcess")
public ModelAndView subir(@Valid @ModelAttribute("userPlus") final userPlus uP,
                    final BindingResult result) {
 String log = new String();
 List<userPlus> verifier = sV.userFind(uP);
 if(verifier.isEmpty()){
 ModelAndView mav = new ModelAndView("redirect:/response");
 mav.addObject("log", 1);
 return mav;
 }
 else{
 ModelAndView mav = new ModelAndView("redirect:/response");
// for(Userplus info : verifier){
// sV.sendEmail(info.getEmail(), info.getPassWd());
// }
 mav.addObject("log", 2);
 return mav;
 }

}
@GetMapping("/trouver")
  public ModelAndView deformation() {
        userPlus uP = new userPlus();
        return new ModelAndView("findPage", "userPlus", uP);
    }
@PostMapping("/entryProcess")
public ModelAndView subir_(@Valid @ModelAttribute("userPlus") final userPlus uP,
                    final BindingResult result) {
 String log = new String();
 int verifier = sV.signUp(uP);
 if(verifier == 0){
 ModelAndView mav = new ModelAndView("redirect:/login");
 return mav;
 }
 else{
 ModelAndView mav = new ModelAndView("redirect:/response");
// for(Userplus info : verifier){
// sV.sendEmail(info.getEmail(), info.getPassWd());
// }
 mav.addObject("log", 0);
 return mav;
 }

}
@GetMapping("/signup")
  public ModelAndView deformation_() {
        userPlus uP = new userPlus();
        return new ModelAndView("signupPage", "userPlus", uP);
    }

@GetMapping("/response")
@ResponseBody String repondre(@RequestParam int log){
String alert = new String();
if(log == 0 ){
alert = "something went wrong";
}
if(log == 1){
alert = "no record";
}
if(log == 2){
alert = "your passwd has been sent to your resistered email";
}
return alert;
}


}
