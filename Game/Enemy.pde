public class Enemy extends SpaceShip {
    private int timeSinceLastMove;

    public Enemy (int Damage, int HitPoints, int MaxHitPoints, float Speed, PShape shape, float posX, float posY, int r, int g, int b, int acttackSpeed,float radius) {
        super(Damage,HitPoints,MaxHitPoints,Speed,shape,posX,posY,r,g,b,acttackSpeed,radius);
    }
    public void move(){

    }
    public void move(String direction){
        if(timeSinceLastMove < millis()){
            switch (direction) {
                case "right":
                super.MoveRight();
                break;
                case "left":
                super.MoveLeft();
                break;           
            
        }
        timeSinceLastMove = millis() + 250;
        }
        }
   


}
