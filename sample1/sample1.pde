import Interface.*;

public GUIManager GM;
Pimage B;

void setup(){
  size(300, 300);
  B = loadImage("B.png");
  GM = new GUIManager();
  GM.guiList.add(new Bbutton(B,140,140));
}

void draw(){
  background(255);
  GM.update();
}
