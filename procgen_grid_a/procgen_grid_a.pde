int scene = 0;

int rows, cols;
int cw, ch;

color c;

//Arcade palette by zacistan
//http://www.color-hex.com/color-palette/40813
color[] palette = {#f9f9f9, #002633, #5bc0de, #ee622c, #ee322c, #000000};
int ncolors;

void setup() {

  size(760, 760);
  noStroke();
  //noLoop();

  frameRate(1);

  rows = 19;
  cols = 19;
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
        fill(random(255));
        rect(cw*x, ch*y, cw, ch);
      }
    }
    break;  

  case 1:
    for (int x=0; x<=cols/2; x++) {
      for (int y=0; y<=rows/2; y++) {
        fill(random(255));
        //fill(palette[(int)random(5)]);
        rect(cw*x, ch*y, cw, ch);
        rect(width-cw*x, ch*y, cw, ch);
        rect(width-cw*x, height-ch*y, cw, ch);
        rect(cw*x, height-ch*y, cw, ch);
      }
    }
    break;  

  case 2:
    for (int x=0; x<=3; x++) {
      for (int y=0; y<7; y++) {
        fill(palette[(int)random(ncolors-1)]);
        rect(cw*x, ch*y, cw, ch);
        rect(cw*(6-x), ch*y, cw, ch);
      }
    }
    break; 

  case 3:
    fill(palette[(int)random(ncolors-1)]);
    for (int x=0; x<=3; x++) {
      for (int y=0; y<7; y++) {
        if (random(1)>0.5) {
          rect(cw*x, ch*y, cw, ch);
          rect(cw*(6-x), ch*y, cw, ch);
        }
      }
    }
    break;

  case 4:

    cw = 5;
    ch = 5;

    for (int f=0; f<13; f++) {
      for (int g=0; g<13; g++) {
        fill(palette[(int)random(ncolors-1)]);
        for (int x=0; x<=3; x++) {
          for (int y=0; y<7; y++) {
            if (random(1)>0.5) {
              rect(cw*x+2*6*f*cw, ch*y+2*6*g*ch, cw, ch);
              rect(cw*(6-x)+2*6*f*cw, ch*y+2*6*g*ch, cw, ch);
            }
          }
        }
      }
    }
    break;


  case 5:

    cw = 5;
    ch = 5;

    for (int f=0; f<13; f++) {
      for (int g=0; g<13; g++) {
        //for (int h=0; h<2; h++) {
        //for (int h=0; h<map(mouseY,0,height,1,8); h++) {
          fill(palette[(int)random(ncolors-1)]);
          for (int x=0; x<=3; x++) {
            for (int y=0; y<7; y++) {
              if (random(1)>map(mouseX, 0, width, 0, 1)) {
                rect(cw*x+2*6*f*cw, ch*y+2*6*g*ch, cw, ch);
                rect(cw*(6-x)+2*6*f*cw, ch*y+2*6*g*ch, cw, ch);
              }
            }
          }
        //}
      }
    }
  }
}


void keyPressed() {
  redraw();
}