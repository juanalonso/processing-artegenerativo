int scene = 0;

int cellSize = 8;
int cols, rows;

int[][] cells;

color c;

//Pico-8 palette
//https://www.lexaloffle.com/pico-8.php
color[] palette = {#000000, #1D2B53, #7E2553, #008751, #AB5236, #5F574F, #C2C3C7, #FFF1E8, 
  #FF004D, #FFA300, #FFEC27, #00E436, #29ADFF, #83769C, #FF77A8, #FFCCAA};
int ncolors;

void setup() {

  size(600, 600);
  noStroke();

  cols = width / cellSize;
  rows = height / cellSize;

  cells = new int[cols][rows];

  ncolors = palette.length;

  initCanvas();
}

void draw() {

  background(0);

  //c = (frameCount % 2) + 7;

  for (int f=0; f<2000; f++) {

    int xr = (int)random(1, cols-1);
    int yr = (int)random(1, rows-1);

    switch(scene) {
    case 0:
      //Subir hasta seis
      if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=2) {
        cells[xr][yr]=c;
      }
      break;
    case 1:
      //Llegar a 4/3
      if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=6) {
        cells[xr][yr]=c;
      }
      if (cells[xr][yr]!=0 && countNeighbours(xr, yr)<=2) {
        cells[xr][yr]=0;
      }
      break;
    case 2:
      //Llegar a 6/8
      if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=0) {
        cells[xr][yr]=c;
      }
      if (cells[xr][yr]!=0 && countNeighbours(xr, yr)>=8) {
        cells[xr][yr]=0;
      }
      break;
    case 3:
      //Llegar a 1 / 1 y break
      if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=1) {
        cells[xr][yr]=c;
        //break;
      }
      if (cells[xr][yr]!=0 && countNeighbours(xr, yr)>=5) {
        cells[xr][yr]=0;
      }

      break;
    case 4:
      //rotar colores
      if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=4) {
        cells[xr][yr]=c;
      }
      if (cells[xr][yr]!=0 && countNeighbours(xr, yr)<=3) {
        cells[xr][yr]=0;
      }
      break;
    case 5:
      //Conway
      //4/7, 2/5, 2/3
      int cn = countNeighbours(xr, yr);
      if (cn<4 || cn>7 ) {
        cells[xr][yr]=0;
      } else {
        cells[xr][yr]=c;
      }
      break;
    case 6:
      //Crecimiento (cambiar cellSize a 2)
      //Destruir para construir
      if (/*cells[xr][yr]==0 &&*/ (countNeighbours(xr, yr)==1 /*|| countNeighbours(xr, yr)==2*/)) {
        cells[xr][yr]=c;
      } else {
         //cells[xr][yr]=0;
      }

      break;
    }
  }

  for (int y=0; y<rows; y++) {
    for (int x=0; x<cols; x++) {
      fill(palette[cells[x][y]]);
      rect(x*cellSize, y*cellSize, cellSize, cellSize);
    }
  }
}

void initCanvas() {

  c = (int)random(1, ncolors); 

  for (int y=0; y<rows; y++) {
    for (int x=0; x<cols; x++) {
      cells[x][y] = 0;
    }
  }

  for (int f=0; f<2000; f++) {
    cells[(int)random(0, cols)][(int)random(0, rows)] = c;
  }

}

int countNeighbours(int x, int y) {

  int n = 0;

  for (int i=-1; i<=1; i++) {
    for (int j=-1; j<=1; j++) {
      if (j==0 && i==0) {
        continue;
      }
      if (cells[x+i][y+j]!=0) {
        n++;
      }
    }
  }

  return n;
}

void keyPressed() {
  initCanvas();
}