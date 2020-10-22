public class TitleScreen  {
    private int selectedItem;
    private int numberofItems;
    private Input input;
    private int selectedItemSize;
    private int notselectedItemSize;
 

    public TitleScreen () {
        this.numberofItems = 2;
        this.selectedItem = 0;
        this.input = new Input();
        this.selectedItemSize = 60;
        this.notselectedItemSize = 30;

        
    }
    public void Change_Selection(){
        switch(input.ScanKeybord()){
            case "UP":
                this.selectedItem = 0;
            break;

            case "DOWN":
                this.selectedItem = 1;
            break;

        }

       // print(this.selectedItem + "\n");
/*
        if(selectedItem >= numberofItems)
            this.selectedItem = this.numberofItems - 1;
        if(selectedItem <= -1)
            this.selectedItem = 0;

        print(this.selectedItem);
        */
  
    }
    public String SelectSomething(){
     if(input.ScanKeybord() == "ACTION"){
        if(this.selectedItem == 0) 
             return "PLAY";
        
        else if(this.selectedItem == 1) 
             return "EXIT";
        }
    
        return "";
    }


    public void Display(){
       fill(235, 213, 52);
       textSize(60);
       text("Infinite Space Game", width /2, 100); 

        switch (this.selectedItem) {
            case 0 :
                textSize(this.selectedItemSize);
                text("Play", width /2, height /2); 
                textSize(this.notselectedItemSize);
                 text("Exit", width /2, height /2 + 100);             
            break;

            case 1: 
                textSize(this.notselectedItemSize);
                text("Play", width /2, height /2); 
                textSize(this.selectedItemSize);
                 text("Exit", width /2, height /2 + 100);           
            break; 

            default :
                print("No selection in titlescreen error \n");
            break;	          
        }
        textAlign(CENTER);
  
    }
}
