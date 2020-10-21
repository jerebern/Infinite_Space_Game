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
        for(Entity entity : entities){  
            entity.Move();
            if(entity.Check_BorderY()){
            float randomX = random(width);
             entity = new Entity(235, 235, 152, false,createShape(ELLIPSE,randomX,0,10,10),0,0,new PVector(0,0));                
            }
        }
    }
    public void Generate(){

        for(int i = 0; i < Max_Star; i++){
        float randomX = random(width);
        float randomY = random(height);
        Entity entity = new Entity(235, 235, 152, false,createShape(ELLIPSE,randomX,randomY,10,10),randomX,randomY,new PVector(0,0));
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
