public class SpaceShip extends Entity{
    private int MaxLaser;
    private int Damage;
    protected int HitPoints;
    private int MaxHitPoints;
    private boolean Alive;
    private float Speed;
    private Laser[] lasers;
    private int timeSinceLastattack;
    private int acttackSpeed;

    public SpaceShip (){
    this.lasers = new Laser[MaxLaser];    
        for(int i = 0; i < MaxLaser; i++){
                 lasers[i] = new Laser();
         }
          this.timeSinceLastattack = 0;
        Alive = true;
    }
      
    public SpaceShip (int Damage, int HitPoints, int MaxHitPoints, float Speed, PShape shape, float posX, float posY, int r, int g, int b, int acttackSpeed,float radius){
        super(r, g, b, true, shape, posX, posY,radius);
        this.Damage = Damage;
        this.Alive = true;
        this.HitPoints = HitPoints;
        this.MaxHitPoints = MaxHitPoints;
        this.Speed = Speed;
        this.MaxLaser = 3;
        this.lasers = new Laser[MaxLaser];
        this.timeSinceLastattack = 0;
        this.acttackSpeed = acttackSpeed;

        for(int i = 0; i < MaxLaser; i++){
                lasers[i] = new Laser();
         }
        
    }   
    public void CheckifHit(Laser lasers[]){
        if(Alive){

        for(Laser laser : lasers){
        if(laser.CheckIfActive() && super.Check_Colision(laser)){
            this.TakeHit();
            laser.SwitchToinactive();
        }
        }
        }
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
    public void Attack(int direction){
      //  println("POW POW");
      if(Alive){
        if(timeSinceLastattack < millis()){
         for(int i = 0; i < MaxLaser; i++){
             if(!lasers[i].CheckIfActive()){
                 lasers[i] = new Laser(this.position.x + 20, this.position.y - 125,10 * direction);
                 timeSinceLastattack = millis() + acttackSpeed;
                 break;
             }

         }
        }
      }

    }
    public void Attack(){

    }
    public Laser[] getLasers(){
        return lasers;
    }
    public void Display(){
        if(Alive){
         super.Display();
        }
        for(int i = 0; i < MaxLaser; i++){
            if(lasers[i].CheckIfActive()){
                lasers[i].Display();
            }
         }

    }


}