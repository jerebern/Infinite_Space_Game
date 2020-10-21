public class Entity{
    protected color c;
    protected boolean  isSolid;
    protected PShape objectshape;
    private PVector location;
    private PVector acceleration;

    public Entity(){

    }
     
    public Entity(int r, int g, int b, boolean isSolid, PShape objectshape, float x, float y, PVector acceleration ) {
        this.c = color(r,g,b);
        this.isSolid = isSolid;
        this.objectshape = objectshape;
        this.location = new PVector(x,y);
        this.acceleration = new PVector();

    }
    public boolean CheckifSolid(){

        return this.isSolid;
    }
    public void Move(){
        this.objectshape.translate(0,1);
       // location = new PVector(this.objectshape.getVertexX(1),this.objectshape.getVertexY(1));

    }
     public void Display(){
         fill(c);
         
         shape(this.objectshape);

     }

     public boolean Check_BorderY(){
         print(objectshape.Y+ "\n");
         if(objectshape.Y > height)
            return true;
        else 
            return false;
     }  

     public boolean Check_BorderX(){
         if(objectshape.X > width)
            return true;
        else 
            return false;
        
     }     
}
