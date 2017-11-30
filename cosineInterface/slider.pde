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
    max = ratio * _len;
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
    if(orient){
      line(x, y+hei/2, x+wid, y+hei/2);
      ellipse(x+(int)(value/ratio), y+hei/2, 5, 5);
      ellipse(x+(int)(value/ratio), y+hei/2, 2, 2);
    }else{
      line(x+wid/2, y, x+wid/2, y+hei);
      ellipse(x+wid/2, y+(int)(value/ratio), 5, 5);
      ellipse(x+wid/2, y+(int)(value/ratio), 2, 2);
    }
    text(value, x+wid/2,y+hei/2);
  }

  public void update(){}

  public void collision(){

  }

  public void click(){}

}
