public class Input{

    public Input(){

    }

   public String ScanKeybord(){
        if(key == 'w' || key == 'W')
            return "UP";
        else if(key == 's' || key == 'S')
            return "DOWN";
        else if(key == 'A' || key == 'a')
            return "LEFT";    
        else if(key == 'D' || key == 'd')
            return "RIGHT";
         else if(key == ' ')
            return "ACTION";              
        else
            return "NOT DEFINE KEY";

        
   } 
}