public class Bbutton extends button{
  public Bbutton(PImage _img, int _x, int _y){
    super(_img, _x, _y);
  }

  public void update(){}

  public void click(){
    GM.guiList.add(new Bbutton(img,(int)random(300),(int)random(300)));
  }

}
