/*

*/

// Globals
int bannerWidth = 1280; int bannerHeight = 160;
int buttonWidth = 256; int buttonHeight = 40;
int buttonX, buttonY = 0;
int labelX = buttonWidth/2; int labelY = buttonHeight/2;
float xVar, yVar = 0;
int boxX, boxY = 0;

// Display/Image Globals
PImage start_image;
PImage display = null;

String[] functions = {"Open", "crop", "filter", "tirangle stuff", "peace", "redundancy"};
Button[] buttons;

PFont title;

void setup() {
  size(1280, 720);
  strokeWeight(1);
  fill(255);
  strokeWeight(1);
  title = createFont("Times New Roman", 12);
  textFont(title);
  buttons = new Button[functions.length];
  int x=0, y=0;
  buttons[0] = new OpenButton(x, y, buttonWidth, buttonHeight);
  buttons[0].draw();
  x += buttonWidth;
  for(int i=1; i<buttons.length; i++){
    if(x+buttonWidth > width){
      x = 0;
      y += buttonHeight;
    }
    Button btn = new Button(x, y, buttonWidth, buttonHeight, functions[i]);
    btn.draw();
    buttons[i] = btn;
    x += buttonWidth;
  }
  bannerHeight = y+buttonHeight;
  fill(255);
  rect(0, 0, width, bannerHeight);        //main banner

  selectInput("Select a file to work on.", "selected_file");
}

void draw() {
  background(200);
  fill(255);
  rect(0, 0, width, bannerHeight);        //main banner
  for(int i=0; i<buttons.length; i++){
    if(buttons[i] != null)
      buttons[i].draw();
  }
  if(display != null)
    image(display, 0, bannerHeight);
}

void fillLabels(String[] functions) {
  textAlign(CENTER);
  fill(0);
  for (int i = 0; i < functions.length; i++) {
    if (labelX < bannerWidth) {
      //text(functions[i], labelX, labelY);
      labelX += buttonWidth;
    }
    else{
      labelY += buttonHeight;
      labelX = buttonWidth/2;
      //text(functions[i], labelX, labelY);
      labelX += buttonWidth;
    }
  }
  labelX = buttonWidth/2; labelY = buttonHeight/2;               //reset the variables
}

void selected_file(File selection){
  // Callback for the file select.
  if(selection != null){
    start_image = loadImage(selection.getAbsolutePath());
    display = start_image.copy();
  }
}

void mouseClicked() {
  if (mouseX <= bannerWidth && mouseY <= bannerHeight) {
    for(int i=0; i<buttons.length; i++){
      if(buttons[i].clicked(mouseX, mouseY)){
        buttons[i].setSelected(true);
        buttons[i].onSelect(mouseX, mouseY, display);
      }
      else{
        buttons[i].setSelected(false);
      }
    }
  }
  for(int i=0; i<buttons.length; i++){
    buttons[i].handleMouseClick(mouseX, mouseY, display);
  }
}

void keyReleased(){
  for(int i=0; i<buttons.length; i++){
    if(buttons[i].isSelected()) buttons[i].handleKeyUp(key, display);
  }
}