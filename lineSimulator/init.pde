PImage map[][]=new PImage[8][4]; //Карта траектории
PImage can;//Изображение банки

int posX[]=new int[3];// Координаты
int posY[]=new int[3];// банок

PImage leftToolBarIcons[][]=new PImage[4][3];
PImage eraser,eraserIcon, hand;//Изображения ластика и руки
PImage plates[][]=new PImage[6][];//Изображения плиток траектории
byte dir, plate=5, tool=6,grubbedCan;//Текущая плитка и её направление
byte saveDataMap[][]=new byte[8][4];
byte saveDataCan[]=new byte[3];
byte saveData[]=new byte[35];
boolean lineDraw=false,canGrub=false;

void init(){
  can=loadImage("Resorses/upViewCan.png");//Загрузка изображения банки
  for(byte i=0;i<3;i++){
    posX[i]=i;
    posY[i]=0;
  }
  //Инициализация массива изображений плиток
  plates[0]=new PImage[2];
  plates[1]=new PImage[4];
  plates[2]=new PImage[4];
  plates[3]=new PImage[4];
  plates[4]=new PImage[1];
  plates[5]=new PImage[1];

  //Загрузка иконок Левой панели
  for (byte i=0; i<3; i++)leftToolBarIcons[0][i]=loadImage("Resorses/Icons/edit"+i+".png");
  for (byte i=0; i<3; i++)leftToolBarIcons[1][i]=loadImage("Resorses/Icons/play"+i+".png");
  for (byte i=0; i<3; i++)leftToolBarIcons[2][i]=loadImage("Resorses/Icons/open"+i+".png");
  for (byte i=0; i<3; i++)leftToolBarIcons[3][i]=loadImage("Resorses/Icons/save"+i+".png");
  
  //Загрузка изображений плиток
  for (byte i=0; i<2; i++)plates[0][i]=loadImage("Resorses/directLine"+i+".png");
  for (byte i=0; i<4; i++)plates[1][i]=loadImage("Resorses/smoothTurn"+i+".png");
  for (byte i=0; i<4; i++)plates[2][i]=loadImage("Resorses/sharpTurn"+i+".png");
  for (byte i=0; i<4; i++)plates[3][i]=loadImage("Resorses/branch"+i+".png");
  plates[4][0]=loadImage("Resorses/cross0.png");
  plates[5][0]=loadImage("Resorses/space0.png");

  //Обнуление карты траектории
  for (byte i=0; i<8; i++)
    for (byte j=0; j<4; j++)
      map[i][j]=createImage(200, 200, ALPHA);
  
  //Обнуление данных для сохранения
  for (byte i=0; i<8; i++)
    for (byte j=0; j<4; j++)
      saveDataMap[i][j]=40;
  for (byte i=0; i<3; i++) saveDataCan[i]=byte(i*8);
  eraser=loadImage("Resorses/Eraser.png");//Загрузка изображения ластика
  eraserIcon=loadImage("Resorses/Icons/Eraser.png");//Загрузка изображения ластика
  hand=loadImage("Resorses/Icons/Hand.png");//Загрузка изображения руки
}