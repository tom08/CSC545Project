
public class Button{
    public Button(int btnX, int btnY, int btn_width, int btn_height, String name){
      // CONSTRUCTOR: Requires the top-left corner x, y coordinates
      // button width, button height as args.
      x = btnX; y = btnY; wdth = btn_width; hght = btn_height;
      selected = false;
      display = name;
    }
    
    public void draw(){
      if(selected) fill(200);
      else fill(255);
      stroke(0, 0, 0);
      rect(x, y, wdth, hght, 10);
      textAlign(CENTER);
      textSize(12);
      fill(0);
      text(display, x+wdth/2, y+hght/2);
    
    }
    
    public boolean clicked(int mouse_x, int mouse_y){
      // Requires mouse click x, y coordinates as args
      // Returns true if button was clicked, false otherwise.
      return mouse_x > x && mouse_x < x+wdth && mouse_y > y && mouse_y < y+hght;
    }
    public boolean isSelected(){ return selected; }
    public void setSelected(boolean s){ selected = s; }
    public String getText(){ return display; }
    public void setText(String new_display){ display = new_display; }
    
    public void handleMouseClick(int mouse_x, int mouse_y, PImage img){
      // handleMouseClick must be overriden by a subclass if it is used.
      // Args are mouse x, y coordinates and the current image.
      // This will be called on mousePressed() if this button is selected.
      // Do not override this method if it is not used by the feature implemented by the subclass
      return;
    }
    
    public void handleKeyUp(char k, PImage img){
      // handleKeyUp must be overriden by a subclass if it is used.
      // Args are the key pressed and the current image
      // this will be called on keyReleased() if this button is selected.
      // Do not override this method if it is not used by the feature implemented by the subclass
      return;
    }
    
    public void handleMousePressed(int mouse_x, int mouse_y, PImage img){
      // handleMousePressed will be called while the mouse button is pressed
      // args are mouse x, y coordinates and the current image.
      // do not override if it is not used by the feature being implemented by the subclass
      return;
    }
    
    public void handleMouseDragged(int mouse_x, int mouse_y, PImage img){
      // handleMousePressed will be called while the mouse button is pressed
      // args are mouse x, y coordinates and the current image.
      // do not override if it is not used by the feature being implemented by the subclass
      return;
    }
    
    public void handleMouseReleased(int mouse_x, int mouse_y, PImage img){
      // handleMouseReleased will be called while the mouse button is pressed
      // args are mouse x, y coordinates and the current image.
      // do not override if it is not used by the feature being implemented by the subclass
      return;
    }
    
    public void onSelect(int mouse_x, int mouse_y, PImage img){
      // onSelect will be called immediately upon button selection
      // args are mouse x, y coordinates and the current image.
      // do not override if it is not used by the feature being implemented by the subclass
      return;
    }
    
    public void handleMouseWheel(MouseEvent e, PImage img){
      // handleMouseWheel will be called if the mouse wheel is used
      // args are mouse event and display img.
      // Do not override unless needed
      return;
    }
    
    public void reset(){
      // reset will be called if not selected, but mouse click was inside the menu.
      // override IF you need to clean up your class when it is no longer active.
      // For example, if you manipulate your button's text.
      return;
    }
    
    private int x, y, wdth, hght;
    private boolean selected;
    private String display;
};