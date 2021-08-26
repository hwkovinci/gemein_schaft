package com.example.access.dir;

public class titre {
    private String poster;
    private String name;
   
   

    public titre() {
    }

    public titre(String poster, String name) {
        this.poster = poster;
        this.name = name;

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
//public
}



