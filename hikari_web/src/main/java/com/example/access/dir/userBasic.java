package com.example.access.dir;


public class userBasic {
    private String nick;
    private String passWd;
   

    public userBasic() {
    }

    public userBasic(String nick, String passWd) {
   
        this.nick = nick;
        this.passWd = passWd;
    }

 @Override
    public String toString() {
        return String.format(
            "userBasic[nick='%s', passWd='%s']",
            nick, passWd);
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


//public
}