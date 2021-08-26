package com.example.access.service;

import com.example.access.dir.aFaire;
import com.example.access.dir.titre;
import com.example.access.repo.cenTrale;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.HashSet;

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

}



