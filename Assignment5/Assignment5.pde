//Kathy Ching 
//Summary: 
// Mario that can jump up and down while his buttons on his overalls flash. Uses user imput 
//make him jump up and down. 
void setup () {
size (500, 400);




}


void draw () {

  background (255);
    if (mousePressed == true) {
      translate(20,-100); 
  }
 

  noStroke();
  
 
  int red = int(random (0, 255));
  int green = int(random(20,200));
  int blue = int(random(60,150)) ;
  
  pushMatrix(); 
  

  fill (red, green, blue);
  //make buttons change color using random command
  rect (200, 240, 20, 20);
  rect (260, 240, 20, 20);
  
  fill (5, 5, 5);
  rect (260,80, 20, 40);
  rect (280, 120, 20, 20);
  rect (260, 140, 80, 20);
  
  fill (255, 0, 0);
  rect (160, 60, 20, 20);
  rect (180, 40, 100, 40);
  rect (280, 60, 60, 20);
  rect (120, 220, 20, 20);
  rect (140, 200, 20, 40);
  rect (160, 180, 40, 60);
  rect (160, 240, 20, 20);
  rect (220, 180, 40, 40);
  rect (260, 180, 20, 20);
  rect (280, 200, 60, 40);
  rect (340, 220, 20, 20);
  rect (300, 240, 20, 20);
  
  fill (124, 63, 2);
  rect (140, 100, 20, 60);
  rect (160, 140, 20, 20);
  rect (160, 80, 60, 20);
  rect (180, 100, 20, 40);
  rect (200, 120, 20, 20);
  rect (120, 340, 20, 20);
  rect (140, 320, 60, 40);
  rect (340, 340, 20, 20);
  rect (280, 320, 60, 40);
  
  fill (16, 2, 180);
  rect (200, 180, 20, 60);
  rect (220, 220, 60, 20);
  rect (260, 200, 20, 20);
  rect (160, 280, 60, 40);
  rect (180, 240, 20, 40);
  rect (200, 260, 20, 20);
  rect (220, 240, 40, 60);
  rect (280, 240, 20, 20);
  rect (260, 260, 40, 60);
  rect (300, 280, 20, 40);
  
  fill (234, 171, 76);
  rect (160, 100, 20, 40);
  rect (120, 240, 40, 60);
  rect (160, 260, 20, 20);
  rect (300, 260, 20, 20);
  rect (320, 240, 40, 60);
  rect (200, 100, 20, 20);
  rect (220, 80, 40, 100);
  rect (260, 120, 20, 20);
  rect (180, 140, 40, 40);
  rect (280, 80, 20, 40);
  rect (300, 100, 20, 40);
  rect (320, 120, 40, 20);
  rect (260, 160, 60, 20);
  
    popMatrix();
}
