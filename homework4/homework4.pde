/*
Name: Kathy Ching 
My sketch can change colors when you move the mouse left-right, down-up to change spiral thickness
and colors. 
*/

float n = 0; 
float angle = 0; 
int sizex;
int value;
void setup() { 
size(720, 720); 
background(0); 
} 

void draw() { 
  if(value  == 2) {
    x = 1;
    y = 1;
  }
  
sizex = map(mouseY,0,1000,0,30);

float x = n * cos(angle); 
float y = n * sin(angle); 

int r = round(map(mouseY,0,1000,0,255));
int u = round(map(mouseX,0,1000,0,100));
fill(255,r,u+round(map(mouseX,0,1000,0,150))); // R G B, change order of values to play with color or make your own
noStroke(); 

ellipse(x+width/2, y+height/2, sizex, sizex); 

angle += 6;  //change pattern, try from 0.1 
n += map(mouseX,0,width,0.01,0.5)*0.5; 
  
}

void mouseClicked() {
  if (value == 0) {
    value = 2;
  } else {
    value = 0;
  }
}
