float dist;
class lightSensor {
  float sensorX=10, sensorY=10;
  int sum;
  void drawSensor() {
    ellipse(sensorX, sensorY, 10, 10);
  }
  void setPos(float x, float y) {
    sensorX=x;
    sensorY=y;
  }
  int getGray() {
    loadPixels();
    sum=0;
    for (int i=int(sensorX)-5; i<sensorX+5; i++)
      for (int j=int(sensorY)-5; j<sensorY+5; j++)
        sum+=red(pixels[i+j*width]);
    return int(sum/100);
  }
};

void sonar() {
  dist=10000;
  for (byte i=0; i<3; i++) {
    float y0=direct(robotAng, fieldX+78+posX[i]*200, robotX, robotY), 
      y1=direct(robotAng, fieldX+122+posX[i]*200, robotX, robotY), 
      x0=direct(HALF_PI-robotAng, fieldY+78+posY[i]*200, robotY, robotX), 
      x1=direct(HALF_PI-robotAng, fieldY+122+posY[i]*200, robotY, robotX), 
      crossX=fieldX+100+posX[i]*200, 
      crossY=fieldY+100+posY[i]*200;
    if ((((robotAng>PI+HALF_PI || robotAng<HALF_PI) && crossX+22>=robotX) || (robotAng<PI+HALF_PI && robotAng>HALF_PI && crossX-22<=robotX)) && ((robotAng>PI && crossY-22<=robotY) || (robotAng<PI && crossY+22>=robotY))) {
      if (y0<=crossY+22 && y0>=crossY-22 )
        dist=min(dist, dist(crossX-22, y0, robotX, robotY));
      if (y1<=crossY+22 && y1>=crossY-22)
        dist=min(dist, dist(crossX+22, y1, robotX, robotY));
      if (x0<=crossX+22 && x0>=crossX-22)
        dist=min(dist, dist(x0, crossY-22, robotX, robotY));
      if (x1<=crossX+22 && x1>=crossX-22)
        dist=min(dist, dist(x1, crossY+22, robotX, robotY));
    }
  }
  line(robotX, robotY, robotX+cos(robotAng)*dist, robotY+sin(robotAng)*dist);
}

void drawSensorsValue() {
  s=0;
  textAlign(CENTER, TOP);
  textSize(50);
  for (lightSensor sensor : sensors) {
    fill(color(sensor.getGray()));
    ellipse(210+s*200, 890, 100, 100);
    fill(0);
    text(sensor.getGray(), 210+s*200, 950);
    s++;
  }
  textAlign(LEFT,TOP);
  if(dist>800) text("NaN",960,940);
  else text(int(dist),960,940);
  fill(128);
  rect(960,840,constrain(dist,0,800),100);
  noFill();
}