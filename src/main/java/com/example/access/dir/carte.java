package com.example.access.dir;

import java.util.List;

public class carte {
    private String genre;
    private List<titre> rank;
   

    public carte() {
    }

    public carte(String genre, List<titre> rank) {
        this.genre = genre;
        this.rank = rank;

    }

//    @Override
 //   public String toString() {
 //       return String.format(
 //           "titre[poster='%s', name='%s']",
 //           poster, name);
 //   }


public String getGenre(){
return genre;
}
public void setGenre(String genre){
this.genre = genre;
}
public List<titre> getRank(){
return rank;
} 
public void setRank(List<titre> rank){
this.rank = rank;
  }
//public
}



