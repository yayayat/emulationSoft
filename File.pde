String path="map.lns";

void saveProcessing() {
  mode=0;
  for (byte i=0; i<8; i++)
    for (byte j=0; j<4; j++)
      saveData[i+j*8]=saveDataMap[i][j];
  for (byte i=0; i<3; i++)
    saveData[32+i]=saveDataCan[i];
  saveBytes(path, saveData);
}

void loadProcessing() {
  saveData=loadBytes(path);
  for (byte i=0; i<8; i++)
    for (byte j=0; j<4; j++) {
      saveDataMap[i][j]=saveData[i+j*8];
      map[i][j]=plates[saveDataMap[i][j]/8][saveDataMap[i][j]%8];
    }
  for (byte i=0; i<3; i++) {
    saveDataCan[i]=saveData[32+i];
    posX[i]=saveDataCan[i]/8;
    posY[i]=saveDataCan[i]%8;
  }
  mode=0;
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


void fileSelected(File selection) {
  if (selection == null) {
    path=null;
  } else {
    path=selection.getAbsolutePath()+".lns";
  }
}