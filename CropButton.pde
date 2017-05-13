/*
BUG: point of reference resets when mouse is moved around on screen

*/


class CropButton extends Button{
  public CropButton(int x, int y, int b_w, int b_h){ //constructor x,y coord, width, height
    super(x, y, b_w, b_h, "Crop");  
    startX = -1; //sets once at beginning
    startY = -1;
  }
  
  public void handleMousePressed(int mouse_x, int mouse_y, PImage img){
    //does once per click
    if(startX == -1 && startY == -1){
      pstartX = mouse_x;
      pstartY = mouse_y;
      
      startX = mouse_x;
      startY = mouse_y;
    }
    return;
  }
    
   public void handleMouseDragged(int mouse_x, int mouse_y, PImage img){
    if (mouse_x < startX) {
      endX = startX;
      startX = mouse_x; 
    } else { 
        endX = mouse_x;
      }
    
    if (mouse_y < startY){
        endY = startY;
        startY = mouse_y;   
    } else { 
        endY = mouse_y;
    }
   
      wdth = abs(endX - pstartX); 
      ht = abs(endY - pstartY); 
      
      return;   
    
   }
   
   public void draw(){
     super.draw();
     if (mousePressed){
     noFill();
     stroke(255, 0, 0);
     //print("startX", startX);
     //print("startY", startY);
     rect(startX, startY, wdth, ht);
     }
     
   }
      
  public void handleMouseReleased(int mouse_x, int mouse_y, PImage img){
   
   croppedImg = get(startX+1, startY+1, wdth-1, ht-1);
   
   if (startY >= buttonHeight){ // restricting crop function below menu buttons
     display = croppedImg;
   }
   startX = -1; // resetting for new crop
   startY = -1;
  
   wdth = 0; // reset
   ht = 0;
    return;
  } 
  
  private int startX, pstartX, startY, pstartY, endX, endY, wdth, ht;
  private PImage croppedImg;
}