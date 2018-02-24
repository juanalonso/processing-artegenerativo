int scene = 5;

int rows = 20;
int cols = 20;

color c;

void setup() {

  size(800, 800);
  stroke(255);
}


void draw() {

  float t = 1.0*frameCount/50.0;
  background(0);


  switch(scene) {
  case 0:
    noFill();
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        ellipse(cx(x), cy(y), 10, 10);
      }
    }
    break;  
  case 1:
    noFill();
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        ellipse(cx(x), cy(y), noise(x/10.0, y/10.0, t)*50.0, noise(x/10.0, y/10.0, t)*50.0);
      }
    }
    break;
  case 2:
    fill(255);
    noStroke();
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        ellipse(cx(x), cy(y), noise(x/10.0, y/10.0, t)*100.0, noise(x/10.0, y/10.0, t)*100.0);
      }
    }
    break;
  case 3:
    fill(255);
    noStroke();
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        ellipse(cx(x), cy(y), noise(x/10.0, y/10.0, t)*100.0, noise(x/10.0, 5+y/10.0, t)*100.0);
      }
    }
    break;
  case 4:
    noStroke();
    for (int x=0; x<cols-1; x++) {
      float opacity = sin(PI*x/cols)*255.0;
      for (int y=0; y<rows-1; y++) {
        float tint = sin(PI*y/rows)*255.0;
        fill(tint, opacity);
        ellipse(cx(x), cy(y), noise(x/10.0, y/10.0, t)*100.0, noise(x/10.0, 5+y/10.0, t)*100.0);
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