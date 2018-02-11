PImage base;
PGraphics temp, best;

int distBaseTemp, dist_base_best;
int saveCounter = 0, lastImprovement=0;

Parameters p = new Parameters(28);

void setup() {

  size(1000, 550);
  noStroke();
  fill(0);
  textSize(16);

  //frameRate(1);

  base = loadImage("caballero.png"); 

  temp = createGraphics(base.width, base.height);
  temp.beginDraw();
  temp.endDraw();
  temp.rectMode(CORNERS);

  best = createGraphics(base.width, base.height);
  best.beginDraw();
  best.background(#65614d);
  //best.background(255);
  best.endDraw();

  dist_base_best = imgdist(base, best);

}

void draw() {

  temp.beginDraw();
  temp.image(best.get(), 0, 0);

  p.draw();

  temp.endDraw();

  distBaseTemp = imgdist(base, temp);

  if (distBaseTemp < dist_base_best) {

    p.tick();

    best.beginDraw();
    best.image(temp.get(), 0, 0);
    best.endDraw();
    dist_base_best = distBaseTemp;

    if (saveCounter%100==0) {
      best.save(p.name +"_"+nf(saveCounter/100, 4)+".png");
      //println(frameRate);
    }
    saveCounter++;

    lastImprovement = frameCount;
  } 

  image(temp, 500, 0, 500, 500);
  image(best, 0, 0, 500, 500);

  fill(0);
  rect(0, 500, width, 50);

  fill(255);
  text("Diff: " + dist_base_best, 10, 530);
  text("Iter: " + frameCount, 175, 530);
  text("Gens: " + saveCounter, 300, 530);
  text("No improv: " + (frameCount-lastImprovement), 430, 530);
}


int imgdist(PImage i1, PImage i2) {

  int counter = 0;

  if (p.monochrome) {

    for (int f = 0; f<base.width*base.height; f++) {
      counter += abs((i1.pixels[f] & 0xff) - (i2.pixels[f] & 0xff));
    }
  } else {

    for (int f = 0; f<base.width*base.height; f++) {
      counter += abs((i1.pixels[f]     & 0xff) - (i2.pixels[f]      & 0xff));
      counter += abs((i1.pixels[f]>>8  & 0xff) - (i2.pixels[f] >> 8 & 0xff));
      counter += abs((i1.pixels[f]>>16 & 0xff) - (i2.pixels[f] >>16 & 0xff));
    }
  }
  return counter;
}