public abstract class button implements processingGUI {
   PImage img;
   int x;
   int y;
   int wid;
   int hei;
   boolean[] judge;

   public button(PImage _img, int _x, int _y){
     img = _img;
     x = _x;
     y = _y;
     wid = butImg.width;
     hei = butImg.height;
     judge = new boolean[wid * hei];
     img.loadPixels()
     color[] c = img.pixels;
     for(int i = 0; i < wid * hei; i++){
       if(c[i].alpha == 0) {
         judge[i] = false;
       } else {
         judge[i] = true;
       }
     }
   }

   public button(int _w, int _h, int _x, int _y){
     img = null;
     x = _x;
     y = _y;
     wid = _w;
     hei = _h;
     judge = new boolean[wid * hei];
     for(int i = 0; i < wid * hei; i++){
       judge[i] = true;
     }
   }

   public screen(){
     image(img, x, y);
   }

   abstract public update() { }

   public collision(){
     int colX = mouseX - butX;
     int colY = mouseY - butY;
     if(colX >= 0 && colX < wid && colY >= 0 & colY < hei){
       if(judge[colX + colY * wid]){
         click();
       }
     }
   }

   abstract public click() { }
}
