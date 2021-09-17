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
import java.time.*;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.RowMapper; 


import com.example.access.dir.aFaire;
import com.example.access.dir.titre;
import com.example.access.dir.tirer;
import com.example.access.dir.plusTitre;
import com.example.access.dir.cle;
import com.example.access.dir.userFavor;
import com.example.access.dir.userBasic;
import com.example.access.dir.userPlus;

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
String dEcl = new String();
StringBuilder sb = new StringBuilder();
sb.append("SELECT tlst.title_name title_tranche, tlst.title_poster poster,");
sb.append("tlst.title_rating rating,");
sb.append( " tlst.title_year year_tranche, tlst.title_id ttid"); 
sb.append(" FROM title_list tlst, kreuz_gm kzgm WHERE tlst.title_id = kzgm.title_id");
sb.append(" AND kzgm.genre_id =");
sb.append(compte);
sb.append(" ORDER BY tlst.title_rating DESC, tlst.title_year DESC");
sb.append(" fetch first 25 rows only");
dEcl = sb.toString();
return jdbcTemplate.query(dEcl, new ResultSetExtractor <List<titre>>(){
@Override
public List<titre>extractData(ResultSet rs) throws SQLException, DataAccessException{
List<titre> titleList = new ArrayList<>();
while(rs.next()){ 

      titre title = new titre();
      title.setId(rs.getString("ttid"));
      title.setName(rs.getString("title_tranche"));
      title.setPoster(rs.getString("poster"));
      title.setRating(rs.getFloat("rating"));
      title.setYear(rs.getInt("year_tranche"));
      titleList.add(title);
      
    }
//while next
return titleList;
//extractor
  }
//query
});
//fin
}
public List<plusTitre>chronologie (int compte){
String dEcl = new String();

if(compte >= 10000000 && compte < 20000000 ){
StringBuilder sb = new StringBuilder();
sb.append("select kzdm.director_id tranche,");
sb.append(" tlst.title_id ttid, tlst.title_name ttnm, tlst.title_rating ttrt,");
sb.append(" tlst.title_year ttyr, tlst.title_released ttrl, tlst.title_runtime ttrtm,");
sb.append(" tlst.title_plot ttplt, tlst.title_country ttct, tlst.title_poster ttpst");
sb.append(" FROM title_list tlst, kreuz_dm kzdm WHERE tlst.title_id = kzdm.title_id ");
sb.append("AND kzdm.director_id = ");
sb.append(compte);
sb.append(" ORDER BY tlst.title_released DESC");
dEcl = sb.toString();
}
if(compte >=  20000000 ){
StringBuilder sb = new StringBuilder();
sb.append("select kzam.actor_id tranche,");
sb.append(" tlst.title_id ttid, tlst.title_name ttnm, tlst.title_rating ttrt,");
sb.append(" tlst.title_year ttyr, tlst.title_released ttrl, tlst.title_runtime ttrtm,");
sb.append(" tlst.title_plot ttplt, tlst.title_country ttct, tlst.title_poster ttpst");
sb.append(" FROM title_list tlst, kreuz_am kzam WHERE tlst.title_id = kzam.title_id ");
sb.append("AND kzam.actor_id = ");
sb.append(compte);
sb.append(" ORDER BY tlst.title_released DESC");
dEcl = sb.toString();
}
return jdbcTemplate.query(dEcl, new ResultSetExtractor <List<plusTitre>>(){
@Override
public List<plusTitre>extractData(ResultSet rs) throws SQLException, DataAccessException{
List<plusTitre> titleList = new ArrayList<>();
while(rs.next()){
      plusTitre title = new plusTitre();
      title.setId(rs.getString("ttid"));
      title.setName(rs.getString("ttnm"));
      title.setRating(rs.getFloat("ttrt"));
      title.setYear(rs.getInt("ttyr"));
String time  = rs.getDate("ttrl").toString();
LocalDate ld =  LocalDate.parse(time);
title.setReleased(ld);
      title.setRuntime(rs.getString("ttrtm"));
      title.setPlot(rs.getString("ttplt"));
      title.setCountry(rs.getString("ttct"));
      title.setPoster(rs.getString("ttpst"));
      titleList.add(title);
      
    }
//while next
return titleList;
//extractor
  }
//query
});
//fin
}

public plusTitre nonTranche (String imdbId){
String dEcl = new String();
StringBuilder sb = new StringBuilder();
sb.append("SELECT title_id, title_name, title_rating, title_year, title_released, title_runtime,");
sb.append("title_plot, title_country, title_poster");
sb.append(" FROM title_list  WHERE title_id ='");
sb.append(imdbId);
sb.append("'");
dEcl = sb.toString();
return jdbcTemplate.query(dEcl, new ResultSetExtractor <plusTitre>(){
@Override
public plusTitre extractData(ResultSet rs) throws SQLException, DataAccessException{
plusTitre title = new plusTitre();
while(rs.next()){
      title.setId(rs.getString("title_id"));
      title.setName(rs.getString("title_name"));
      title.setRating(rs.getFloat("title_rating"));
      title.setYear(rs.getInt("title_year"));
String time  = rs.getDate("title_released").toString();      
LocalDate ld =  LocalDate.parse(time);
title.setReleased(ld);
      title.setRuntime(rs.getString("title_runtime"));
      title.setPlot(rs.getString("title_plot"));
      title.setCountry(rs.getString("title_country"));
      title.setPoster(rs.getString("title_poster"));
    }
//while next
return title;
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
public int compteDuFavor(cle fav){
String dEcl = new String();
StringBuilder sb = new StringBuilder();
sb.append("SELECT COUNT(*) compte FROM movie_fav");
sb.append(" where title_id ='");
sb.append(fav.getValue());
sb.append("'");
sb.append(" and user_id =");
sb.append(fav.getKey());
dEcl = sb.toString();
return jdbcTemplate.query(dEcl, new ResultSetExtractor <Integer>(){
@Override
public Integer extractData(ResultSet rs) throws SQLException, DataAccessException{
int count = 0;
List<Integer> positive = new ArrayList<Integer>();
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
public int verifier(userBasic uB){
String dEcl = new String();
StringBuilder sb = new StringBuilder();
sb.append("SELECT user_id compte FROM user_list");
sb.append(" where user_nick ='");
sb.append(uB.getNick());
sb.append("'");
sb.append(" and user_passwd ='");
sb.append(uB.getPassWd());
sb.append("'");
dEcl = sb.toString();
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
 sb.append(" from director_list dlst, kreuz_dm kzdm");
 sb.append(" where dlst.director_id = kzdm.director_id");
 sb.append(" and kzdm.title_id");
 sb.append(" in(select kztid");
 sb.append(" from(select kzam.title_id kztid");
 sb.append(" from kreuz_am kzam where kzam.actor_id =");
 sb.append(intId);
 sb.append("))");
 dEcl = sb.toString();
}
if(intId >= 10000000 && intId < 20000000 ){
 StringBuilder sb = new StringBuilder();
 sb.append("select alst.actor_id uq");
 sb.append(" from actor_list alst, kreuz_am kzam");
 sb.append(" where alst.actor_id = kzam.actor_id");
 sb.append(" and kzam.title_id");
 sb.append(" in(select kztid");
 sb.append(" from(select kzdm.title_id kztid");
 sb.append(" from kreuz_dm kzdm where kzdm.director_id =");
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
if(intId >= 10000000 && intId < 20000000 ){
 StringBuilder sb = new StringBuilder();
 sb.append("select tlst.title_id uq");
 sb.append(" from title_list tlst, kreuz_dm kzdm");
 sb.append(" where tlst.title_id = kzdm.title_id");
 sb.append(" and kzdm.director_id =");
 sb.append(intId);
 dEcl = sb.toString();
}
if(intId >= 20000000 ){
 StringBuilder sb = new StringBuilder();
 sb.append("select tlst.title_id uq");
 sb.append(" from title_list tlst, kreuz_am kzam");
 sb.append(" where tlst.title_id = kzam.title_id");
 sb.append(" and kzam.actor_id =");
 sb.append(intId);
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
 sb.append(" from kreuz_am kzam, kreuz_dm kzdm ");
 sb.append("where kzam.title_id ='");
 sb.append(imdbId);
 sb.append("'\n");
 sb.append(" AND");
 sb.append(" kzdm.title_id ='");
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
public HashSet<Integer> tupIntBySt_ (String imdbId){
 String dEcl = new String();
 StringBuilder sb = new StringBuilder();
 sb.append("select kzgm.genre_id genre");
 sb.append(" from kreuz_gm kzgm");
 sb.append(" where kzgm.title_id ='");
 sb.append(imdbId);
 sb.append("'");
 dEcl = sb.toString();
return jdbcTemplate.query(dEcl, new ResultSetExtractor <HashSet<Integer>>(){
@Override
public HashSet<Integer> extractData(ResultSet rs) throws SQLException, DataAccessException{

HashSet<Integer> uniqueG = new HashSet<>();
while(rs.next()){
int rst = rs.getInt("genre");
uniqueG.add(rst);;
//while
}

return uniqueG;
//extractor
}
//query
});
//fin
}
public int renouveler(userFavor uF){  
    String dEcl= new String();
    if(uF.getFavor()%2 == 0){
    StringBuilder sb = new StringBuilder();
    sb.append("delete from movie_fav");
    sb.append(" where title_id = ?");
    sb.append(" and user_id = ?");
    dEcl = sb.toString();
    }
    else{
    StringBuilder sb = new StringBuilder();
    sb.append("insert into movie_fav");
    sb.append(" values(?, ?)");
    dEcl = sb.toString();    
    }
    
    return jdbcTemplate.execute(dEcl,new PreparedStatementCallback<Integer>(){  
    @Override  
    public Integer doInPreparedStatement(PreparedStatement ps)  
            throws SQLException, DataAccessException {  
        Connection conn = ps.getConnection();
        conn.setAutoCommit(false);      
        ps.setString(1, uF.getTitle());  
        ps.setInt(2, uF.getUser());
        ps.executeUpdate();  
        conn.commit();
        conn.setAutoCommit(true);      
        return 0;  
              
    }  
    });  
}  

public int abonner(userPlus uP){
    String dEcl= new String();
    StringBuilder sb = new StringBuilder();
    sb.append("insert into user_list");
    sb.append(" values(qu_enz.nextval, ?, ?, ?, ?)");
    dEcl = sb.toString();

    return jdbcTemplate.execute(dEcl,new PreparedStatementCallback<Integer>(){
    @Override
    public Integer doInPreparedStatement(PreparedStatement ps)
            throws SQLException, DataAccessException {
        Connection conn = ps.getConnection();
        conn.setAutoCommit(false);
        ps.setString(1, uP.getName());
        ps.setString(2, uP.getNick());
        ps.setString(3, uP.getPassWd());
        ps.setString(4, uP.getEmail());
        ps.executeUpdate();
        conn.commit();
        conn.setAutoCommit(true);
        return 0;

    }
    });
}
  
public List<userPlus> trouverNk(userPlus uP){
 String dEcl = new String();
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT *");
        sb.append(" FROM user_list");
        sb.append(" WHERE user_name='");
        sb.append(uP.getName());
        sb.append("'");
        sb.append(" AND user_email='");
        sb.append(uP.getEmail());
        sb.append("'");
        dEcl = sb.toString();

  
 return jdbcTemplate.query(dEcl,new RowMapper<userPlus>(){  
    @Override  
    public userPlus mapRow(ResultSet rs, int rownumber) throws SQLException {  
        userPlus uP =new userPlus();  
        uP.setName(rs.getString(2));  
        uP.setNick(rs.getString(3));  
        uP.setPassWd(rs.getString(4));
        uP.setEmail(rs.getString(5));  
        return uP;  
    }  
    });  
}
public List<userPlus> trouverPw(userPlus uP){
 String dEcl = new String();
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT *");
        sb.append(" FROM user_list");
        sb.append(" WHERE user_nick='");
        sb.append(uP.getNick());
        sb.append("'");
        sb.append(" AND user_email='");
        sb.append(uP.getEmail());
        sb.append("'");
        dEcl = sb.toString();


 return jdbcTemplate.query(dEcl,new RowMapper<userPlus>(){
    @Override
    public userPlus mapRow(ResultSet rs, int rownumber) throws SQLException {
        userPlus uP =new userPlus();
        uP.setName(rs.getString(2));
        uP.setNick(rs.getString(3));
        uP.setPassWd(rs.getString(4));
        uP.setEmail(rs.getString(5));
        return uP;
    }
    });
} 

public List<cle> assimileAct(String pref){
 StringBuilder sb = new StringBuilder();
 sb.append("\"");
 sb.append(pref.substring(0,1).toUpperCase());
 sb.append(pref.substring(1, pref.length()));
 sb.append("%");
 String dEcl = new String();
        StringBuilder sb_ = new StringBuilder();
        sb_.append("SELECT actor_id, actor_name");
        sb_.append(" FROM actor_list");
        sb_.append(" WHERE actor_name like '");
        sb_.append(sb.toString());
        sb_.append("'");
        dEcl = sb_.toString();


 return jdbcTemplate.query(dEcl,new RowMapper<cle>(){
    @Override
    public cle mapRow(ResultSet rs, int rownumber) throws SQLException {
        cle chaine  =new cle();
        chaine.setKey(rs.getInt(1));
        chaine.setValue(rs.getString(2));
        return chaine;
    }
    });
}
public List<cle> assimileDir(String pref){
 StringBuilder sb = new StringBuilder();
 sb.append("\"");
 sb.append(pref.substring(0,1).toUpperCase());
 sb.append(pref.substring(1, pref.length()));
 sb.append("%");
 String dEcl = new String();
        StringBuilder sb_ = new StringBuilder();
        sb_.append("SELECT director_id, director_name");
        sb_.append(" FROM director_list");
        sb_.append(" WHERE director_name like '");
        sb_.append(sb.toString());
        sb_.append("'");
        dEcl = sb_.toString();


 return jdbcTemplate.query(dEcl,new RowMapper<cle>(){
    @Override
    public cle mapRow(ResultSet rs, int rownumber) throws SQLException {
        cle chaine  =new cle();
        chaine.setKey(rs.getInt(1));
        chaine.setValue(rs.getString(2));
        return chaine;
    }
    });
}

public List<tirer> assimileTit(String pref){
 StringBuilder sb = new StringBuilder();
 sb.append("\"");
 sb.append(pref.substring(0,1).toUpperCase());
 sb.append(pref.substring(1, pref.length()));
 sb.append("%");
 String dEcl = new String();
        StringBuilder sb_ = new StringBuilder();
        sb_.append("SELECT title_id, title_name");
        sb_.append(" FROM title_list");
        sb_.append(" WHERE title_name like '");
        sb_.append(sb.toString());
        sb_.append("'");
        dEcl = sb_.toString();


 return jdbcTemplate.query(dEcl,new RowMapper<tirer>(){
    @Override
    public tirer mapRow(ResultSet rs, int rownumber) throws SQLException {
        tirer chaine  =new tirer();
        chaine.setId(rs.getString(1));
        chaine.setName(rs.getString(2));
        return chaine;
    }
    });
}
public String couper (String imdbId){
 String dEcl = new String();
 StringBuilder sb = new StringBuilder();
 sb.append("select json_value(po_document, '$.Plot') plot");
 sb.append(" from an_schaffung where");
 sb.append(" json_value(po_document, '$.imdbID') ='");
 sb.append(imdbId);
 sb.append("'");
 dEcl = sb.toString();
return jdbcTemplate.query(dEcl, new ResultSetExtractor <String>(){
@Override
public String extractData(ResultSet rs) throws SQLException, DataAccessException{

List<String> plt = new ArrayList<>();
while(rs.next()){
String rst = rs.getString("plot");
plt.add(rst);;
//while
}
	if(plt.isEmpty()==true){
	return "";
	}
	else{
	return plt.get(0);
	}

//extractor
}
//query
});
//fin
}





}
