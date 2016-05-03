void rotatePlate(float e) {
  //Поворот плитки
  if (lineDraw && plate<4) {
    dir+=e;
    if (plate==0) {
      if (dir>1) dir=0;
      else if (dir<0) dir=1;
    } else {
      if (dir>3) dir=0;
      else if (dir<0) dir=3;
    }
  }
}

void setLine() {
  if (lineDraw && mouseY>fieldY && mouseY<fieldY+800 && mouseX>fieldX && mouseX<fieldX+1600){
    map[(mouseX-fieldX)/200][(mouseY-fieldY)/200]=plates[plate][dir];
    saveDataMap[(mouseX-fieldX)/200][(mouseY-fieldY)/200]=byte(plate*8+dir);
  }
}

void setCan() {
  if (!lineDraw && mouseY>fieldY && mouseY<fieldY+800 && mouseX>fieldX && mouseX<fieldX+1600) {
    if (!canGrub) {
      for (byte i=0; i<3; i++)
        if ((mouseX-fieldX)/200==posX[i] && (mouseY-fieldY)/200==posY[i]) {
          posX[i]=-1;
          canGrub=true;
          grubbedCan=i;
        }
    } else {
      for (byte i=0; i<3; i++)
        if (((mouseX-fieldX)/200!=posX[0] || (mouseY-fieldY)/200!=posY[0]) && ((mouseX-fieldX)/200!=posX[1] || (mouseY-fieldY)/200!=posY[1]) && ((mouseX-fieldX)/200!=posX[2] || (mouseY-fieldY)/200!=posY[2])) {
          posX[grubbedCan]=(mouseX-fieldX)/200;
          posY[grubbedCan]=(mouseY-fieldY)/200;
          saveDataCan[grubbedCan]=byte((mouseX-fieldX)/200*8+(mouseY-fieldY)/200);
          canGrub=false;
        }
    }
  }
}