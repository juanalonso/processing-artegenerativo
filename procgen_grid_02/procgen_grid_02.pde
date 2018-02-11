int scene = 0;

int rows = 20;
int cols = 20;

color c;

void setup() {

  size(800, 800);
  stroke(255);
  rectMode(CENTER);
  colorMode(HSB);
}


void draw() {

  float t = 1.0*frameCount/200.0;
  background(0);

  switch(scene) {
  case 0:
    noFill();
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        rect(cx(x), cy(y), 12, noise(x/10.0, y/10.0, t)*75.0);
      }
    }
    break;

  case 1:
    noStroke();
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        fill(noise(x/5/*.0*//*+t*/)*255, 200, 255);
        rect(cx(x), cy(y), 30, noise(x/10.0, y/10.0, t)*750.0);
      }
    }
    break;

  case 2:
    noStroke();
    for (int x=0/*5*/; x<cols/*-5*/; x++) {
      for (int y=0; y<rows; y++) {
        fill(noise(x/5.0/*+t*/, y/50.0/*,t*/)*255, 200, 255);
        rect(cx(x), cy(y), 30, noise(x/10.0, y/10.0, t)*750.0);
      }
    }
    break;

  case 3:
    noStroke();
    for (int x=0/*5*/; x<cols/*-5*/; x++) {
      for (int y=0; y<rows; y++) {
        fill(noise(x/5.0/*+t*/, y/50.0/*,t*/)*255, 200, 255);
        rect(cx(x), cy(y), 5, noise(x/10.0, y/10.0, t)*75.0);
      }
    }
    break;
  }
}


float cx(float x) {
  return width/cols/2+x*width/cols;
}

float cy(float y) {
  return height/rows/2+y*height/rows;
}