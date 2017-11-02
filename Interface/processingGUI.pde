interface processingGUI{
  public void screen(); //表示時に呼び出すメソッド
  public void update(); //更新時に呼び出すメソッド
  public void collision(); //当たり判定時に呼び出すメソッド
  public void hit();　//当たり判メソッドから呼び出されるメソッド
}
