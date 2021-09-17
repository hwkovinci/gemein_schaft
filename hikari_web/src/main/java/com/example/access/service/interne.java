package com.example.access.service;

import java.util.List;
import java.util.Map;
import java.util.HashSet;

import com.example.access.dir.aFaire;
import com.example.access.dir.titre;
import com.example.access.dir.tirer;
import com.example.access.dir.plusTitre;
import com.example.access.dir.cle;
import com.example.access.dir.userFavor;
import com.example.access.dir.userBasic;
import com.example.access.dir.userPlus;

public interface interne {
List<aFaire> aF();
String mapPoster(int compte ) throws Exception;
int countGenre();
int countActor();
int countDirector();
String nameExtract(int id);
HashSet<String> extractTitle(String ligne);
HashSet<Integer> retourInt (int compte);
HashSet<String> retourSt(int compte);
List<HashSet<Integer>> doubleInt(String ligne);
HashSet<Integer> singleInt(String ligne);
plusTitre movieDetail(String imdbId);
List<plusTitre> timeDetail (int compte);
int countFav(cle fav);
int extractUser(userBasic uB);
int favorUpdate (userFavor uF);
int signUp (userPlus uP);
List<userPlus> nickFind(userPlus uP);
List<userPlus> pwFind(userPlus uP);
String titleJason() throws Exception;
String actorJason() throws Exception;
String directorJason() throws Exception;
List<String> melanger(String pref) throws Exception;
}
