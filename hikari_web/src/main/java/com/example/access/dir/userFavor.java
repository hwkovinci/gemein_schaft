package com.example.access.dir;


public class userFavor {
    private int ouiOuNon;
    private int userId;
    private String titleId;   
   

    public userFavor() {
    }

    public userFavor(int ouiOuNon, int userId, String titleId) {
        this.ouiOuNon = ouiOuNon;
        this.userId = userId;
        this.titleId = titleId;
    }


//@Override
 //   public String toString() {
 //       return String.format(
 //           "userFavor ouiOuNon = %d, userId=%d, titleId='%s'",
 //           ouiOuNon, userId, titleId);
 //   }

public int getFavor(){
return ouiOuNon;
}
public void setFavor(int ouiOuNon){
this.ouiOuNon = ouiOuNon;
}
public int getUser(){
return userId;
}
public void setUser(int userId){
this.userId = userId;
}
public String getTitle(){
return titleId;
}
public void setTitle(String titleId){
this.titleId = titleId;
}

//public
}



