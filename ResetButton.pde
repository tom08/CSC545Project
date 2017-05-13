class ResetButton extends Button{
  ResetButton(int x, int y, int w, int h){
    super(x, y, w, h, "Reset Image");
  }
  
  public void onSelect(int mouse_x, int mouse_y, PImage img){
    display = start_image.copy();
  }
}