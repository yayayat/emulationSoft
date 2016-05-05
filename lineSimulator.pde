void setup() { //<>//
  fullScreen();// Во весь экран
  noFill();//Без заполнения
  init();//Инициализация
}

void draw() {
  background(255);//Очистка экрана
  drawLeftBar();//отрисовка левой панели
  if (mode==0) {//Режим редактора
    drawGrid();//отрисовка сетки
    drawToolbar();//отрисовка панели инструментов
    if (mousePressed) setLine();//Редактирование траектории
    drawLine();//Отрисовка траектории
    drawCans();//Отрисовка банок
    drawRobot();//Отрисовка робота
    drawTool(); //Отрисовка инструмента
  } else if (mode==1) {//Режим эмулятора
    drawGrid();//Отрисовка сетки
    drawLine();//Отрисовка Траектории
    tic();//Просчет и отрисовка робота
    drawCans();//Отрисовка банок
    drawSensorsValue();//Вывод показаний датчиков
    cursor(ARROW);//Указатель - стрелка
  }
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (mode==0) {
    rotatePlate(e);
  }
}

void mousePressed() {
  selectMode();
  if (mode==0) {
    selectTool();
    setCan();
  }
}
void keyPressed() {
  if (mode==1)
    manualRobotControl();
}