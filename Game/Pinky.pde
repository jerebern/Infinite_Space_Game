public class Pinky extends Enemy {
    private float StartPosition;
    public Pinky (float x,float y) {
        super(1,2,2,3,createShape(ELLIPSE,x,y,50,50),x,y,235, 52, 232,500,25,40);
        StartPosition = x;
    }

    public void move(){
   /*     switch (StartPosition) {
            case 0:
             super.move("left",100);
        
            break;

            case 1:
            super.move("right",100);

            break;
        }*/
    }

}
