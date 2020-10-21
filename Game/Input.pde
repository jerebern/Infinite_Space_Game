public class Input{

    public Input(){

    }

   public String ScanKeybord(){
        if(key == 'w' || key == 'W')
            return "UP";
        else if(key == 's' || key == 'S')
            return "DOWN";
        else if(key == 'A' || key == 'A')
            return "LEFT";    
        else if(key == 'D' || key == 'd')
            return "RIGHT";   
        else
            return "NOT DEFINE KEY";

        
   } 
}