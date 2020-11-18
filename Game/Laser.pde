public class Laser extends Entity {
    private boolean Active;
    private int speedY;
    public Laser(){
        Active = false;
    }
    public Laser (float x, float y, int speedY) {
        super(181, 42, 42, true,createShape(RECT,x,y,10,30),x,y,15);
        Active = true;
        this.speedY = speedY;
    }
    public void SwitchToinactive(){
        Active = false;
    }

    public boolean CheckIfActive(){
        return Active;
    }
    public void Make_Sound(){

    }
    public void Display(){
        super.MoveY(speedY); 
        if(super.Check_BorderY())
            Active = false;
        super.Display();

    }
}
