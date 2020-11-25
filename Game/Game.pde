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
private Enemy[] enemies;
private int maxEnemies;
private Asteroid asteroid;
private boolean DebugMode = true;
public void setup() {
    gameState = GameState.TITLESCREEN;
    size(1024,768);
    this.titleScreen = new TitleScreen();
    this.background = new Background(0,0,0);
    surface.setTitle("Infinite Space Game!");
    gameOverScreen = new GameOverScreen();
    maxEnemies = 10;
}

//reset the game HERE
public void init_Game(){
    asteroid = new Asteroid(random(0,width));
    player = new Player();
    enemies = new Enemy[maxEnemies];

    for(int i = 0; i < maxEnemies; i++){
       enemies[i] = Generate_Enemy();
    }
    //init enemies 
    
}
public Enemy Generate_Enemy(){
    Enemy enemy;
   // ennemy = new Clyde(random(0,width),175);
    float RdnEnemy = random( 0 ,100);
    if(RdnEnemy < 50){
        enemy = new Clyde(random(0,width),175);
    }
    else{
        enemy = new Inky(random(0,width),140);
    }
    return enemy;

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
        init_Game();

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
    for(int i = 0; i < maxEnemies; i++){
     enemies[i].Display();
     enemies[i].move();
     enemies[i].Attack();
     player.CheckifHit(enemies[i].getLasers());
     enemies[i].CheckifHit(player.getLasers());
    }
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
