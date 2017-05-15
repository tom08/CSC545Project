class GrayScaleFilter extends Button{
  public GrayScaleFilter(int x, int y, int b_w, int b_h){
    super(x, y, b_w, b_h, "True Grayscale Filter");
  }
  
  public void onSelect(int mouse_x, int mouse_y, PImage img){
    PImage target = createImage(img.width, img.height, RGB);
  
      for (int y = 0; y < img.height; y++) {
        for (int x = 0; x < img.width; x++) {
          color c = img.get(x, y);
          float r = red(c), g = green(c), b = blue(c);
          float pixVal= (r*.299+g*.587+b*.114);
          int pix= int(pixVal);
          c  = color(pix, pix, pix);
          target.set(x, y, c);
      }
    }
     display= target;
     return;
  }
}