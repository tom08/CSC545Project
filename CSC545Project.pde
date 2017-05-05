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

// IF YOU ADD A BUTTON, add another null value to the list
Button[] buttons = {null, null};

PFont title;

void setup() {
  size(1280,720); 
  strokeWeight(1);
  fill(255);
  strokeWeight(1);
  title = createFont("Times New Roman", 12);
  textFont(title);
  int x=0, y=0;
  // IF you add another button, add it to the appropriate index in buttons here.
  // ADD buttonWidth to the button, unless buttons.length % 0 == 0, then set x to 0 and add buttonHeight to bannerHeight.
  buttons[0] = new OpenButton(x, y, buttonWidth, buttonHeight);
  buttons[0].draw();
  x += buttonWidth;
  
  buttons[1] = new CropButton(x, y, buttonWidth, buttonHeight);
  buttons[1].draw();
  x += buttonWidth;


  //NOTE: this is poor practice, but time is short. For every 5 buttons add the button height to the banner height
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

void mousePressed(){
  for(int i=0; i<buttons.length; i++){
    if(buttons[i].isSelected()) buttons[i].handleMousePressed(mouseX, mouseY, display);
  } 
}

void mouseReleased(){
  for(int i=0; i<buttons.length; i++){
    if(buttons[i].isSelected()) buttons[i].handleMouseReleased(mouseX, mouseY, display);
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