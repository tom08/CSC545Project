class OpenButton extends Button{
  public OpenButton(int x, int y, int b_w, int b_h){
    super(x, y, b_w, b_h, "Open");
  }
  
  public void onSelect(int mouse_x, int mouse_y, PImage img){
    selectInput("Please select a file to work on.", "selected_file");
  }
}