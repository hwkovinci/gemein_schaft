package com.example.access.repo;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.Set;
import java.util.HashSet;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ComponentScan;

import com.example.access.dir.aFaire;
import com.example.access.dir.titre;

public class cenTrale {
private JdbcTemplate jdbcTemplate;


public void setTemplate(JdbcTemplate jdbcTemplate){

this.jdbcTemplate = jdbcTemplate;
}


/*
@Override public int gesTion(maTrice mT)  {
int inD = 0;
matEriaux mt = (matEriaux) mT;
String dEcl = "update COFFEES SET SALES = ? WHERE COF_NAME = ?";
String dEc = "update COFFEES SET TOTAL = TOTAL + ? WHERE COF_NAME = ?";
try(
PreparedStatement dAvance = ceCi.prepareStatement(dEcl);
PreparedStatement lAvance = ceCi.prepareStatement(dEc);

){
ceCi.setAutoCommit(false);
for(Map.Entry<String, Integer>seuIl: mt.deCarte().entrySet()){
dAvance.setInt(1, seuIl.getValue().intValue());
dAvance.setString(2, seuIl.getKey());
dAvance.executeUpdate();
lAvance.setInt(1, seuIl.getValue().intValue());
lAvance.setString(2, seuIl.getKey());
lAvance.executeUpdate();
ceCi.commit();
} 
}catch(SQLException x){
}
return inD;
}//gestion

@Override public int modiFier(maTrice mT){
int inD = 0;
matEriaux mt = (matEriaux) mT;
try(
Statement dEcl = ceCi.createStatement(
ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE
)){
ResultSet quE = dEcl.executeQuery("select price from coffees");
while(quE.next()){
float vaLeur = quE.getFloat("PRICE");
quE.updateFloat("PRICE", vaLeur* mt.deVirgule());
quE.updateRow();

}

}catch(SQLException x){
}
return inD;


}//modifier
@Override public int eliMiner(maTrice mT){
int inD = 0;
matEriaux mt = (matEriaux) mT;
String dEcl = "DELETE FROM COFFEES WHERE COF_NAME = ?";
try(
PreparedStatement dAvance = ceCi.prepareStatement(dEcl);
){
ceCi.setAutoCommit(false);
dAvance.setString(1, mt.deChaine());
dAvance.executeUpdate();

}catch(SQLException x){
}
return inD;
}//eliminer
@Override public int insErer(maTrice mT){
int inD = 0;
matEriaux mt = (matEriaux) mT;
ArrayList<String> dC = mt.deChamp();
try(Statement dEcl = ceCi.createStatement()){
ceCi.setAutoCommit(false);
dEcl.addBatch("INSERT INTO COFFEES VALUES("
+"'"+dC.get(0)+"'"
+","+Integer.valueOf(dC.get(1))
+","+Float.parseFloat(dC.get(2))
+","+Integer.valueOf(dC.get(3))
+","+Integer.valueOf(dC.get(4))
+")"
   );
int[] updateCpimts = dEcl.executeBatch();
ceCi.commit();
ceCi.setAutoCommit(true);

}catch(SQLException x){
}
return inD;
}//inserer
*/
public List<aFaire>insTant(){
String dEcl = "SELECT COF_NAME, SUP_ID, PRICE, SALES, TOTAL FROM COFFEES";
return jdbcTemplate.query(dEcl, new ResultSetExtractor <List<aFaire>>(){
@Override 
public List<aFaire>extractData(ResultSet rs) throws SQLException, DataAccessException{
List<aFaire>chAmp = new ArrayList<aFaire>();
while(rs.next()){


aFaire aF = new aFaire();
aF.aQ(rs.getString("COF_NAME"));
aF.aT(rs.getInt("SUP_ID"));
aF.aD(rs.getFloat("PRICE"));
aF.aU(rs.getInt("SALES"));
aF.aZ(rs.getInt("TOTAL"));
chAmp.add(aF);

}
return chAmp;

}

});
}
public int compte(){
String dEcl = "SELECT COUNT(genre_id) compte FROM genre_list";
return jdbcTemplate.query(dEcl, new ResultSetExtractor <Integer>(){
@Override
public Integer extractData(ResultSet rs) throws SQLException, DataAccessException{
int count = 0;
while(rs.next()){
count += rs.getInt("compte");
//while
}
return count;
//extractor
     }
//query
  });
//fin
}
public List<titre>tranche (int compte){
String dEcl = "SELECT tlst.title_name title_tranche, tlst.title_poster poster, kzgm.genre_id genre_tranche FROM title_list tlst, kreuz_gm kzgm WHERE tlst.title_id = kzgm.title_id ORDER BY tlst.title_rating DESC, kzgm.genre_id ASC";
return jdbcTemplate.query(dEcl, new ResultSetExtractor <List<titre>>(){
@Override
public List<titre>extractData(ResultSet rs) throws SQLException, DataAccessException{
List<titre> titleList = new ArrayList<>();
while(rs.next()){ 
if(rs.getInt("genre_tranche") == compte){
      titre title = new titre();
      title.setName(rs.getString("title_tranche"));
      title.setPoster(rs.getString("poster"));
      titleList.add(title);
      }
    }
//while next
return titleList;
//extractor
  }
//query
});
//fin
}
public String uniqueById (int id){
String dEcl = new String();
if(id <10000000){
   StringBuilder sb = new StringBuilder();
   sb.append("SELECT genre_name uq FROM genre_list WHERE genre_id=");
   sb.append(id);
   dEcl = sb.toString();
   }
if(10000000 <= id && id <20000000){
    StringBuilder sb = new StringBuilder();
   sb.append("SELECT director_name uq FROM director_list WHERE director_id=");
   sb.append(id);
   dEcl = sb.toString();
    }
if(id >= 20000000){
   StringBuilder sb = new StringBuilder();
   sb.append("SELECT actor_name uq FROM actor_list WHERE actor_id=");
   sb.append(id);
   dEcl = sb.toString();
   }
return jdbcTemplate.query(dEcl, new ResultSetExtractor <String>(){
@Override
public String extractData(ResultSet rs) throws SQLException, DataAccessException{
String unique = new String();
while(rs.next()){
unique = rs.getString("uq");
//while
}
return unique;
//extractor
}
//query
});
//fin
}
public HashSet<String> uniqueByIdT (String imdbId){
String dEcl = new String();
 if(imdbId.length() == 0){
 StringBuilder sb = new StringBuilder();
 sb.append("SELECT title_id uq FROM title_list");
 dEcl = sb.toString();
}
 else{
 StringBuilder sb = new StringBuilder();
 sb.append("SELECT title_name uq FROM title_list WHERE title_id='");
 sb.append(imdbId);
 sb.append("'");
 dEcl = sb.toString();
}
return jdbcTemplate.query(dEcl, new ResultSetExtractor <HashSet<String>>(){
@Override
public HashSet<String> extractData(ResultSet rs) throws SQLException, DataAccessException{
HashSet<String> unique = new HashSet<>();
while(rs.next()){
unique.add(rs.getString("uq"));
//while
}
return unique;
//extractor
}
//query
});
//fin
}
public int compteDesActeurs(){
String dEcl = "SELECT COUNT(actor_id) compte FROM actor_list";
return jdbcTemplate.query(dEcl, new ResultSetExtractor <Integer>(){
@Override
public Integer extractData(ResultSet rs) throws SQLException, DataAccessException{
int count = 0;
while(rs.next()){
count += rs.getInt("compte");
//while
}
return count;
//extractor
     }
//query
  });
//fin
}
public int compteDuDirecteurs(){
String dEcl = "SELECT COUNT(director_id) compte FROM director_list";
return jdbcTemplate.query(dEcl, new ResultSetExtractor <Integer>(){
@Override
public Integer extractData(ResultSet rs) throws SQLException, DataAccessException{
int count = 0;
while(rs.next()){
count += rs.getInt("compte");
//while
}
return count;
//extractor
     }
//query
  });
//fin
}
public HashSet<Integer> tupIntById (int intId){
String dEcl = new String();
if(intId >= 20000000){
 StringBuilder sb = new StringBuilder();
 sb.append("select dlst.director_id uq");
 sb.append("from director_list dlst, kreuz_dm kzdm");
 sb.append("where dlst.director_id = kzdm.director_id");
 sb.append("and kzdm.title_id");
 sb.append("in(select kztid");
 sb.append("from(select kzam.title_id kztid");
 sb.append("from kreuz_am kzam where kzam.actor_id =");
 sb.append(intId);
 sb.append("))");
 dEcl = sb.toString();
}
if(intId >= 10000000 && intId < 20000000 ){
 StringBuilder sb = new StringBuilder();
 sb.append("select alst.actor_id uq");
 sb.append("from actor_list alst, kreuz_am kzam");
 sb.append("where alst.actor_id = kzam.actor_id");
 sb.append("and kzam.title_id");
 sb.append("in(select kztid");
 sb.append("from(select kzdm.title_id kztid");
 sb.append("from kreuz_dm kzdm where kzdm.director_id =");
 sb.append(intId);
 sb.append("))");
 dEcl = sb.toString();
}
return jdbcTemplate.query(dEcl, new ResultSetExtractor <HashSet<Integer>>(){
@Override
public HashSet<Integer> extractData(ResultSet rs) throws SQLException, DataAccessException{
HashSet<Integer> unique = new HashSet<>();
while(rs.next()){
int rst = rs.getInt("uq");
unique.add(rst);
//while
}
return unique;
//extractor
}
//query
});
//fin
}
public HashSet<String> tupStById (int intId){
String dEcl = new String();
if(intId >= 20000000){
 StringBuilder sb = new StringBuilder();
 sb.append("select tlst.title_id uq");
 sb.append("from title_list tlst, kreuz_dm kzdm");
 sb.append("where tlst.title_id = kzdm.title_id");
 sb.append("and kzdm.director_id =");
 sb.append(intId);
 dEcl = sb.toString();
}
if(intId >= 10000000 && intId < 20000000 ){
 StringBuilder sb = new StringBuilder();
 sb.append("select tlst.title_id uq");
 sb.append("from title_list tlst, kreuz_am kzam");
 sb.append("where tlst.title_id = kzam.title_id");
 sb.append("and kzam.actor_id ='");
 sb.append(intId);
 sb.append("'");
 dEcl = sb.toString();
}
return jdbcTemplate.query(dEcl, new ResultSetExtractor <HashSet<String>>(){
@Override
public HashSet<String> extractData(ResultSet rs) throws SQLException, DataAccessException{
HashSet<String> unique = new HashSet<>();
while(rs.next()){
String rst = rs.getString("uq");
unique.add(rst);
//while
}
return unique;
//extractor
}
//query
});
//fin
}
public List<HashSet<Integer>> tupIntBySt (String imdbId){
 String dEcl = new String();
 StringBuilder sb = new StringBuilder();
 sb.append("select kzam.actor_id actor , kzdm.director_id director");
 sb.append("from kreuz_am kzam, kreuz_dm kzdm ");
 sb.append("where kzam.title_id ='");
 sb.append(imdbId);
 sb.append("'");
 sb.append("OR");
 sb.append("where kzdm.title_id ='");
 sb.append(imdbId);
 sb.append("'");
 dEcl = sb.toString();
return jdbcTemplate.query(dEcl, new ResultSetExtractor <List<HashSet<Integer>>>(){
@Override
public List<HashSet<Integer>> extractData(ResultSet rs) throws SQLException, DataAccessException{
List<HashSet<Integer>> assymetrie = new ArrayList<>();
HashSet<Integer> uniqueA = new HashSet<>();
HashSet<Integer> uniqueD = new HashSet<>();
while(rs.next()){
int rst_0 = rs.getInt("actor");
int rst_1 = rs.getInt("director");
uniqueA.add(rst_0);
uniqueD.add(rst_1);
//while
}
assymetrie.add(uniqueA);
assymetrie.add(uniqueD);
return assymetrie;
//extractor
}
//query
});
//fin
}

}
