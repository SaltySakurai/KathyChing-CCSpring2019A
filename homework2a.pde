/*
Kathy Ching - Homework #2
"title" : "Wall Drawing #11 (1969)",
"description" : "A wall divided horizontally and vertically into four equal parts. 
Within each part, three of the four kinds of lines are superimposed." 
( i tried starting from the bottom left 
going counter clockwise... but it didn't work for some reason..?)

*/
void setup() {
  size (1000,1000);
  background (255);
  

  stroke (20);
  line (width/2,0,width/2,height);
  line (0,height/2,width,height/2);


   //bottom
  for (int i = 1; i < 200; i++) {
    line(i*10, width/2, i*10, width); 
      if (i < 200) {
        line(width + i*10, height/2 + i*10, width/2, height/2 + i*10);
      }
  }
  //top
  for (int  i = 1; i < 200; i++) {
    line(width - i*10, height/2,width, height/2 - i*10);
     if (i<200){
        line(width/2 + i*10, height/2, width/2, height/2 - i*10);
     }
  }

}
