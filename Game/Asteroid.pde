public class Asteroid extends Entity{
    private boolean bouncing;
    private boolean active;
    public Asteroid(){
         this.bouncing = false;
        this.active = false;       
    }
    public Asteroid(float x, float radomRadius){
        super(166, 163, 144,true, createShape(ELLIPSE,x,-1000,radomRadius,radomRadius),x,-1000,radomRadius/2);
        this.bouncing = true;
        this.active = true;
        //TODO add private int for direction in laser for bouncing
    }
    public boolean Check_BorderY(){
         if(this.position.y > height)
            return true;
        else
            return false;

    }
    

    public void Display(){
        super.MoveY(1);
        super.Display();
        if(this.Check_BorderY()){
            active =false;
        }
    }

    public boolean Isactive(){
        return active;
    }

    public boolean Isbouncing(){
        return bouncing;
    }
}
