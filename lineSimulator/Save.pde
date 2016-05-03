int saveX=160, 
  saveY=840;
boolean pathActive=false;
String path="map.lns";
void drawSave() {
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
  text("Сохранить", saveX+1370, saveY+120);
  noFill();
  if (mouseX>saveX+20 && mouseX<saveX+1280 && mouseY>saveY+100 && mouseY<saveY+180) cursor(TEXT);
  else cursor(ARROW);
}

void saveProcessing() {
  if (mouseX>saveX+1350 && mouseX<saveX+1550 && mouseY>saveY+100 && mouseY<saveY+180) {
    mode=0;
    for (byte i=0; i<8; i++)
      for (byte j=0; j<4; j++)
        saveData[i+j*8]=saveDataMap[i][j];
    for (byte i=0; i<3; i++)
      saveData[32+i]=saveDataCan[i];
    saveBytes(path, saveData);
  }
}

void drawBitMap() {
  fill(0);
  textAlign(LEFT, TOP);
  textSize(50);
  for (byte i=0; i<8; i++)
    for (byte j=0; j<4; j++)
      text(saveDataMap[i][j]/8+";"+saveDataMap[i][j]%8, fieldX+i*200, fieldY+j*200);
  for (byte i=0; i<3; i++)
    text(saveDataCan[i]/8+";"+saveDataCan[i]/8, 10, 400+i*100);
  noFill();
}