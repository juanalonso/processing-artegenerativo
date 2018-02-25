int rows, cols;
int cw, ch;
int ncolors;

color c;

color[] palette = {#C2C3C7, #FF004D};

void setup() {

  size(800, 800);
  stroke(255);

  frameRate(30);

  rows = 20;
  cols = 20;
  cw = width/cols;
  ch = height/rows;

  ncolors = palette.length;
}


void draw() {

  float t = 1.0*frameCount/50.0;
  background(0);

  noStroke();
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      float scale1 = map(mouseX,0,width,2,20);
      float scale2 = map(mouseY,0,height,2,20);
      int palIndex = noise(x/scale1, y/scale1, t)>0.5?1:0;        
      int col1 = palette[palIndex], col2= palette[1-palIndex];
      tile(cw*x, ch*y, cw, ch, col1, col2, noise(x/scale2, y/scale2, t)>0.5);
    }
  }
}


void tile(int x, int y, int w, int h, color c1, color c2, boolean g) {
  fill(c1);
  rect(x, y, x+w, y+h);
  fill(c2);
  if (g) {
    triangle(x, y, x, y+h, x+w, y+h);
  } else {
    triangle(x, y, x+w, y, x, y+h);
  }
}