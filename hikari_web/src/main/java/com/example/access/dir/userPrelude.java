package com.example.access.dir;


public class userPrelude {
    private String name;
    private String nick;
    private String passWd;
    private String pwVrf;
    private String pref;
    private String suf;

    public userPrelude() {
    }

    public userPrelude(String name, String nick, String passWd, String pwVrf,String pref, String suf) {
   
        this.nick = nick;
        this.passWd = passWd;
        this.pwVrf = pwVrf;
        this.name = name;
        this.pref =  pref;
        this.suf = suf;

    }

 @Override
    public String toString() {
        return String.format(
            "userPrelude[nick='%s', passWd='%s', pwVrf = '%s',  name='%s', pref='%s', suf='%s']",
            nick, passWd, pwVrf, name, pref, suf);
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

public String getPwVrf(){
return pwVrf;
}
public void setPwVrf(String pwVrf){
this.pwVrf = pwVrf;
}

public String getName(){
return name;
}
public void setName(String name){
this.name = name;
}


public String getPref(){
return pref;
}
public void setPref(String pref){
this.pref = pref;
}
public String getSuf(){
return suf;
}
public void setSuf(String suf){
this.suf = suf;
}


//public
}



