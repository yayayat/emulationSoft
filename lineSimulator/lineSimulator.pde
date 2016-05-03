byte mode=0; //<>//
void setup() {
  fullScreen();// Во весь экран
  noFill();
  init();
}

void draw() {
  background(255);//Очистка экрана
  drawLeftBar();
  if (mode==0) {
    drawGrid();
    drawToolbar();
    if (mousePressed) setLine();
    drawLine();
    drawCans();
    drawTool();
  }else if(mode==1){
    drawLine();
    drawCans();
    cursor(ARROW);
  }
  else if(mode==2){
    drawLoad();
  }
  else if(mode==3){
    drawSave();
  }
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(mode==0){
    rotatePlate(e);
  }
}

void mousePressed() {
  selectMode();
  if(mode==0){
    selectTool();
    setCan();
  }
  else if(mode==2)
    loadProcessing();
  else if(mode==3) 
    saveProcessing();
}