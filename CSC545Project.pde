/*

*/
PImage start_image;
PImage display = null;

void setup(){
  size(500, 500);
  surface.setResizable(true);
  selectInput("Please select a file to work on.", "selected_file");
  if(display != null)
    surface.setSize(display.width, display.height);
}

void draw(){
  if(display != null){
    if(width != display.width && height != display.height)
      surface.setSize(display.width, display.height);
    image(display, 0, 0);
  }
}

void selected_file(File selection){
  if(selection != null){
    start_image = loadImage(selection.getAbsolutePath());
    display = start_image.copy();
  }
}

void keyReleased(){
  // This is temporary, until we get the menu up.
  // Though, I'm not opposed to putting in keyboard shortcuts.
  // But if we do, they should probably be more complicated than this.
  // For example CTRL + o to open file or something.
  if(key == 'o') selectInput("Please select a file to work on.", "selected_file");
}