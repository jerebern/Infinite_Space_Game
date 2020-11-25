public class Clyde extends Enemy {
    public Clyde (float x, float y) {
        super(1,2,2,3,createShape(ELLIPSE,x,y,50,50),x,y,235, 155, 19,500,25,25);
        
    }
    public void move(){
        float direction = random(0,100);
        if(direction < 33){
            super.move("right",200);
        }
        else {
            super.move("left",200);
        }
    }
    public void Attack(){
        if(random(0,100) < 0.5){
            super.Attack(1);
        }
    }
    


}
