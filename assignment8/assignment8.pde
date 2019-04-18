/*
Author: Kathy Ching 
Assignment 8, Week 12 
Description: Pulsating golden ratio with tiles. It changes colors when it pushes forward and as it retreats back.
*/
int n = 300;
float t = 10;
float a1;

square s[];

float phi = 1.61803;
float a = TWO_PI/phi;
float constant = 25;

float sx, sy;
float r = 0;

void setup() {
  size(500, 500);
  //pixelDensity(displayDensity());
  frameRate(25);

  s = new square[n];

  color color1 = #272727;
  color color2 = #DBDBDB;

  for (int i = 0; i < n; i++) {
    float r =  constant * sqrt(i);
    sx += cos(a * i) * r;
    sy += sin(a * i) * r;
    if (i % 2 == 0) {
      s[i] = new square(sx, sy, t, t/2, a1, a1, -0.2, color1, color2);
    } else {
      s[i] = new square(sx, sy, t, t/2, a1, a1, -0.2, color2, color1);
    }
    a1 += 0.01;
    t += 0.015;
  }
}

void draw() {
  background(#FFFFFF);
  translate(width/2, height/2);
  //rotate(r);
  //r+=0.005;
  // s1.update();
  // s1.display();

  for (int i = 0; i < n; i++) {
    s[i].update();
    s[i].display();
  }
}

class square {
  //fields 
  //estalbishing variables 
  float x, y;
  float x1, y1;
  float x2, y2;
  float x3, y3;
  float x4, y4;
  float r;
  float rMin, rMax;
  float aRa = TWO_PI;
  float aRot = -QUARTER_PI;
  float inc;
  color c;
  color c1, c2;
  float cLrp;
  float aCol = aRot;
  
  //constructors 
  square (float x_, float y_, float rMin_, float rMax_, float aRa_, float aRot_, float i_, color c1_, color c2_) {
    x = x_;
    y = y_;
    rMin = rMin_;
    rMax = rMax_;
    aRa = aRa_;
    aRot = aRot_;
    inc = i_;
    c1 = c1_;
    c2 = c2_;
    noStroke();
  }
  //methods
  void update() {
    r = map(cos(aRa), -1, 1, rMin, rMax);
    cLrp = norm(cos(aCol), -1, 1);
    c = lerpColor(c1, c2, cLrp);

    aRa += inc;
    aCol += inc/2;

    x1 = xy(x, y, r, aRot+QUARTER_PI)[0];
    y1 = xy(x, y, r, aRot+QUARTER_PI)[1];
    x2 = xy(x, y, r, aRot+HALF_PI+QUARTER_PI)[0];
    y2 = xy(x, y, r, aRot+HALF_PI+QUARTER_PI)[1];
    x3 = xy(x, y, r, aRot+PI+QUARTER_PI)[0];
    y3 = xy(x, y, r, aRot+PI+QUARTER_PI)[1];
    x4 = xy(x, y, r, aRot+TWO_PI-QUARTER_PI)[0];
    y4 = xy(x, y, r, aRot+TWO_PI-QUARTER_PI)[1];
    aRot += inc/4;
  }

  void display() {
    fill(c);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
  }
} 

float[] xy(float cx, float cy, float r, float a) {
  float[] f = new float[2];
  f[0] = cx + cos(a) * r;
  f[1] = cy + sin(a) * r;
  return f;
}
