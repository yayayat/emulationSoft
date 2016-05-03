int loadX=160, 
  loadY=840;
void drawLoad() {
  rect(saveX, saveY, 1600, 200, 10);
  rect(saveX+20, saveY+100, 1280, 80, 10);
  rect(saveX+20, saveY+100, 1280, 80, 10);
  rect(saveX+1350, saveY+100, 200, 80, 10);
  fill(0);
  textAlign(LEFT, TOP);
  textSize(50);
  text("Путь:", saveX+20, saveY+20);
  text(path, saveX+40, saveY+110);
  textSize(30);
  text("Загрузить", saveX+1370, saveY+120);
  noFill();
  if (mouseX>saveX+20 && mouseX<saveX+1280 && mouseY>saveY+100 && mouseY<saveY+180) cursor(TEXT);
  else cursor(ARROW);
}

void loadProcessing() {
  if (mouseX>saveX+1350 && mouseX<saveX+1550 && mouseY>saveY+100 && mouseY<saveY+180) {
    saveData=loadBytes(path);
    for (byte i=0; i<8; i++)
      for (byte j=0; j<4; j++) {
        saveDataMap[i][j]=saveData[i+j*8];
        map[i][j]=plates[saveDataMap[i][j]/8][saveDataMap[i][j]%8];
      }
    for (byte i=0; i<3; i++){
      saveDataCan[i]=saveData[32+i];
      posX[i]=saveDataCan[i]/8;
      posY[i]=saveDataCan[i]%8;
    }
    mode=0;
  }
}