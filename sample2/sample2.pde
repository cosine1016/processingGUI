public GUIManager GM;

void setup(){
  size(100,100);
  GM = new GUIManager();
  GM.guiList.add(new slider(10, 45, 80, 10, 0, 100));
}

void draw(){
  background(255);
  GM.update();
}

void mousePressed(){
  GM.mousePressed();
}
