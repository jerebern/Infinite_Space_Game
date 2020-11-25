public class Inky extends Enemy {
 
    private int state;
    public Inky (float x, float y) {
        super(1,2,2,3,createShape(ELLIPSE,x,y,50,50),x,y,66, 212, 245,500,25);
        state =  1;
    }
    public void move(){
        switch (state) {
            case 1 :

            super.Attack(1);

            if(random(0, 100) < 0.3){
                //Switch state to suicide until he die
                super.setSpeed(15);
                state  = 2;
            }
            else{
                if(random(1,2) == 1){
                    super.move("left",100);
                }
                else{
                    super.move("right",100);
                }
            }

            break;
            //Suicide
            case 2: 
                super.Attack(1);
                super.move("down",50); 
 

               if(super.Check_BorderY()){
                    println(super.getPosY());
                    print(height);
                       super.Die(); 
                }
            break;
            }
        }


    }

