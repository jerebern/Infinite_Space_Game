public class SpaceShip extends Entity{
    private int MaxLaser;
    private int Damage;
    protected int HitPoints;
    private int MaxHitPoints;
    private boolean Alive;
    private boolean particulesDie;
    private int dieAnimationTimer; 
    private float Speed;
    private Laser[] lasers;
    private int timeSinceLastattack;
    private int acttackSpeed;
    private boolean Active;
    private Entity particules[];    
    private boolean flash;
    private int flashtimer;

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
        this.particules = new Entity[11];
        this.dieAnimationTimer = 0;
        this.Active = true;
        this.flash = true;

        for(int i = 0; i < MaxLaser; i++){
                lasers[i] = new Laser();
         }
        
    }   

    public boolean get_particulesDie(){
        return particulesDie;
    }
    public void set_Active(boolean state){
        this.Active = state;
    }
    public boolean get_Active(){
        return this.Active;
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
    public void CheckifHit(SpaceShip spaceship){
        if(Alive){

        if(spaceship.getAlive() && super.Check_Colision(spaceship)){
            this.TakeHit(2);
            this.Die();
        }
        }
    }
    public void CheckifHit(Asteroid asteroid){
        if(Alive){
          
        if(super.Check_Colision(asteroid)){
            this.Die();

        }  
        }
    }

    public int GetHitPoint(){
        return HitPoints;
    }
    public  boolean TakeHit(int damage){
        this.HitPoints = this.HitPoints - damage;
        if (HitPoints <= 0){
            this.Die();
        }
        return this.Alive;
    }
    //If return false the spaceship is dead 
    public boolean TakeHit(){
        this.HitPoints --;
        if (HitPoints <= 0){
            this.Die();
        }
        return this.Alive;
    }
    public void MoveDown(){
        MoveY(Speed);
    }
    public void MoveUp(){
        MoveY(Speed * -1);
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
    public boolean getAlive(){
        return Alive;
    }
    public void Die(){
        Alive = false;

        for(int i = 0; i < 11; i++){
            particules[i] = new Entity(189, 188, 174,false,createShape(ELLIPSE,super.getPosX(),super.getPosY(),10,10),super.getPosX(),super.getPosY());

        }
        this.particulesDie = true;
        this.dieAnimationTimer = millis();
    }
    public void setSpeed(float speed){
        this.Speed = speed;
    }

    public void Attack(int direction){
      //  println("POW POW");
      if(Alive){
        if(timeSinceLastattack < millis()){
         for(int i = 0; i < MaxLaser; i++){
             if(!lasers[i].CheckIfActive()){
                 lasers[i] = new Laser(this.position.x + super.getRadius() / 2, this.position.y + super.getRadius(),10 * direction);
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
        
        for(int i = 0; i < MaxLaser; i++){
            if(lasers[i].CheckIfActive()){
                lasers[i].Display();
            }
         }
        }
         else if (particulesDie){
             //Quick fix need to be change 
            this.particules[0].MoveX(-1);
            this.particules[0].MoveY(-1);
            this.particules[1].MoveX(1);
            this.particules[1].MoveY(-1);
            this.particules[2].MoveX(-1);
            this.particules[2].MoveY(1);
            this.particules[3].MoveX(-1);
            this.particules[4].MoveX(-1);
            this.particules[5].MoveX(-1);
            this.particules[5].MoveY(-1);
            this.particules[6].MoveY(1);
            this.particules[7].MoveX(1);
            this.particules[7].MoveY(-1);
            this.particules[8].MoveX(1);
            this.particules[9].MoveX(1);
            this.particules[9].MoveY(1);
            this.particules[10].MoveY(-1);
            if(this.flash){
                for(int i = 0; i < 11; i++){
                    particules[i].Display();

                }
                flash = false;
                flashtimer = millis();
            }
            if(flashtimer + 75 < millis()){
                flash = true;
            }
            println("die particule"); 
            if(this.dieAnimationTimer + 1000 < millis()){
                println("stop particule draw at : " + millis() +  " And dieAnimationTimer is : " + dieAnimationTimer);
                particulesDie = false;
                this.Active = false;
            }
         }     

    }

}