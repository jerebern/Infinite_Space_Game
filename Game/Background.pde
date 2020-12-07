public class Background {
    private int Max_Star;
    private color c;
    private ArrayList <Entity> entities;
    
    public Background (int r,int g, int b) {
        Max_Star = 50;
        this.entities = new ArrayList<Entity>();
        this.c = color(r,g,b,50);
        this.Generate();
    }
    public void Animate(){
        int i = 0;
        int speed = 3;

        for(Entity entity : entities){
            //fait un genre de parallaxe
           if(i > Max_Star - 10) {
                speed = 6;   
            } 
           else if(i > Max_Star/2){
                speed = 4;
            }

            entity.MoveY(speed);
            if(entity.Check_BorderY()){
            float randomX = random(width);
             //tmp to keep track of the position
             entity.setPosX(randomX);  
             entity.setPosY(0);       
             entity.setObjectShape(createShape(ELLIPSE,randomX,0,10,10));       
            }
            i++;
        }
    }
    public void Generate(){

        for(int i = 0; i < Max_Star; i++){
        float randomX = random(width);
        float randomY = random(height);
        Entity entity = new Entity(235, 235, 152, false,createShape(ELLIPSE,0,0,10,10),randomX,randomY);
            entities.add(entity);
        }
    }
    public void Display(){
            background (c);
        for(Entity entity : entities){
            entity.Display();
        }

    }

}
