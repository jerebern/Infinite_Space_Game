public class Enemy extends SpaceShip {
    private int timeSinceLastMove;
    private int scoreAtKill;

    public Enemy (int Damage, int HitPoints, int MaxHitPoints, float Speed, PShape shape, float posX, float posY, int r, int g, int b, int acttackSpeed,float radius, int scoreAtKill) {
        super(Damage,HitPoints,MaxHitPoints,Speed,shape,posX,posY,r,g,b,acttackSpeed,radius);
        this.scoreAtKill = scoreAtKill;
    }
    public void move(){

    }
    public int getScoreAtKill(){
        return scoreAtKill;
    }
    public void move(String direction, int timeToMove){
        if(timeSinceLastMove < millis()){
            switch (direction) {
                case "right":
                super.MoveRight();
                break;
                case "left":
                super.MoveLeft();
                break;
                case "down":
                super.MoveDown();
                break;
                case "up":
                super.MoveUp();
                break;           
            
        }
        timeSinceLastMove = millis() + timeToMove;
        }
        }
   


}
