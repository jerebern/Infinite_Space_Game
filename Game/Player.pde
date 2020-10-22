public class Player extends SpaceShip{
    private int Score;
    private Input input;
    public Player () {

        super(1,3,5,5,createShape(RECT,width/2, height - 100,25,25), width/2, height - 100, 76, 96, 173);
        Score = 0;
        input = new Input();
    }
    private int GetScore(){
        return this.Score;
    }
    //Move and Shoot 
    private void Actions(){

        if(input.ScanKeybord() == "ACTION")
            Attack();
        
        if(input.ScanKeybord() == "RIGHT")
            MoveRight();
        
        if(input.ScanKeybord() == "LEFT")
            MoveLeft();
        
        
    }

}
