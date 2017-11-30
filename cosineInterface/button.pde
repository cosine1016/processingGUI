public class button implements processingGUI {
   PImage img; //ボタン画像
   int x; //表示位置（左上）
   int y; //表示位置（左上）
   int wid; //ボタンサイズ
   int hei; //ボタンサイズ
   boolean[] judge; //当たり判定


   public button(PImage _img, int _x, int _y){
     img = _img;
     x = _x;
     y = _y;
     wid = img.width;
     hei = img.height;
     judge = new boolean[wid * hei];
     img.loadPixels();
     for(int i = 0; i < wid * hei; i++){
       color c = img.pixels[i];
       if(alpha(c) == 0) {
         judge[i] = false;
       } else {
         judge[i] = true;
       }
     }
   }

   /*public button(int _w, int _h, int _x, int _y){
     img = null;
     x = _x;
     y = _y;
     wid = _w;
     hei = _h;
     judge = new boolean[wid * hei];
     for(int i = 0; i < wid * hei; i++){
       judge[i] = true;
     }
   }*/

   public void screen(){
     image(img, x, y);
   }

   public void update() { }

   public void collision(){
     int colX = mouseX - x;
     int colY = mouseY - y;
     if(colX >= 0 && colX < wid && colY >= 0 & colY < hei){
       if(judge[colX + colY * wid]){
         click();
       }
     }
   }

   public void click() { }
}
