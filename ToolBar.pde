int toolBarX=160, 
  toolBarY=840;

void drawToolbar() {
  //Меню инструментов
  for (byte i=0; i<5; i++)image(plates[i][0], toolBarX+i*200, toolBarY);
  image(eraserIcon, toolBarX+1000, toolBarY);
  image(hand, toolBarX+1200, toolBarY);
  strokeWeight(3);
  rect(toolBarX, toolBarY, 1400, 200);
  for (int i=toolBarX+200; i<toolBarX+1400; i+=200)line(i, toolBarY, i, toolBarY+200);
  strokeWeight(5);
  stroke(0, 255, 0);
  rect(toolBarX+tool*200, toolBarY, 200, 200);
  stroke(0);
  strokeWeight(1);
}

void selectTool() {
  if (mouseY>toolBarY && mouseY<toolBarY+200 && mouseX>toolBarX && mouseX<toolBarX+1400) {
    tool=byte((mouseX-toolBarX)/200);
    if (tool<6) {
      plate=tool;
      dir=0;
      lineDraw=true;
    } else {
      plate=5;
      lineDraw=false;
    }
  }
}