/*
Images_06_PixelBuffer-Pointilism.pde
Author: Kathy Ching 
Summary: Using RGB Values to creative little circle pixels to generate the image attached.
*/

//source image
PImage img;
//
int ellipseSize = 25;

void setup(){
  frameRate(120);
  size(600, 600);
  img = loadImage("pokemon_starter.png");
  background(255);
  noStroke();
}

void draw(){
  //pick a random point on the image
  int x = int(random(img.width));
  int y = int(random(img.height));
  //compute location just as before
  int loc = x + (y * img.width);
  
  //access the color of that pixel using the red, green blue() functions
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  
  //map the image location to the canvas location
  x = int(map(x, 0, img.width, 0, width));
  y = int(map(y, 0, img.height, 0, height));
  
  //draw an ellipse at that location with that color
  fill(r, g, b, 100); //slightly transparent fill
  ellipse(x, y, ellipseSize, ellipseSize);
  
}
