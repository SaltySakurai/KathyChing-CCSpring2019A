/*
Homework #3 
Kathy Ching 
Interactive with user input on a moving object
*/
int xPos=200;
int xDir=3;

void setup()
{
  size (400,400);
  smooth();
  background(0);
  noStroke();
  fill(0,255,0);
}

void draw(){

  background(0);
  ellipse(xPos, 200, 40, 40);
  xPos=xPos+xDir;
  if (xPos>width-20 || xPos<20) //moves the ball, if the ball reaches within the limits, it will bounce off the bounds and into the other direction
  {
    xDir=-xDir;
  }
}

void mousePressed(){ //if mouse is clicked, it will change the color 
   fill (random(255),random(255), random(255));
}
