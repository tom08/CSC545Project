class SaveButton extends Button{
  SaveButton(int x, int y, int w, int h){
    super(x, y, w, h, "Save Image");
  }
  
  public void onSelect(int mouse_x, int mouse_y, PImage img){
    selectOutput("Where would you like to save this image?", "saveCallback");
  }
}