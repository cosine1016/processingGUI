public class slider implements processingGUI{
  int x; //表示位置(左上)
  int y; //表示位置(左上)
  int wid; //表示幅
  int hei; //表示高さ
  int value; //値
  int max; //値最大値
  int min; //値最小値
  double ratio; //per1pxleの値変動値
  boolean orient; //表示方向falseで縦、trueで横
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
