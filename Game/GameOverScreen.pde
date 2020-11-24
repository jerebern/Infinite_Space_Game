public class GameOverScreen {
    Input input;
    public GameOverScreen () {
        input = new Input();
    }

    public void Display(int score){

       fill(235, 213, 52);
       textSize(90);
       text("GAME OVER ", width /2, 100); 
       text("Score : " + score, width /2, 300); 
    }

    public boolean WaitForAction(){
        if(input.ScanKeybord() == "ACTION"){
            return true;
        }
        return false;
    }


}
