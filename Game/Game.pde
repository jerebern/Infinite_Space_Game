private enum GameState{
    TITLESCREEN,
    INGAME,
    ENDED,
    QUIT
}
private GameState gameState;
private GameOverScreen gameOverScreen;
private TitleScreen titleScreen; 
private Background background;
private Input input;
private Player player;
private Enemy ennemy;
private Asteroid asteroid;
private boolean DebugMode = true;
public void setup() {
    player = new Player();
    gameState = GameState.TITLESCREEN;
    size(1024,768);
    this.titleScreen = new TitleScreen();
    this.background = new Background(0,0,0);
    surface.setTitle("Infinite Space Game!");
    ennemy = new Clyde(random(0,width),175);
    asteroid = new Asteroid(random(0,width));
    gameOverScreen = new GameOverScreen();
}
// main loop
public void draw() {
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
     asteroid.Display();
     player.Inc_Score();
     player.Actions();
     player.Display();
     ennemy.Display();
     ennemy.move();
     ennemy.Attack();
     player.CheckifHit(ennemy.getLasers());
     ennemy.CheckifHit(player.getLasers());

     if(!player.getAlive()){
        gameState = GameState.ENDED;
     }
    break;

    case ENDED:
        gameOverScreen.Display(player.GetScore());


        if(gameOverScreen.WaitForAction()){
            gameState = GameState.TITLESCREEN;

        }

        //show score 
    break;
    case QUIT:
        exit();

    break;
    }
        //reset keyboard buffer

             key ='0';
    
}
