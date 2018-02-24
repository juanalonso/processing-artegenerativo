int scene = 3;

int rows, cols;
int cw, ch;
int ncolors;

color c;

color[] palette = {#dcdcdc, #969696};

void setup() {

  size(800, 800);
  stroke(255);

  frameRate(30);
  noLoop();

  rows = 20;
  cols = 20;
  cw = width/cols;
  ch = height/rows;

  ncolors = palette.length;
}


void draw() {

  float t = 1.0*frameCount/50.0;
  background(0);

  switch(scene) {
  case 0:
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        if (random(1)>0.5) {
          line(cw*x, ch*y, cw*x+cw, ch*y+ch);
        } else {
          line(cw*x, ch*y+ch, cw*x+cw, ch*y);
        }
      }
    }
    break;

  case 1:
    noStroke();
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        int col1 = palette[0], col2= palette[1];
        //int col1 = palette[x%2], col2= palette[1-x%2];
        //int col1 = palette[y%2], col2= palette[1-y%2];
        //int col1 = palette[x%2], col2= palette[y%2];
        //int col1 = palette[(x+y)%2], col2= palette[x%2];
        //int col1 = palette[(x+y)%2], col2= palette[(x*y)%2];
        tile(cw*x, ch*y, cw, ch, col1, col2, false);
      }
    }
    break;

  case 2:
    noStroke();
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        int col1 = palette[0], col2= palette[1];
        //int col1 = palette[x%2], col2= palette[1-x%2];
        //int col1 = palette[y%2], col2= palette[1-y%2];
        //int col1 = palette[(x+y)%2], col2= palette[x%2];
        tile(cw*x, ch*y, cw, ch, col1, col2, (y+x)%2==0);
      }
    }
    break;

  case 3:
    noStroke();
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        int palIndex = random(1) > map(mouseX,0,width,0,1) ? 0: 1;        
        int col1 = palette[palIndex], col2= palette[1-palIndex];
        tile(cw*x, ch*y, cw, ch, col1, col2, random(1)>map(mouseY,0,height,0,1));
      }
    }
    break;
  }
}


void keyPressed() {
  redraw();
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