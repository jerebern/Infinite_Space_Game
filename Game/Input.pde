public class Input{

    public Input(){

    }

   public String ScanKeybord(){
        if(key == 'w' || key == 'W')
            return "UP";
        if(key == 's' || key == 'S')
            return "DOWN";
        if(key == 'A' || key == 'A')
            return "LEFT";    
        if(key == 'D' || key == 'd')
            return "RIGHT";   
        else
            return "NOT DEFINE KEY";

        
   } 
}