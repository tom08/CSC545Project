class NegativeFilter extends Button{
  public NegativeFilter(int x, int y, int b_w, int b_h){
    super(x, y, b_w, b_h, "Negative Filter");
  }
  
  public void onSelect(int mouse_x, int mouse_y, PImage img){
    PImage target = createImage(img.width, img.height, RGB);
  
      for (int y = 0; y < img.height; y++) {
        for (int x = 0; x < img.width; x++) {
          color c = img.get(x, y);
          float r = red(c), g = green(c), b = blue(c);
          c  = color(255 - r, 255 - g, 255 - b);
          target.set(x, y, c);
      }
    }
     display= target;

  }
}