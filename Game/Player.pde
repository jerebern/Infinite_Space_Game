 public class Player extends SpaceShip{
    private int score;
    private Input input;
    private int lastScoreUpdate;
    public Player () {
       //super(1,3,5,10,createShape(RECT,width/2, height - 100,25,25), width/2, height - 100, 76, 96, 173);
            //triangle(x1,y1,x2,y2,x3,y3)
            //triangle(x1,y1,x2,y2,x3,y3)
            //x3 : (width/2 + 100) * 0.75,height - 250,
            //x2 : width/2 + 100,height - 150
                                                        //x1                       x2                  x3
        
        //tracer a partir de zero
        super(1,3,5,15,createShape(TRIANGLE,width/2, height - 100,width/2 + 50,height - 100,(width/2 + 50) * 0.95,height - 150), width/2, height - 30, 76, 96, 173,250,40);
        lastScoreUpdate = 0;
        score = 0;
        input = new Input();
    }
    private int GetScore(){
        return this.score;
    }
    public void Inc_Score(){
        if(lastScoreUpdate < millis()){
         score = score + 5;
         lastScoreUpdate = millis() + 1000;
        }

    }
    //Move and Shoot 
    private void Actions(){

        if(input.ScanKeybord() == "ACTION")
            Attack(-1);
        
        if(input.ScanKeybord() == "RIGHT")
            MoveRight();
        
        else if(input.ScanKeybord() == "LEFT")
            MoveLeft();
        
        
    }
    public void Display(){
        super.Display();
         fill(235, 213, 52);
         textSize(20);
         text("Score : " + this.score,100,20);
         text("Hit point : " + this.HitPoints,100,40);
    }

}
