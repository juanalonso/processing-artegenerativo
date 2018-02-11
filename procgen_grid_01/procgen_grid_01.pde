int scene = 0;

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


color function_00(int x, int y, float t) {

  //Ruido blanco
  float noise = (int)random(0, 2)*255;
  return color((int)noise);
}



color function_01(int x, int y, float t) {

  //Ruido de Perlin
  float noise = noise(x, y)*255;
  //float noise = noise(x/150, y/150)*255;
  //float noise = noise(x/150.0, y/150.0)*255;
  //float noise = noise(x/150.0+t, y/150.0)*255;
  //float noise = noise(x/150.0, y/150.0, t)*255;
  return color((int)noise);
}



color function_02(int x, int y, float t) {

  int c;

  //1
  float noise = noise(x/150.0, y/150.0, cos(t*TWO_PI)/3.0)*255;
  c = (int)noise;

  //2
  //float noise = noise(x/150.0, y/150.0, cos(t*TWO_PI)/3.0);
  //if (noise <0.50) {
  //  c = 0;
  //} else {
  //  c= 255;
  //}

  //3
  //float limit = map(mouseX,0,width,0,1);
  //float noise = noise(x/150.0, y/150.0);
  //if (noise <limit) {
  //  c = 0;
  //} else {
  //  c= 255;
  //}

  //4
  //float limit = map(cos(t*TWO_PI),-1,1,0,1);
  //float noise = noise(x/150.0, y/150.0);
  //if (noise < limit) {
  //  c = 0;
  //} else {
  //  c= 255;
  //}

  //5
  //float noise = noise(x/150.0, y/150.0, cos(t*TWO_PI));
  //if (noise <0.45) {
  //  c = 0;
  //} else if (noise <0.50) {
  //  c = 80;
  //} else if (noise <0.60) {
  //  c = 160;
  //} else {
  //  c= 255;
  //}

  //6
  //float noise = noise(x/150.0, y/150.0, t);
  //if (noise <0.45) {
  //  c = 0;
  //} else if (noise <0.50) {
  //  c = 255;
  //} else if (noise <0.51) {
  //  c = 0;
  //} else {
  //  c= 255;
  //}

  return color(c);
}

color function_03(int x, int y, float t) {

  int r = 0, g = 0, b = 0;

  //1
  float noise = noise(x/150.0, y/150.0, t);
  if (noise>=0.50 && noise<= 0.51) {
    r = 255;
  } 
  if (noise>=0.60 && noise<= 0.61) {
    g = 255;
  } 
  if (noise>=0.70 && noise<= 0.71) {
    b = 255;
  } 

  //2
  //float noise = noise(x/150.0, y/150.0, t);
  //if (noise>=0.50 && noise<= 0.65) {
  //  r = 255;
  //} 
  //if (noise>=0.60 && noise<= 0.61) {
  //  g = 255;
  //} 
  //if (noise>=0.605 && noise<= 0.71) {
  //  b = 255;
  //}   

  //3
  //float noise = noise(x/150.0, y/150.0, t);
  //if (noise>=0.50 && noise<= 0.51) {
  //  r = 255;
  //} 
  //noise = noise(5+x/150.0, y/150.0, t);
  //if (noise>=0.50 && noise<= 0.51) {
  //  g = 255;
  //} 
  //noise = noise(10+x/150.0, y/150.0, t);  
  //if (noise>=0.50 && noise<= 0.51) {
  //  b = 255;
  //}   

  //4
  //float noise = noise(x/150.0, y/150.0, t);
  //if (noise>=0.50 && noise<= 0.51) {
  //  r = 255;
  //} 
  //noise = noise(x/150.0, y/150.0, t+0.1);
  //if (noise>=0.50 && noise<= 0.51) {
  //  g = 255;
  //} 
  //noise = noise(x/150.0, y/150.0, t+0.2);  
  //if (noise>=0.50 && noise<= 0.51) {
  //  b = 255;
  //}   

  //5
  //float noise = noise(x/150.0, y/150.0, t);
  //r = (int)map(noise, 0.45, 0.60, 0, 255);
  //g = (int)map(noise, 0.55, 0.70, 0, 255);
  //b = (int)map(noise, 0.60, 0.80, 0, 255);

  return color(r, g, b);
}