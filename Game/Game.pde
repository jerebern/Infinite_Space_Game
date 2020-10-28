private enum GameState{
    TITLESCREEN,
    INGAME,
    ENDED,
    QUIT
}
GameState gameState;
TitleScreen titleScreen; 
Background background;
Input input;
Player player;
boolean DebugMode = true;
void setup() {
    player = new Player();
    gameState = GameState.TITLESCREEN;
    size(1024,768);
    this.titleScreen = new TitleScreen();
    this.background = new Background(0,0,0);
    surface.setTitle("Infinite Space Game!");

}
// main loop
void draw() {
    if(DebugMode)
    surface.setTitle("Infinite Space game Debug Mode X : " + mouseX  + " Y :"+ mouseY + " KEY PRESSED " + key);

    //Background need to be here in every state 
    this.background.Display();
    this.background.Animate();

    switch (gameState) {
     case TITLESCREEN:
        this.titleScreen.Change_Selection();
        this.titleScreen.Display(); 
        if(this.titleScreen.SelectSomething() == "PLAY")
            gameState = GameState.INGAME;
        else if(this.titleScreen.SelectSomething() == "EXIT")  
            gameState = GameState.QUIT;
        break;
    case INGAME:

    player.Display();
    player.Actions();

    break;

    case ENDED:

        //show score 
    break;
    case QUIT:
        exit();

    break;
    }
        //reset keyboard buffer

             key ='0';
    
}
