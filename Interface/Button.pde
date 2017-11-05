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
     collision = new boolean[wid * hei];
     img.loadPixels()
     color[] c = img.pixels;
     for(int i = 0; i < wid * hei; i++){
       if(c[i].alpha == 0) {
         judge = false;
       } else {
         judge = true;
       }
     }
   }

   public button(int _w, int _h, int _x, int _y){
     img = null;
     x = _x;
     y = _y;
     wid = _w;
     hei = _h;
     collision = new boolean[wid * hei];
     for(int i = 0; i < wid * hei; i++){
       collision[i] = true;
     }
   }

   public screen(){
     image(img, x, y);
   }

   public update(){

   }

   public collision(){
     
   }

   public hit(){

   }
}
