public GUIManager GM;
PImage B;

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

void mousePressed(){
  GM.mousePressed();
}
