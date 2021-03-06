//to do colision boxe 

public class Entity{
    protected color c;
    protected boolean  isSolid;
    protected PShape objectshape;
    private float radius;
    //protected float PosX;
    //protected float PosY;
    protected PVector position;

    public Entity(){
                this.position = new PVector();
    }

    public Entity(int r, int g, int b, boolean isSolid, PShape objectshape,float x, float y) {
        this.c = color(r,g,b);
        this.isSolid = isSolid;
        this.objectshape = objectshape;
        this.position = new PVector();
        this.position.x = x;
        this.position.y = y;
       // this.PosX = x;
        //this.PosY = y;
        this.radius = 0;
       // this.location = new PVector(random(0, width),50);

        //this.acceleration = new PVector();
    }
     
    public Entity(int r, int g, int b, boolean isSolid, PShape objectshape,float x, float y, float radius) {
        this.c = color(r,g,b);
        this.isSolid = isSolid;
        this.objectshape = objectshape;
        //this.PosX = x;
       // this.PosY = y;
        this.radius = radius;
        this.position = new PVector();
        this.position.x = x;
        this.position.y = y;
       // this.location = new PVector(random(0, width),50);

        //this.acceleration = new PVector();
    }
    public boolean CheckifSolid(){
        return this.isSolid;
    }
    public void MoveY(float direction){
        this.objectshape.translate(0,direction);
      //  this.PosY = this.PosY + direction;
        this.position.y += direction;
        //location = new PVector(this.objectshape.getVertexX(1),this.objectshape.getVertexY(1));

    }
    public void MoveX(float direction){
                    
        this.objectshape.translate(direction,0);
       // this.PosX = this.PosX + direction;
        this.position.x += direction;
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
         return this.position.x;
     }
     public float getPosY(){
         return this.position.y;
     }
     public float getRadius(){
         return radius;
     }     
     public void setPosY(float y){
         this.position.y= y;

     }
     public void setPosX(float x){
         this.position.x = x;

     }
     public PVector getPosition(){
         return position;
     }
     public void setObjectShape(PShape shape){
         this.objectshape = shape;
     }
     //Possible solution https://processing.org/examples/circlecollision.html
     //Check colision with another entity 
     public boolean Check_Colision(Entity entity){
         PVector distanceVector;
         distanceVector = PVector.sub(this.position, entity.getPosition());
         float distanceVectMag = distanceVector.mag();
         float distanceTocolide = this.radius + entity.getRadius();

         if(distanceTocolide > distanceVectMag){
             println("distanceVectmag= " + distanceVectMag);
             println("distancetoColide=" + distanceTocolide);
             return true;
         }
         return false;
     }

     public boolean Check_BorderY(){
         if(this.position.y > height || this.position.y < 0)
            return true;
        else 
            return false;
     }  

     public boolean Check_BorderX(){
         if(this.position.x > width || this.position.x < 0)
            return true;
        else 
            return false;
        
     }     
}
