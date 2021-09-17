package com.example.access.dir;

public class titre {
    private String poster;
    private String id;
    private String name;
    private float rating;
    private int year;
   

    public titre() {
    }

    public titre(String poster, String id, String name, float rating, int year) {
        this.poster = poster;
        this.id = id;
        this.name = name;
        this.rating = rating;
        this.year = year;
    }

 // @Override
 //   public String toString() {
 //      return String.format(
 //          "titre[poster='%s', id='%s', name= '%']",
 //           poster, name);
 //   }


public String getPoster(){
return poster;
}
public void setPoster(String poster){
this.poster = poster;
}
public String getId(){
return id;
}
public void setId(String id){
this.id = id;
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
public int getYear(){
return year;
}
public void setYear(int year){
this.year = year;
  }
//public
}



