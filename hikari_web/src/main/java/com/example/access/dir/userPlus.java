package com.example.access.dir;


public class userPlus {
    private String name;
    private String nick;
    private String passWd;
    private String email;

    public userPlus() {
    }

    public userPlus(String name, String nick, String passWd, String email) {
   
        this.nick = nick;
        this.passWd = passWd;
        this.name = name;
        this.email = email;

    }

 @Override
    public String toString() {
        return String.format(
            "userBasic[nick='%s', passWd='%s', name='%s', email='%s']",
            nick, passWd, name, email);
    }

public String getNick(){
return nick;
}
public void setNick(String nick){
this.nick = nick;
}


public String getPassWd(){
return passWd;
}
public void setPassWd(String passWd){
this.passWd = passWd;
}
public String getName(){
return name;
}
public void setName(String name){
this.name = name;
}


public String getEmail(){
return email;
}
public void setEmail(String email){
this.email = email;
}


//public
}



