package com.example.access.dir;


public class aFaire {
    private String quatre;
    private int trois;
    private float deux;
    private int un;
    private int zero;
   
   

    public aFaire() {
    }

    public aFaire(String quatre, int trois, float deux, int un, int zero) {
        this.quatre = quatre;
        this.trois = trois;
        this.deux = deux;
        this.un = un;
        this.zero = zero;

    }

    @Override
    public String toString() {
        return String.format(
            "aFaire[quatre='%s', trois=%d, deux=%f, un=%d, zero=%d]",
            quatre, trois, deux, un, zero);
    }


public int deZ(){
return zero;
}
public void aZ(int zero){
this.zero = zero;
}
public int deU(){
return un;
} 
public void aU(int un){
this.un = un;
}
public float deD(){
return deux;
}
public void aD(float deux){
this.deux = deux;
}
public int deT(){
return trois;
}
public void aT(int trois){
this.trois = trois;
}
public String deQ(){
return quatre;
} 
public void aQ(String quatre){
this.quatre = quatre;
}

}














