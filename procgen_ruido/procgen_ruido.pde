int scene = 0;

color c;

void setup() {

  size(500, 500);
  stroke(255);
  background(0);
}


void draw() {

  loadPixels();

  float t = 1.0*frameCount/100.0;

  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {

      switch(scene) {
      case 0:
        c = function_00(x, y, t);
        break;
      case 1:
        c = function_01(x, y, t);
        break;
      case 2:
        c = function_02(x, y, t);
        break;
      case 3:
        c = function_03(x, y, t);
        break;
      }

      pixels[y*width+x] = c;
    }
  }

  updatePixels();
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