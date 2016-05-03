int leftToolBarX=10,
    leftToolBarY=10;
    
void drawLeftBar(){
  stroke(128);
  rect(leftToolBarX,leftToolBarY,100,400);
  for(int i=leftToolBarY+100;i<leftToolBarY+400;i+=100) line(leftToolBarX,i,leftToolBarX+100,i);
  stroke(0);
  for(byte i=0;i<4;i++)
    if(mouseX>leftToolBarX && mouseX<leftToolBarX+100 && mouseY>leftToolBarY+i*100 && mouseY<leftToolBarY+i*100+100)
      image(leftToolBarIcons[i][1],leftToolBarX,leftToolBarY+i*100);
    else
      image(leftToolBarIcons[i][0],leftToolBarX,leftToolBarY+i*100);
  image(leftToolBarIcons[mode][2],leftToolBarX,leftToolBarY+mode*100);
}

void selectMode(){
  if(mouseX>leftToolBarX && mouseX<leftToolBarX+100 && mouseY>leftToolBarY && mouseY<leftToolBarY+400)
    mode=byte((mouseY-leftToolBarY)/100);
}