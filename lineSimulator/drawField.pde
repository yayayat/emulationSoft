int fieldX=160, 
  fieldY=10;

void drawGrid() {
  //Рамка и сетка поля

  rect(fieldX, fieldY, 1600, 800);
  for (int i=fieldX+200; i<fieldX+1600; i+=200)line(i, fieldY, i, fieldY+800);
  for (int i=fieldY+200; i<fieldY+800; i+=200)line(fieldX, i, fieldX+1600, i);
}

void drawLine() {
  for (byte i=0; i<8; i++)
    for (byte j=0; j<4; j++)
      image(map[i][j], fieldX+i*200, fieldY+j*200);
}

void drawCans() {
  for (byte i=0; i<3; i++)
    if (posX[i]>=0)
      image(can, fieldX+posX[i]*200, fieldY+posY[i]*200);
}

void drawTool() {
  if (mouseY>fieldY && mouseY<fieldY+800 && mouseX>fieldX && mouseX<fieldX+1600) {
    if (tool<5) {
      noCursor();
      image(plates[plate][dir], mouseX-100, mouseY-100);
    } else if (tool==5) 
      cursor(eraser);
    else {
      cursor(HAND);
      if (canGrub)image(can, mouseX-100, mouseY-100);
    }
  } else 
  cursor(ARROW);
}