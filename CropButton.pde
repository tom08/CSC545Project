/*creating a subclass 
This gives CropButton all the same fields and methods 
as Button, yet allows its code to focus exclusively on 
the features that make it unique.*/

//BUG: selects the gray background as an option

class CropButton extends Button{
  public CropButton(int x, int y, int b_w, int b_h){ //constructor x,y coord, width, height
    super(x, y, b_w, b_h, "Crop");  
  }
  
  public void handleMousePressed(int mouse_x, int mouse_y, PImage img){
      startX = mouse_x;
      startY = mouse_y;
  
    return;
  }
      
  public void handleMouseReleased(int mouse_x, int mouse_y, PImage img){
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
    
   w = endX - startX;
   h = endY - startY; 
    
    /*println("mouse_x:", mouse_x);
    println("mouse_y:", mouse_y);
    println("startX:", startX);
    println("startY:", startY);
    println("endX:", endX);
    println("endY:", endY);
    println("w", w, "h", h);*/
    
    croppedImg = get(startX+1, startY+1, w-1, h-1);
       
   if (startY >= buttonHeight){ // restricting image selection below buttons
    display = croppedImg;
    }
     return;
  }
    
  public void onSelect(int mouse_x, int mouse_y, PImage img){
       
    return;
  }
  
  /*public void draw(){  //OVERRIDE?
       if(mousePressed){
       noFill();
       stroke(0, 255, 0);
       rect(startX, startY, mouseX, mouseY);} 
    }*/
  
  private int startX, startY, endX, endY, w, h;
  private PImage croppedImg;
}