/*
BUG: if I select another button then come back
the messageStart does not reset to 0 because the program 
is continually running

INSTRUCTIONS:

font size:
1 -increases 
2 -decreases 

arrows:
up/down - navigates through word choices

mouse click:
display/remove phrase- the font and word choice settings are saved
*/

class TextButton extends Button{
  public TextButton(int x, int y, int b_w, int b_h){ //constructor x,y coord, width, height
    super(x, y, b_w, b_h, "Add Phrase");  
    messageStart = 0; //sets once at beginning
    count = 0;
    number = 0;
    text = 15;
  }
    
 public void handleMousePressed(int mouse_x, int mouse_y, PImage img){
      startX = mouse_x;
      startY = mouse_y;
      
        if (messageStart == 0) {
          messageStart = 1;
        } else {
          messageStart = 0;
        }
    return;
 }
 
 
public void handleKeyUp(char k, PImage img){
  super.handleKeyUp(k, img);
   
  if (key == '1'){ // change text font
      text += 1;
    } else if (key == '0') {
      text -= 1;
    }
    
  if (key == CODED) { // change phrase 
    if (keyCode == UP && count < message.length - 1) {
      count += 1;
      number = count;
    } else if (keyCode == DOWN && count > 0) {
          count -= 1;
          number = count;
        }
      }
    
    /*if (number == message.length) { 
     count = 0; // reset
     number = 0;
     }*/ 
      return;
 }
 
 public void draw(){
     super.draw();
     //print(messageStart, " ");
     
     if (messageStart != 0){
       textSize(text);
       
       if (number < message.length && startY >= buttonHeight){ //prevents from printing text in menu bar
         if(message[number].length() < 10){ //getting word closer to arrow
           text(message[number], startX, startY, 60, 100);
         }
         else if (message[number].length() > 10){
           text(message[number], startX, startY, 100, 100);
        }
      }
    }
 }
     
private int startX, startY, messageStart, count, number, text;
private String message[] = {"Amused", "Beautiful", "Chatty", "Confident", "Congratulations", "Cool", "Delighted", "Happy", 
                            "Happy Anniversay", "Happy Birthday", "Happy Easter", "Happy Father's Day",
                            "Happy Graduation", "Happy Mother's Day", "Happy Thanksgiving", 
                            "Happy Valentine's Day", "Hopeful", "Hungy", "I love you", 
                            "Joyful", "Laughing", "LOL", "Love", "Loving", "Merry Christmas", "Sleepy", "Smart", "Sneaky", "Tired", "Witty"};
}