void usr() {
  sp=5;
  robotAng+=0.02*radians(sensors[1].getGray()-sensors[2].getGray());
}