public class Entity{
    protected color c;
    protected boolean  isSolid;
    protected PShape objectshape;
    private PVector location;
    private PVector acceleration;
    private float PosX;
    private float PosY;

    public Entity(){

    }
     
    public Entity(int r, int g, int b, boolean isSolid, PShape objectshape, float x, float y ) {
        this.c = color(r,g,b);
        this.isSolid = isSolid;
        this.objectshape = objectshape;
        this.PosX = x;
        this.PosY = y;
         this.location = new PVector(x,y);
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
         fill(c);
         shape(this.objectshape);

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
         if(this.PosY > height)
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
