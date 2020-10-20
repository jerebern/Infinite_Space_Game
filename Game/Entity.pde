public class Entity{
    protected color c;
    protected boolean  isSolid;
    private PShape objectshape;
    private PVector location;
    private PVector acceleration;

    public Entity(){

    }
     
    public Entity(color c , boolean isSolid, PShape objectshape, float x, float y, PVector acceleration ) {
        this.c = c;
        this.isSolid = isSolid;
        this.objectshape = objectshape;
        this.location = new PVector(x,y);
        this.acceleration = new PVector();

    }
    public boolean CheckifSolid(){

        return this.isSolid;
    }
    public void move(){


    }
     public void Display(){
         fill(c);
         shape(this.objectshape, this.location.x, this.location.y, 0, 0);

     }
}
