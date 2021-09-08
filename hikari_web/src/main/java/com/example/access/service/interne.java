package com.example.access.service;

import java.util.List;
import java.util.Map;
import java.util.HashSet;

import com.example.access.dir.aFaire;
import com.example.access.dir.titre;
import com.example.access.dir.userBasic;
import com.example.access.dir.tirer;
import com.example.access.dir.plusTitre;
import com.example.access.dir.cle;
import com.example.access.dir.userFavor;
import com.example.access.dir.userBasic;


public interface interne {
List<aFaire> aF();
List<titre> mapPoster(int compt);
int countGenre();
int countActor();
int countDirector();
String nameExtract(int id);
HashSet<String> extractTitle(String ligne);
HashSet<Integer> retourInt (int compte);
HashSet<String> retourSt(int compte);
List<HashSet<Integer>> doubleInt(String ligne);
plusTitre movieDetail(String imdbId);
List<plusTitre> timeDetail (int compte);
int countFav(cle fav);
int favorUpdate (userFavor uF);
int extractUser(userBasic uB);
}
