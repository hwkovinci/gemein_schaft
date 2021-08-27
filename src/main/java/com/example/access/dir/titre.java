package com.example.access.dir;

public class titre {
    private String poster;
    private String name;
    private float rating;
    private Double year;
   

    public titre() {
    }

    public titre(String poster, String name, float rating, Double year) {
        this.poster = poster;
        this.name = name;
        this.rating = rating;
        this.year = year;
    }

//    @Override
 //   public String toString() {
 //       return String.format(
 //           "titre[poster='%s', name='%s']",
 //           poster, name);
 //   }


public String getPoster(){
return poster;
}
public void setPoster(String poster){
this.poster = poster;
}
public String getName(){
return name;
} 
public void setName(String name){
this.name = name;
  }
public float getRating(){
return rating;
}
public void setRating(float rating){
this.rating = rating;
  }
public Double getYear(){
return year;
}
public void setYear(Double year){
this.year = year;
  }
//public
}



