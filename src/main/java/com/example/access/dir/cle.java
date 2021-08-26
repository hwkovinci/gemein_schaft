package com.example.access.dir;

public class cle {
    private int key;
    private String value;
   
   

    public cle() {
    }

    public cle(int key, String value) {
        this.key = key;
        this.value = value;

    }

  //  @Override
    //public String toString() {
   //     return String.format(
   //         "[%d, %s]",
   //         key, value);
   // }


public int getKey(){
return key;
}
public void setKey(int key){
this.key = key;
}
public String getValue(){
return value;
} 
public void setValue(String value){
this.value = value;
  }
//public
}



