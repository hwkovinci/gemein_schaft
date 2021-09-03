package com.example.access.dir;

import java.time.*;

public class plusTitre {
    private String id;
    private String name;
    private float rating;
    private int year;
    private LocalDate released;
    private String runtime;
    private String plot;
    private String country;
    private String poster;

    public plusTitre() {
    }

    public plusTitre(String id, String name, float rating, int year, LocalDate released, String runtime, String plot, String country, String poster) {
        this.id = id;
        this.name = name;
        this.rating = rating;
        this.year = year;
        this.released = released;
        this.runtime = runtime;
        this.plot = plot;
        this.country = country;
        this.poster = poster;

    }

//    @Override
//   public String toString() {
//       return String.format(
//           "titre[poster='%s', name='%s']",
//           poster, name);
//   }


public String getId(){
return id;
}
public String getName(){
return name;
} 
public float getRating(){
return rating;
}
public int getYear(){
return year;
}
public LocalDate getReleased(){
return released;
}
public String getRuntime(){
return runtime;
}
public String getPlot(){
return plot;
}
public String getCountry(){
return country;
}
public String getPoster(){
return poster;
}
public void setId(String id){
this.id = id;
}
public void setName(String name){
this.name = name;
}
public void setRating(float rating){
this.rating = rating;
}
public void setYear(int year){
this.year = year;
}
public void setReleased(LocalDate released ){
this.released = released;
}
public void setRuntime(String runtime){
this.runtime= runtime;
}
public void setPlot(String plot){
this.plot = plot;
}
public void setCountry(String country ){
this.country = country;
}
public void setPoster(String poster){
this.poster = poster;
}
//public
}



