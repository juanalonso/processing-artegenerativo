class Parameters {

  int repsPerCycle = 10;
  boolean keepBounds = false, monochrome = false;
  float tick  = 0;
  String name;

  PVector p1 = new PVector(), p2 = new PVector(), p3 = new PVector(); 
  color c;
  int mode = 0;
  float timer = 0;

  Parameters(int _m) {
    mode = _m;
    name = nf(mode, 3);
    switch (mode) {
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;
    case 4:
      break;
    case 5:
      break;
    case 6:
      break;
    case 7:
      repsPerCycle = 2;
      break;
    case 8:
      repsPerCycle = 1;
      break;
    case 9:
      repsPerCycle = 1;
      break;
    case 10:
      repsPerCycle = 50;
      break;
    case 11:
      repsPerCycle = 50;
      break;
    case 12:
      repsPerCycle = 50;
      tick = 0.01;
      break;
    case 13:
      tick = PI/3;
      break;
    case 14:
      tick = PI/3;
      break;
    case 15:
      repsPerCycle = 25;
      tick = PI/3;
      break;
    case 16:
      repsPerCycle = 5;
      tick = 0.01;
      break;
    case 17:
      repsPerCycle = 1;
      tick = 1;
      break;
    case 18:
      break;
    case 19:
      break;
    case 20:
      break;
    case 21:
      repsPerCycle = 1;
      break;
    case 22:
      repsPerCycle = 1;
      break;
    case 23:
      break;
    case 24:
      repsPerCycle = 1;
      break;
    case 25:
      repsPerCycle = 1;
      break;
    case 26:
      repsPerCycle = 1;
      break;
    case 27:
      repsPerCycle = 1;
      break;
    case 28:
      repsPerCycle = 1;
      break;
    default:
    }
  }

  void tick() {
    timer += tick;
  }

  void drawFunction() {
    switch (mode) {
    case 1:
      //Círculo
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector(random(5, 50), 150);
      c = base.get((int)(p1.x), (int)(p1.y));
      temp.fill(c);
      temp.noStroke();
      temp.ellipse(p1.x, p1.y, p2.x, p2.x);
      break;
    case 2:
      //Círculo con transparencia
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector(random(5, 50), 150);
      c = base.get((int)(p1.x), (int)(p1.y));
      temp.fill(c, 50);
      temp.noStroke();
      temp.ellipse(p1.x, p1.y, p2.x, p2.x);
      break;
    case 3:
      //Círculo tocho con transparencia (FEO)
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector(random(5, 400), 150);
      c = base.get((int)(p1.x), (int)(p1.y));
      temp.fill(c, 8);
      temp.noStroke();
      temp.ellipse(p1.x, p1.y, p2.x, p2.x);
      break;
    case 4:
      //Círculo semitocho en blanco y negro (o no) con menos transparencia
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector(random(5, 200), 150);
      //c = color((int)random(255));
      c = base.get((int)(p1.x), (int)(p1.y));
      temp.fill(c, 32);
      temp.noStroke();
      temp.ellipse(p1.x, p1.y, p2.x, p2.x);
      break;
    case 5:
      //Círculos pequeños en BN, tarda la vida en converger
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector(random(5, 50), 150);
      c = color((int)random(255));
      temp.fill(c);
      temp.noStroke();
      temp.ellipse(p1.x, p1.y, p2.x, p2.x);
      break;
    case 6:
      //Círculos pequeños en BN, con algo de transparencia. Tarda media vida en converger
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector(random(5, 50), 150);
      c = color((int)random(255));
      temp.fill(c, 200);
      temp.noStroke();
      temp.ellipse(p1.x, p1.y, p2.x, p2.x);
      break;
    case 7:
      //Rectángulos locos con un poco de transparencia (o no converge)
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector ((int)random(base.width), (int)random(base.height));
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.fill(c, 125);
      temp.noStroke();
      temp.rect(p1.x, p1.y, p2.x, p2.y);
      break;
    case 8:
      //Bordes de rectángulos locos 
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector ((int)random(base.width), (int)random(base.height));
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.noFill();
      temp.stroke(c);
      temp.rect(p1.x, p1.y, p2.x, p2.y);
      break;
    case 9:
      //Bordes de rectángulos locos 
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector (p1.x + (int)random(-90, 90), p1.y + (int)random(-90, 90));
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.noFill();
      temp.stroke(c);
      temp.rect(p1.x, p1.y, p2.x, p2.y);
      break;
    case 10:
      //Rectángulos apaisados pequeños sin transparencia, de 50 en 50
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector (p1.x + (int)random(-150, 150), p1.y + (int)random(-40, 40));
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.fill(c);
      temp.noStroke();
      temp.rect(p1.x, p1.y, p2.x, p2.y);
      break;
    case 11:
      //Rectángulos verticales pequeños sin transparencia, de 50 en 50
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector (p1.x + (int)random(-40, 40), p1.y + (int)random(-150, 150));
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.fill(c);
      temp.noStroke();
      temp.rect(p1.x, p1.y, p2.x, p2.y);
      break;
    case 12:
      //Rectángulos con rotación pequeños sin transparencia
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector (p1.x + (int)random(-40, 40), p1.y + (int)random(-250, 250));
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.fill(c);
      temp.noStroke();
      temp.pushMatrix();
      temp.translate((p1.x+p2.x)/2, (p1.y+p2.y)/2);
      temp.rotate(timer);
      temp.translate(-(p1.x+p2.x)/2, -(p1.y+p2.y)/2);
      temp.rect(p1.x, p1.y, p2.x, p2.y);
      temp.popMatrix();
      break;      
    case 13:
      //Rectángulos con rotación de 120º sin transparencia
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector (p1.x + (int)random(-40, 40), p1.y + (int)random(-250, 250));
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.fill(c);
      temp.noStroke();
      temp.pushMatrix();
      temp.translate((p1.x+p2.x)/2, (p1.y+p2.y)/2);
      temp.rotate(timer);
      temp.translate(-(p1.x+p2.x)/2, -(p1.y+p2.y)/2);
      temp.rect(p1.x, p1.y, p2.x, p2.y);
      temp.popMatrix();
      break;      
    case 14:
      //Rectángulos con rotación de 120º sin transparencia
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector (p1.x + 10, p1.y + (int)random(-250, 250));
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.fill(c);
      temp.noStroke();
      temp.pushMatrix();
      temp.translate((p1.x+p2.x)/2, (p1.y+p2.y)/2);
      temp.rotate(timer);
      temp.translate(-(p1.x+p2.x)/2, -(p1.y+p2.y)/2);
      temp.rect(p1.x, p1.y, p2.x, p2.y);
      temp.popMatrix();
      break;    
    case 15:
      //Rectángulos gruesos con rotación de 120º con transparencia
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector (p1.x + 50, p1.y + (int)random(-500, 500));
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.fill(c, 100);
      temp.noStroke();
      temp.pushMatrix();
      temp.translate((p1.x+p2.x)/2, (p1.y+p2.y)/2);
      temp.rotate(timer);
      temp.translate(-(p1.x+p2.x)/2, -(p1.y+p2.y)/2);
      temp.rect(p1.x, p1.y, p2.x, p2.y);
      temp.popMatrix();
      break;
    case 16:
      //Líneas de dimensiones fijas 
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = PVector.fromAngle(timer).setMag(base.width/2);
      c = base.get((int)p1.x, (int)p1.y);
      temp.stroke(c);
      temp.strokeWeight(2);
      temp.line(p1.x-p2.x, p1.y-p2.y, p1.x+p2.x, p1.y+p2.y);
      break;
    case 17:
      //Líneas horizontales y verticales 
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = PVector.fromAngle(timer*HALF_PI).setMag(random(100, 200));
      c = base.get((int)p1.x, (int)p1.y);
      temp.stroke(c);
      temp.strokeWeight(1);
      temp.line(p1.x-p2.x, p1.y-p2.y, p1.x+p2.x, p1.y+p2.y);
      break;
    case 18:
      //Líneas de diferente tamaño, al tuntun 
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = PVector.fromAngle(random(TWO_PI)).setMag(random(150, 600));
      c = base.get((int)p1.x, (int)p1.y);
      temp.stroke(c);
      temp.line(p1.x-p2.x, p1.y-p2.y, p1.x+p2.x, p1.y+p2.y);
      break;
    case 19:
      //El 18 con algo de transparencia 
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = PVector.fromAngle(random(TWO_PI)).setMag(random(150, 600));
      c = base.get((int)p1.x, (int)p1.y);
      temp.stroke(c, 150);
      temp.line(p1.x-p2.x, p1.y-p2.y, p1.x+p2.x, p1.y+p2.y);
      break;
    case 20:
      //El 19 con grosor variable 
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = PVector.fromAngle(random(TWO_PI)).setMag(random(150, 600));
      c = base.get((int)p1.x, (int)p1.y);
      temp.stroke(c, (int)random(50, 250));
      temp.strokeWeight(random(1, 50));
      temp.line(p1.x-p2.x, p1.y-p2.y, p1.x+p2.x, p1.y+p2.y);
      break;
    case 21:
      //Triángulos 
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector ((int)random(base.width), (int)random(base.height));
      p3 = new PVector ((int)random(base.width), (int)random(base.height));
      c = base.get((int)(p1.x+p2.x+p3.x)/3, (int)(p1.y+p2.y+p3.y)/3);
      temp.noStroke();
      temp.fill(c, 150);
      temp.triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
      break;
    case 22:
      //Triángulos 
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector (p1.x+20, p1.y+20);
      p3 = new PVector ((int)random(base.width), (int)random(base.height));
      c = base.get((int)(p1.x+p2.x+p3.x)/3, (int)(p1.y+p2.y+p3.y)/3);
      temp.noStroke();
      temp.fill(c);
      temp.triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
      break;
    case 23:
      //No converge ni a tiros
      if (random(1)>0.5) {
        p1 = new PVector(random(base.width), 0);
        p2 = new PVector(random(base.width), base.height);
      } else {
        p1 = new PVector(0, random(base.height));
        p2 = new PVector(base.width, random(base.height));
      }
      c = base.get((int)(p1.x+p2.x)/2, (int)(p1.y+p2.y)/2);
      temp.stroke(c, 200);
      temp.line(p1.x, p1.y, p2.x, p2.y);
      break;
    case 24:
      //Curvas
      temp.stroke(250*(int)random(2), 120);
      temp.noFill();
      temp.beginShape();
      for (int f=0; f<4; f++) {
        temp.curveVertex(random(base.width), random(base.height));
      }
      temp.endShape();
      break;
    case 25:
      //Curvas en blanco y negro
      temp.stroke(125*(int)random(3), 50+100*(int)random(3));
      temp.noFill();
      temp.beginShape();
      for (int f=0; f<4; f++) {
        temp.curveVertex(random(base.width), random(base.height));
      }
      temp.endShape();
      break;
    case 26:
      //Curvas en color, sin transparencia
      c = base.get((int)random(base.width), (int)random(base.height));
      temp.stroke(c);
      temp.noFill();
      temp.beginShape();
      for (int f=0; f<4; f++) {
        temp.curveVertex(random(base.width), random(base.height));
      }
      temp.endShape();
      break;
    case 27:
      //Curvas en color, pequeñitas
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      c = base.get((int)random(base.width), (int)random(base.height));
      temp.stroke(c);
      temp.noFill();
      temp.beginShape();
      for (int f=0; f<15; f++) {
        temp.curveVertex(p1.x, p1.y);
        p1.add(PVector.random2D().setMag(25+random(25)));
      }
      temp.endShape();
      break;
    case 28:
      //Curvas en color, pequeñitas
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      c = base.get((int)random(base.width), (int)random(base.height));
      temp.stroke(c);
      temp.noFill();
      temp.beginShape();
      for (int f=0; f<8; f++) {
        temp.curveVertex(p1.x, p1.y);
        p1.add(PVector.random2D().setMag(500));
      }
      temp.endShape();
      break;
    default:
      p1 = new PVector ((int)random(base.width), (int)random(base.height));
      p2 = new PVector(random(25, 200), 150);
      c = base.get((int)(p1.x), (int)(p1.y));
      temp.fill(c, 100);
      temp.noStroke();
      temp.ellipse(p1.x, p1.y, p2.x, p2.x);
    }
  }





  /*

   
   
   temp.noFill();
   temp.stroke(random(255),40);
   float pos = random(0, TWO_PI);
   p1 = new PVector(cos(pos)*base.width/2.1 + base.width/2, sin(pos)*base.height/2.1 + base.height/2);
   pos = random(0, TWO_PI);
   p2 = new PVector(cos(pos)*base.width/2.1 + base.width/2, sin(pos)*base.height/2.1 + base.height/2);
   temp.line(p1.x, p1.y, p2.x, p2.y);
   break;
   
   
   */




  void draw() {
    for (int f=0; f<p.repsPerCycle; f++) {
      drawFunction();
    }
  }



  void keepBounds() {

    if (!keepBounds) {
      return;
    }

    if (p1.x+p2.x<0) {
      p2.x = -p1.x;
    }
    if (p1.x+p2.x>base.width) {
      p2.x = base.width - p1.x;
    }
    if (p1.y+p2.y<0) {
      p2.y = -p1.y;
    }
    if (p1.y+p2.y>base.height) {
      p2.y = base.height - p1.y;
    }
  }
}