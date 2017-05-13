class EraserButton extends Button{
  public EraserButton(int x, int y, int b_w, int b_h, PImage og){
    super(x, y, b_w, b_h, "Eraser");
  }
  
  public int currentWeight = 1;
  
  public void draw() {
    strokeWeight(currentWeight);
    super.draw();
  }
  
  public void handleMouseDragged(int mouse_x, int mouse_y, PImage og){
    PImage target = createImage(og.width, og.height, RGB);
    target = og.get();
    if (mousePressed) {
      for (int y = 0; y < 5; y++) {
        for (int x = 0; x < 5; x++) {
          target.set(mouse_x + x, mouse_y - bannerHeight + y, color(255));
          display = target;
        }
      }
    }
  }
}