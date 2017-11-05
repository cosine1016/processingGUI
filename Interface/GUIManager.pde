public class GUIManager{
  ArrayList<processingGUI> guiList;
  int focus;

  public GUIManager(){
    guiList = new ArrayList();
    focus = -1;
  }

  public update(){
    for(int i = 0; i < guiList.length; i++){
      guiList.get(i).update();
      guiList.get(i).screen();
    }
  }

  mousePressed(){
    for(int i = 0; i < guiList.length; i++){
      guiList.get(i).collision();
    }
  }
}
