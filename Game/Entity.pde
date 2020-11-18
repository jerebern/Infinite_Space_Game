//to do colision boxe 

public class Entity{
    protected color c;
    protected boolean  isSolid;
    protected PShape objectshape;
    private PVector location;
    private PVector acceleration;
    private float radius;
    protected float PosX;
    protected float PosY;

    public Entity(){
    }

    public Entity(int r, int g, int b, boolean isSolid, PShape objectshape,float x, float y) {
        this.c = color(r,g,b);
        this.isSolid = isSolid;
        this.objectshape = objectshape;
        this.PosX = x;
        this.PosY = y;
        this.radius = 0;
       // this.location = new PVector(random(0, width),50);

        //this.acceleration = new PVector();
    }
     
    public Entity(int r, int g, int b, boolean isSolid, PShape objectshape,float x, float y, float radius) {
        this.c = color(r,g,b);
        this.isSolid = isSolid;
        this.objectshape = objectshape;
        this.PosX = x;
        this.PosY = y;
        this.radius = radius;
       // this.location = new PVector(random(0, width),50);

        //this.acceleration = new PVector();
    }
    public boolean CheckifSolid(){
        return this.isSolid;
    }
    public void MoveY(float direction){
        this.objectshape.translate(0,direction);
        this.PosY = this.PosY + direction;
        //location = new PVector(this.objectshape.getVertexX(1),this.objectshape.getVertexY(1));

    }
    public void MoveX(float direction){
                    
        this.objectshape.translate(direction,0);
        this.PosX = this.PosX + direction;
        //location = new PVector(this.objectshape.getVertexX(1),this.objectshape.getVertexY(1));

    }
     public void Display(){
      //   pushMatrix();
        // translate(this.PosX,this.PosY);
        //noStroke();
         //fill(c);
         this.objectshape.setFill(c);
         shape(this.objectshape); 
        // popMatrix();
     }
     public float getPosX(){
         return PosX;
     }
     public float getPosY(){
         return PosY;
     }
     public float getRadius(){
         return radius;
     }     
     public void setPosY(float y){
         this.PosY = y;

     }
     public void setPosX(float x){
         this.PosX = x;

     }
     public void setObjectShape(PShape shape){
         this.objectshape = shape;
     }
     //Check colision with another entity 
     public boolean Check_Colision(Entity entity){
         if((this.PosX < entity.getPosX() - this.radius) && (this.PosY < entity.getPosY() - radius)){
            // print("Colision");
             return true;
         }
         return false;
     }

     public boolean Check_BorderY(){
         if(this.PosY > height || this.PosY < 0)
            return true;
        else 
            return false;
     }  

     public boolean Check_BorderX(){
         if(this.PosX > width || this.PosX < 0)
            return true;
        else 
            return false;
        
     }     
}
