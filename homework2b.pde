void setup(){
  size (1000,1000); 
  background (255); 
  
  
  strokeWeight(10); 
  stroke(0);
  
    // horizontal lines
  for (int i = 0; i < height/50; i++) {
    line(0, 20 + i*25, width, 20 + i*25);
  }
    // vertical lines
  for (int i = 0; i < width/50; i++) {
    line(15 + i*50, height/2, 15 + i*50, height);
  }
  
}
