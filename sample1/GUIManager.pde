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

  void mousePressed(){
    for(int i = 0; i < guiList.size(); i++){
      guiList.get(i).collision();
    }
  }
}
