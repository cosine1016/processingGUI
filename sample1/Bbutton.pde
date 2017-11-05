import Interface.*;

public class Bbutton extends button{
  public Bbutton(Pimage _img, int _x, int _y){
    super(_img, _x, _y);
  }

  public void update(){}

  public void click(){
    GM.add(new Bbutton(butImg,random(300),random(300)));
  }

}
