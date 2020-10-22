public class Player extends SpaceShip{
    private int Score;
    private Input input;
    public Player () {
        Score = 0;
    }
    private int GetScore(){
        return this.Score;
    }

    //Move and Shoot 
    private void Actions(){

        if(input.ScanKeybord() == "ACTION"){
            //Shoot
        }

        switch(input.ScanKeybord()){

            case "RIGHT" : 
            MoveRight();
            break;

            case "LEFT" :
            MoveLeft();
            break;
        }
    }

}
