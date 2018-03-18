class Particula {

  PVector pos, vel, acc;

  Particula(float index) {
    
    pos = new PVector(random(width), random(height));
    vel = PVector.random2D().mult(0);
    acc = new PVector(0, 0.02);
    
    //@2 Número de partículas
    //pos = new PVector(width*index, random(height));
    
    //@3 Número de partículas
    //pos = new PVector(width*index*0.8+width*0.1, random(height));
    
    //@4  Número de partículas

    //@4.1  Número de partículas
    //acc = new PVector(0, 0.008);
    
    //@5 Número de partículas
    //pos = PVector.fromAngle(TWO_PI*index).setMag(150).add(width/2,200);

    //@6
    //vel = PVector.random2D();
    
    //@7 en el método draw()

    //@8
    //vel = PVector.fromAngle(TWO_PI*index);
    
    //@9
    //vel = PVector.fromAngle(TWO_PI*index*4);

    //@10
    //acc = PVector.random2D().setMag(0.0);

    //@11
    //acc = PVector.random2D().setMag(0.02);
    //pos = PVector.fromAngle(TWO_PI*index).setMag(150).add(width/2,height/2);
   
    //@12 8.0
    //acc = PVector.fromAngle(TWO_PI*index*1.0).setMag(0.02);

    //@13 
    //acc = PVector.fromAngle(TWO_PI*index*1.0).setMag(sin(TWO_PI*index*2)/20);

}

  void update() {
    vel.add(acc);
    pos.add(vel);
  }

  void updateForce(Particula p2) {

    PVector dir = PVector.sub(p2.pos, pos);
    float dsquared = dir.magSq();
    float force = 1/dsquared;

    if (force > 5) {
      force = 5;
    }
    acc.add(dir.mult(force));
  }


  void draw() {


    //aceleración
    strokeWeight(1);
    stroke(50, 50, 255, 130);
    //line(pos.x, pos.y, pos.x+acc.x*150, pos.y+acc.y*150);

    //velocidad
    stroke(0, 200, 0, 30);
    //line(pos.x, pos.y, pos.x+vel.x*10, pos.y+vel.y*10);

    //posición
    strokeWeight(2);
    stroke(0, 30);

    //@4.1
    //strokeWeight(15);
    //stroke(0, 5);
    
    
    //@7
    //stroke(0, 5);
    
    point(pos.x, pos.y);

    //acc.mult(0);
  }
}
