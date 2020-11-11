public class Asteroid extends Entity{
    private boolean bouncing;
    private boolean active;
    public Asteroid(){
         this.bouncing = false;
        this.active = false;       
    }
    public Asteroid(float x){
        super(166, 163, 144,true, createShape(RECT,x,-1000,random(25,100),random(25,500)),x,-1000);
        this.bouncing = true;
        this.active = true;
        //TODO add private int for direction in laser for bouncing
    }
    

    public void Display(){
        super.MoveY(1);
        super.Display();
    }

    public boolean Isactive(){
        return active;
    }

    public boolean Isbouncing(){
        return bouncing;
    }
}
