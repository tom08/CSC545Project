class SimilarColorButton extends Button{
  private float tolerance;
  private color selected_x, selected_y;
  private String directions;
  private int r, g, b, step;
  public SimilarColorButton(int x, int y, int w, int h){
    super(x, y, w, h, "Select Similar Pixels to Manipulate");
    tolerance = 50;
    directions = "";
    r=0; g=0; b=0;
    step = 5;
  }
  
  public void draw(){
    super.draw();
    text(directions, super.x+super.wdth/2, super.y+super.hght/4);
  }
  
  private boolean is_similar(color c, color selected_color){
    float dist = sqrt(sq(red(selected_color)-red(c)) + sq(green(selected_color)-green(c)) + sq(blue(selected_color)-blue(c)));
    return dist <= tolerance;
  }
  
  private boolean is_active(){
    return !(r==0 && g==0 && b==0);
  }
  
  private float bound(float p){
    if(p<0) p=0;
    if(p>255)p=255;
    return p;
  }
  
  private void manipulate_similar_pixels(PImage img, float dr, float dg, float db){
    PImage target = img.copy();
    color selected_color = display.get(selected_x, selected_y);
    for(int y=0; y<img.height; y++){
      for(int x=0; x<img.width; x++){
        color c = img.get(x, y);
        if(is_similar(c, selected_color)){
          float r = bound(red(c)+dr);
          float g = bound(green(c)+dg);
          float b = bound(blue(c)+db);
          target.set(x, y, color(r, g, b));
        }
      }
    }
    display = target;
  }
  
  public void handleMouseReleased(int mouse_x, int mouse_y, PImage img){
    if(!is_active()) return;
    if(mouse_y <= bannerHeight) return;
    selected_x = mouse_x;
    selected_y = mouse_y;
  }
  
  public void handleKeyUp(char k, PImage img){
    if(k == CODED){
      if(keyCode==UP){
        manipulate_similar_pixels(img, r, g, b);
      }
      else if (keyCode==DOWN){
        manipulate_similar_pixels(img, -r, -g, -b);
      }
    }
  }
  
  public void handleMouseWheel(MouseEvent event, PImage img){
    float e = event.getCount();
    if(e > 0) manipulate_similar_pixels(img, r, g, b);
    if(e < 0) manipulate_similar_pixels(img, -r, -g, -b);
  }
  
  public void onSelect(int mouse_x, int mouse_y, PImage img){
    // Cycle through r, g and b manipulation, and off.
    if(is_active() && b==step){
      // blue is last in cycle, turn off.
      b = 0;
      directions = "Off: press to activate";
    } else if (is_active() && g == step){
      // cycle green to blue.
      g = 0; b = step;
      directions = "Arrow UP/DOWN: BLUE";
    } else if (is_active() && r == step){
      // cycle red to green.
      r = 0; g = step;
      directions = "Arrow UP/DOWN: GREEN";
    } else if (!is_active()){
      // cycle off to red.
      r = step;
      directions = "Arrow UP/DOWN: RED";
    }
  }
  
  public void reset(){
    // Cleanup button text, reset r, g, b to off
    directions = "";
    r=0; g=0; b=0;
  }
}