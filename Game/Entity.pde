//to do colision boxe 

public class Entity{
    protected color c;
    private int r;
    private int g;
    private int b;
    protected boolean  isSolid;
    protected PShape objectshape;
    private PVector location;
    private PVector acceleration;
    protected float PosX;
    protected float PosY;

    public Entity(){
    }
     
    public Entity(int r, int g, int b, boolean isSolid, PShape objectshape,float x, float y) {
        this.c = color(r,g,b);
        this.r = r;
        this.g = g;
        this.b = b;
        this.isSolid = isSolid;
        this.objectshape = objectshape;
        this.PosX = x;
        this.PosY = y;
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
     public void setPosY(float y){
         this.PosY = y;

     }
     public void setPosX(float x){
         this.PosX = x;

     }
     public void setObjectShape(PShape shape){
         this.objectshape = shape;
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
