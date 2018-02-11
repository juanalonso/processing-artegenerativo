int scene = 0;

int rows = 20;

color c;

void setup() {

  size(800, 800);
  noStroke();
  colorMode(HSB);
}


void draw() {

  float t = 1.0*frameCount/300.0;
  background(0);

  switch(scene) {
  case 0:
    for (int y=0; y<rows; y++) {
      int x = 0;
      while (x<width) {
        int xwidth = 10+(int)(noise(x/150.0,y/100.0,t)*150.0);
        fill(noise(x/250.0, y/500.0, t)*255, 200, 255);
        rect(x, cy(y), xwidth, 40);
        x += xwidth;
      }
    }
    break;
  }
}

float cy(float y) {
  return y*height/rows;
}