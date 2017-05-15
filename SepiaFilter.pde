class SepiaFilter extends Button{
  public SepiaFilter(int x, int y, int b_w, int b_h){
    super(x, y, b_w, b_h, "Sepia Filter");}
    
    public void onSelect(int mouse_x, int mouse_y, PImage img){
    PImage target = createImage(img.width, img.height, RGB);
  
      for (int y = 0; y < img.height; y++) {
        for (int x = 0; x < img.width; x++) {
          color c = img.get(x, y);
          float r = red(c), g = green(c), b = blue(c);
          int tr = (int)(0.393*r + 0.769*g + 0.189*b);
          int tg = (int)(0.349*r + 0.686*g + 0.168*b);
          int tb = (int)(0.272*r + 0.534*g + 0.131*b);
          if(tr > 255){r = 255;}
          else{r = tr;}
          if(tg > 255){g = 255;}
          else{g = tg;}
          if(tb > 255){b = 255;}
          else{b = tb;}
          c  = color(tr, tg, tb);
          target.set(x, y, c);
      }
    }
     display= target;
     return;
  }
}