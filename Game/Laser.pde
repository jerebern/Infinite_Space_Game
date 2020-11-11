public class Laser extends Entity {
    private boolean Active;
    private int speedY;
    public Laser(){
        Active = false;
    }
    public Laser (float x, float y, int speedY) {
        super(181, 42, 42, true,createShape(RECT,x,y,10,30),x,y);
        Active = true;
        this.speedY = speedY;
    }

    boolean CheckIfActive(){
        return Active;
    }
    void Make_Sound(){

    }
    public void Display(){
        super.MoveY(speedY);
        if(super.Check_BorderY())
            Active = false;
        super.Display();

    }
}
