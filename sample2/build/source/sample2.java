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

public class sample2 extends PApplet {

public GUIManager GM;

public void setup(){
  
  GM = new GUIManager();
  GM.guiList.add(new slider(10, 45, 80, 10, 0, 100));
}

public void draw(){
  background(255);
  GM.update();
}

public void mousePressed(){
  GM.mousePressed();
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
public interface processingGUI{
  public void screen(); //\u8868\u793a\u6642\u306b\u547c\u3073\u51fa\u3059\u30e1\u30bd\u30c3\u30c9
  public void update(); //\u66f4\u65b0\u6642\u306b\u547c\u3073\u51fa\u3059\u30e1\u30bd\u30c3\u30c9
  public void collision(); //\u5f53\u305f\u308a\u5224\u5b9a\u6642\u306b\u547c\u3073\u51fa\u3059\u30e1\u30bd\u30c3\u30c9
  public void click();
}
public class slider implements processingGUI{
  int x; //\u8868\u793a\u4f4d\u7f6e(\u5de6\u4e0a)
  int y; //\u8868\u793a\u4f4d\u7f6e(\u5de6\u4e0a)
  int wid; //\u8868\u793a\u5e45
  int hei; //\u8868\u793a\u9ad8\u3055
  int value; //\u5024
  int max; //\u5024\u6700\u5927\u5024
  int min; //\u5024\u6700\u5c0f\u5024
  double ratio; //per1pxle\u306e\u5024\u5909\u52d5\u5024
  boolean orient; //\u8868\u793a\u65b9\u5411false\u3067\u7e26\u3001true\u3067\u6a2a
  boolean dragOn;


  public slider(int _x, int _y, int _len, double _rat, boolean _ori){
    x = _x;
    y = _y;
    orient = _ori;
    if(orient){
      wid = _len;
      hei = 10;
    }else{
      wid = 10;
      hei = _len;
    }
    ratio = _rat;
    min = 0;
    max = (int)(ratio * _len);
    value = min;
  }

  public slider(int _x, int _y, int _wid, int _hei, int _min, int _max){
    x = _x;
    y = _y;
    wid = _wid;
    hei = _hei;
    min = _min;
    max = _max;
    if(wid > hei){
      orient = true;
      ratio = (max-min) / wid;
    }else{
      orient = false;
      ratio = (max-min) / hei;
    }
    value = min;
  }

  public void screen(){
    int pointX;
    int pointY;
    if(orient){
      line(x, y+hei/2, x+wid, y+hei/2);
      pointX = x + (int)(value/ratio);
      pointY = y + hei/2;
    }else{
      line(x+wid/2, y, x+wid/2, y+hei);
      pointX = x + wid/2;
      pointY = y + (int)(value/ratio);
    }

    ellipse(pointX, pointY, 6, 6);
    ellipse(pointX, pointY, 2, 2);

    text(value, x+wid/2,y+hei/2);
  }

  public void update(){}

  public void collision(){
    int colX = mouseX - x;
    int colY = mouseY - y;
    if(colX >= 0 && colX < wid && colY >= 0 & colY < hei){
      click();
    }else{
      dragOn = false;
    }
  }

  public void click(){
    int pointX;
    int pointY;
    if(orient){
      pointX = x + (int)(value/ratio);
      pointY = y + hei/2;
    }else{
      pointX = x + wid/2;
      pointY = y + (int)(value/ratio);
    }

    if(dragOn){
      if(orient){
        value = (int)((mouseX - x) * ratio);
      }else{
        value = (int)((mouseY - y) * ratio);
      }
    }else{
      if(orient){
        if(pointX > mouseX){
          value = (int)(value - ratio);
        }else{
          value = (int)(value + ratio);
        }
      }else{
        if(pointY > mouseY){
          value = (int)(value - ratio);
        }else{
          value = (int)(value + ratio);
        }
      }
    }

    if(value > max) { value = max; }
    if(value < min) { value = min; }

    if((mouseX - pointX) * (mouseX - pointX) + (mouseY - pointY) * (mouseY - pointY) < 4){
      dragOn = true;
    }
  }

}
  public void settings() {  size(100,100); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sample2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
