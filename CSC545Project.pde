
// Globals
int bannerWidth = 1280; int bannerHeight = 160;
int buttonWidth = 256; int buttonHeight = 40;
int buttonX, buttonY = 0;
int labelX = buttonWidth/2; int labelY = buttonHeight/2;
float xVar, yVar = 0;
int boxX, boxY = 0;

String[] functions = {"crop", "filter", "tirangle stuff", "peace", "redundancy"};

PFont title;

void setup() {
  size(1280, 720);
  strokeWeight(1);
  fill(255);
  rect(0, 0, 1280, 100);        //main banner
  strokeWeight(1);
  
  // Do not change loop. Only change buttonWidth, buttonHeight, and bannerHeight in Global
  for (int i = 0; i < bannerHeight; i += buttonHeight) {
    for (int j = 0; j < bannerWidth; j += buttonWidth) {
      rect(buttonX, buttonY, buttonWidth, buttonHeight);
      buttonX += buttonWidth;
    }
    buttonY += buttonHeight;
    buttonX = 0;
  }
  buttonX = 0;
  buttonY = 0;
  
  title = createFont("Times New Roman", 12);
  textFont(title);
  fillLabels(functions);                          //function that fills in label titles
}

void draw() {
  ;
}

void fillLabels(String[] functions) {
  textAlign(CENTER);
  fill(0);
  for (int i = 0; i < functions.length; i++) {
    if (labelX < bannerWidth) {
      text(functions[i], labelX, labelY);
      labelX += buttonWidth;
    }
    else{
      labelY += buttonHeight;
      labelX = buttonWidth/2;
      text(functions[i], labelX, labelY);
      labelX += buttonWidth;
    }
  }
  labelX = buttonWidth/2; labelY = buttonHeight/2;               //reset the variables
}

void mouseClicked() {
  if (mouseX <= bannerWidth && mouseY <= bannerHeight) {
    xVar = mouseX;
    yVar = mouseY;
    // Find the beginning xVal for the highlighted box
    for (int i = 0; i < bannerWidth/buttonWidth; i++) {
      if (xVar >= (buttonWidth * i) && xVar < (buttonWidth * i + buttonWidth)) {
        boxX = buttonWidth * i;
        //println(boxX);
      }
    }
    // Find the beginning yVal for the highlighted box
    for (int i = 0; i < bannerHeight/buttonHeight; i++) {
      if (yVar >= (buttonHeight * i) && yVar < (buttonHeight * i + buttonHeight)) {
        boxY = buttonHeight * i;
        //println(boxY);
      }
    }
    
    // Redo the banner to "erase" the other highlights
    fill(255);                                      //make boxes white
    for (int i = 0; i < bannerHeight; i += buttonHeight) {
      for (int j = 0; j < bannerWidth; j += buttonWidth) {
        rect(buttonX, buttonY, buttonWidth, buttonHeight);
        buttonX += buttonWidth;
      }
      buttonY += buttonHeight;
      buttonX = 0;
    }
    buttonX = 0; buttonY = 0;                       //reset the variables
    
    fill(200);                                      //hightlight color
    rect(boxX, boxY, buttonWidth, buttonHeight);
    fillLabels(functions);                          //function that fills in label titles
  }
}