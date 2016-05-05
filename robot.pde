lightSensor sensors[]=new lightSensor[4];
float robotX, robotY, rad=50, sp;
byte s;
float robotAng;
void drawRobot() {
  ellipse(robotX, robotY, rad*2, rad*2);
  for (lightSensor sensor : sensors) 
    sensor.drawSensor();
}



void tic() {  
  if (robotAng>TWO_PI) robotAng=0;
  else if (robotAng<0) robotAng=TWO_PI;
  if (robotX-rad<fieldX) robotX=fieldX+rad;
  else if (robotX+rad>fieldX+1600) robotX=fieldX+1600-rad;
  if (robotY-rad<fieldY) robotY=fieldY+rad;
  else if (robotY+rad>fieldY+800) robotY=fieldY+800-rad;
  s=0;
  for (lightSensor sensor : sensors) {
    sensor.setPos(robotX+cos(robotAng+HALF_PI/12+HALF_PI/6*(s-2))*(rad+20), robotY+sin(robotAng+HALF_PI/12+HALF_PI/6*(s-2))*(rad+20));
    s++;
  }
  sonar();
  usr();
  robotX+=cos(robotAng)*sp;
  robotY+=sin(robotAng)*sp;
  drawRobot();
}

void robotMove() {
}
void manualRobotControl() {
  switch(keyCode) {
  case 37:
    robotAng-=QUARTER_PI/9;
    break;  
  case 39:
    robotAng+=QUARTER_PI/9;
    break;  
  case 38:
    robotX+=cos(robotAng)*5;
    robotY+=sin(robotAng)*5;
    break;  
  case 40:
    robotX-=cos(robotAng)*5;
    robotY-=sin(robotAng)*5;
    break;
  };
}