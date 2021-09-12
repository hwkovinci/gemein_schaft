package com.example.access.service;

import com.example.access.dir.aFaire;
import com.example.access.dir.titre;
import com.example.access.dir.tirer;
import com.example.access.dir.plusTitre;
import com.example.access.dir.cle;
import com.example.access.dir.userFavor;
import com.example.access.dir.userBasic;
import com.example.access.dir.userPlus;

import com.example.access.repo.cenTrale;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.HashSet;
import java.util.ArrayList;

@Service
public class servi implements interne{
private final cenTrale cT;

public servi(cenTrale cT){
this.cT = cT;
}

@Override
public List<aFaire> aF(){
return cT.insTant();
}
public List<titre> mapPoster(int compte ){
return cT.tranche(compte);
}
public int countGenre(){
return cT.compte();
}
public String nameExtract(int id){
return cT.uniqueById(id);
}
public int countActor(){
return cT.compteDesActeurs();
}
public int countDirector(){
return cT.compteDuDirecteurs();
}
public int countFav(cle fav){
return cT.compteDuFavor(fav);
}
public int extractUser(userBasic uB){
return cT.verifier(uB);
}
public HashSet<String> extractTitle(String ligne){
return cT.uniqueByIdT(ligne);
}
public HashSet<Integer> retourInt (int compte){
return cT.tupIntById(compte);
}
public HashSet<String> retourSt(int compte){
return cT.tupStById(compte);
}
public List<HashSet<Integer>> doubleInt(String ligne){
return cT.tupIntBySt(ligne);
}
public HashSet<Integer> singleInt(String ligne){
return cT.tupIntBySt_(ligne);
}
public plusTitre movieDetail(String imdbId){
return cT.nonTranche(imdbId);
}
public List<plusTitre> timeDetail (int compte){
return cT.chronologie(compte);
}
public int favorUpdate (userFavor uF){
return cT.renouveler(uF);
}
public int signUp (userPlus uP){
return cT.abonner(uP);
}
public List<userPlus> pwFind(userPlus uP){
return cT.trouverPw(uP);
}
public List<userPlus> nickFind(userPlus uP){
return cT.trouverNk(uP);
}
public String titleJason() throws Exception {
 List<tirer> titContainer = new ArrayList<>();
 String insure = "";
 HashSet<String> tousLesTitre = cT.uniqueByIdT(insure);
 for(String ligne : tousLesTitre){
    tirer tr = new tirer();
    tr.setId(ligne);
    HashSet<String> unique = cT.uniqueByIdT(ligne);
    String rst = (String)unique.toArray()[0];

    tr.setName(rst);
    titContainer.add(tr);
 }
 ObjectMapper objectMapper = new ObjectMapper();
 String tC = objectMapper.writeValueAsString(titContainer);
return tC;	
}
public String actorJason() throws Exception{
	List<cle> actContainer = new ArrayList<>();
	int cA = cT.compteDesActeurs() + 20000000;
    for(int i = 20000000;i < cA ;i++){
	cle key = new cle();
	String unique = new String();
	unique = cT.uniqueById(i);
	key.setKey(i);
	key.setValue(unique);
	actContainer.add(key);
	}
	ObjectMapper objectMapper = new ObjectMapper();
	String aC = objectMapper.writeValueAsString(actContainer);
	return aC;	
}
public String directorJason() throws Exception{
	List<cle> dirContainer = new ArrayList<>();
	int cA = cT.compteDuDirecteurs() + 20000000;
    for(int i = 20000000;i < cA ;i++){
	cle key = new cle();
	String unique = new String();
	unique = cT.uniqueById(i);
	key.setKey(i);
	key.setValue(unique);
	dirContainer.add(key);
	}
	ObjectMapper objectMapper = new ObjectMapper();
	String dC = objectMapper.writeValueAsString(dirContainer);
	return dC;	
}


}



