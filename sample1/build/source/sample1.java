import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import Interface.*; 
import Interface.*; 

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
Pimage B;

public void setup(){
  
  B = loadImage("B.png");
  GM = new GUIManager();
  GM.guiList.add(new Bbutton(B,140,140));
}

public void draw(){
  background(255);
  GM.update();
}


public class Bbutton extends button{
  public Bbutton(Pimage _img, int _x, int _y){
    super(_img, _x, _y);
  }

  public void update(){}

  public void click(){
    GM.add(new Bbutton(butImg,random(300),random(300)));
  }

}
  public void settings() {  size(300, 300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "sample1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
