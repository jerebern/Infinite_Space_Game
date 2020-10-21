TitleScreen titleScreen; 
Background background;
Input input;
void setup() {
    size(1024,768);
    this.titleScreen = new TitleScreen();
    this.background = new Background(0,0,0);

}

void draw() {

    this.background.Display();
    this.background.Animate();
    this.titleScreen.Change_Selection();
    this.titleScreen.Display();

}
