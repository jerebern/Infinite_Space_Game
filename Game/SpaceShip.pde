public class SpaceShip extends Entity{

    private int Damage;
    private int HitPoints;
    private int MaxHitPoints;
    private boolean Alive;
    private float Speed;

    public SpaceShip (){
        Alive = true;

    }
      
    public SpaceShip (int Damage, int HitPoints, int MaxHitPoints, float Speed, PShape shape, float posX, float posY, int r, int g, int b){
        super(r, g, b, true, shape, posX, posY);
        this.Alive = true;
        this.HitPoints = HitPoints;
        this.MaxHitPoints = MaxHitPoints;
        this.Speed = Speed;
    }   

    public int GetHitPoint(){
        return HitPoints;
    }
    //If return false the spaceship is dead 
    public boolean TakeHit(){
        this.HitPoints --;
        if (HitPoints == 0){
            this.Alive = false;
        }
        return this.Alive;
    }
    public void MoveLeft(){
        MoveX(Speed * -1);
        //reverse if return true;
        if(Check_BorderX())
         MoveX(Speed);       
    }
    public void MoveRight(){
        MoveX(Speed);
        //reverse if return true
        if(Check_BorderX())
         MoveX( -1 * Speed);   
    }
    public void Attack(){
        println("POW POW");
    }


}