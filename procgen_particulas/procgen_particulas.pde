Particula[] particulas;
int nParts;


void setup() {

  size (800, 800);
  background(255);

  particulas = new Particula[30];
  
  //@2
  //particulas = new Particula[300];
  
  //@3
  //particulas = new Particula[800];

  //@4
  //particulas = new Particula[5000];

  //@5
  //particulas = new Particula[5000];
  
  nParts= particulas.length;
  
  for (int f = 0; f < nParts; f++) {
    particulas[f] = new Particula((float)f/nParts);
  }
}

void draw() {

  /*for (int f = 0; f < particulas.length; f++) {
    for (int g = f+1; g < particulas.length; g++) {
      particulas[f].updateForce(particulas[g]);
      particulas[g].updateForce(particulas[f]);
    }
  }*/

  for (int f = 0; f < particulas.length; f++) {
    particulas[f].update();
    particulas[f].draw();
  }
}