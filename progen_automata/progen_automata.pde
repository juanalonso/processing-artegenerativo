int scene = 3;


int cellSize = 8;
int cols, rows;

int[][] cells;

void setup() {

  size(600, 600);

  cols = width / cellSize;
  rows = height / cellSize;

  cells = new int[cols][rows];

  initCellArray();
}

void draw() {

  background(0);

  for (int f=0; f<2000; f++) {

    int xr = (int)random(1, cols-1);
    int yr = (int)random(1, rows-1);

    switch(scene) {
    case 0:
      //Subir hasta seis
      if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=2) {
        cells[xr][yr]=255;
      }
      break;
    case 1:
      //Llegar a 4/3
      if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=6) {
        cells[xr][yr]=255;
      }
      if (cells[xr][yr]==255 && countNeighbours(xr, yr)<=0) {
        cells[xr][yr]=0;
      }
      break;
    case 2:
     //Llegar a 6/8
      if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=0) {
        cells[xr][yr]=255;
      }
      if (cells[xr][yr]==255 && countNeighbours(xr, yr)>=8) {
        cells[xr][yr]=0;
      }
      break;
    case 3:
      //Llegar a 1 / 1 y break
      if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=1) {
        cells[xr][yr]=255;
        //break;
      }
      if (cells[xr][yr]==255 && countNeighbours(xr, yr)>=5) {
        cells[xr][yr]=0;
      }

      break;
    case 4:
      break;
    }

    /*
    if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=1) {
     cells[xr][yr]=255;
     }
     if (cells[xr][yr]==255 && countNeighbours(xr, yr)>=5) {
     cells[xr][yr]=0;
     }
     
     if (cells[xr][yr]==0 && countNeighbours(xr, yr)>=1) {
     cells[xr][yr]=255;
     }
     if (cells[xr][yr]==255 && countNeighbours(xr, yr)>=5) {
     cells[xr][yr]=0;
     */
  }




  for (int y=0; y<rows; y++) {
    for (int x=0; x<cols; x++) {
      fill(cells[x][y]);
      rect(x*cellSize, y*cellSize, cellSize, cellSize);
    }
  }
}

void initCellArray() {

  for (int y=0; y<rows; y++) {
    for (int x=0; x<cols; x++) {
      cells[x][y] = 0;
    }
  }
  for (int f=0; f<2000; f++) {
    cells[(int)random(0, cols)][(int)random(0, rows)] = 255;
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
  initCellArray();
}