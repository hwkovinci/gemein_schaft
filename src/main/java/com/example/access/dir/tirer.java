package com.example.access.dir;

import java.util.HashSet;

public class tirer {
    private HashSet<String> titlePool ;
    private HashSet<String> actorPool;
    private HashSet<String> directorPool;
   
   

    public tirer() {
    }

    public tirer(HashSet<String> titlePool,HashSet<String> actorPool,HashSet<String> directorPool) {
        this.titlePool = titlePool;
        this.actorPool = actorPool;
        this.directorPool = directorPool;
    }



public HashSet<String> getPooldeTitle(){
return titlePool;
}
public void setPooldeTitle(HashSet<String> titlePool){
this.titlePool = titlePool;
}
public HashSet<String> getPooldeActor(){
return actorPool;
}
public void setPooldeActor(HashSet<String> actorPool){
this.actorPool = actorPool;
}
public HashSet<String> getPooldeDirector(){
return directorPool;
}
public void setPooldeDirector(HashSet<String> directorPool){
this.directorPool = directorPool;
}


//public
}



