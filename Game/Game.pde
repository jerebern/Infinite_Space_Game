TitleScreen titleScreen; 
void setup() {
    size(1024,768);
    this.titleScreen = new TitleScreen();

}

void draw() {
    background (0);
    this.titleScreen.Change_Selection();
    this.titleScreen.Display();
    
}
