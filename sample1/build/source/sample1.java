import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sample1 extends PApplet {

public GUIManager GM;
PImage B;

public void setup(){

  
  B = loadImage("B.png");
  GM = new GUIManager();
  GM.guiList.add(new Bbutton(B,140,140));
}

public void draw(){
  background(255);
  GM.update();
}

public void mousePressed(){
  GM.mousePressed();
}
public class Bbutton extends button{
  public Bbutton(PImage _img, int _x, int _y){
    super(_img, _x, _y);
  }

  public void update(){}

  public void click(){
    GM.guiList.add(new Bbutton(img,(int)random(300),(int)random(300)));
  }

}
public class GUIManager{
  ArrayList<processingGUI> guiList;
  int focus;

  public GUIManager(){
    guiList = new ArrayList();
    focus = -1;
  }

  public void update(){
    for(int i = 0; i < guiList.size(); i++){
      guiList.get(i).update();
      guiList.get(i).screen();
    }
  }

  public void mousePressed(){
    for(int i = 0; i < guiList.size(); i++){
      guiList.get(i).collision();
    }
  }
}
public class button implements processingGUI {
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
     wid = img.width;
     hei = img.height;
     judge = new boolean[wid * hei];
     img.loadPixels();
     for(int i = 0; i < wid * hei; i++){
       int c = img.pixels[i];
       if(alpha(c) == 0) {
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
public interface processingGUI{
  public void screen(); //\u8868\u793a\u6642\u306b\u547c\u3073\u51fa\u3059\u30e1\u30bd\u30c3\u30c9
  public void update(); //\u66f4\u65b0\u6642\u306b\u547c\u3073\u51fa\u3059\u30e1\u30bd\u30c3\u30c9
  public void collision(); //\u5f53\u305f\u308a\u5224\u5b9a\u6642\u306b\u547c\u3073\u51fa\u3059\u30e1\u30bd\u30c3\u30c9
  public void click(); //\u30af\u30ea\u30c3\u30af\u6642\u306b\u547c\u3073\u51fa\u3055\u308c\u308b\u30e1\u30bd\u30c3\u30c9
}
  public void settings() {  size(300, 300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sample1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
