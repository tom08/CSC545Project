class HorizontalFlipButton extends Button{
  public HorizontalFlipButton(int x, int y, int b_w, int b_h, PImage og){
    super(x, y, b_w, b_h, "Flip Horizontal");
  }
  
  public void onSelect(int mouse_x, int mouse_y, PImage og){
    PImage target = createImage(og.width, og.height, RGB);
    for (int y = 0; y < og.height; y++) {
      for (int x = 0; x < og.width; x++) {
        color c = og.get(x, y);
        float r = red(c), g = green(c), b = blue(c);
        target.set(x, (og.height - 1) - y, color(r, g, b));
      }
    }
    display = target;
    super.selected = false;
  }
}