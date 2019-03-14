/* 
Particle System.pde
Author: Kathy Ching 
Summary: A particle system that pulsates as you keep running it. The more you run it, the more particles will start to fall out of the cluster that it is 
initially in, in the middle. Clicking will force the particles to shake. It's kinda like a colorful salt shaker.
*/

//Radius of particles, number of particles and how much force they are going to be clustered together
float particleradius = 3.0;
float numofparticles = 1000;
float force = 6.0;

ArrayList<Particle> particles; 

void setup(){
  size(500, 500);
  smooth();
  frameRate(24);
  noStroke();
  particles = new ArrayList<Particle>(); //particles of this system
  for(int i = 0; i < numofparticles; i++){
    particles.add(new Particle());
  }
}

void draw(){
  background(0);
  //loop through the particle sytem
   if (mousePressed == true) {
      translate(random(25),random(-25)); //gives that shaking effect every time you mouseclick
  }
  pushMatrix();
  translate(width/2, height/2);
  for(Particle particle : particles){
    particle.draw();
  }
  popMatrix();
  for(Particle particle : particles){
    particle.update();
  }
  
}

class Particle{
  //fields 
  PVector position;
  PVector velocity;
  color c;
  
  //constructor
  public Particle(){
    position = new PVector(random(200) - 100, random(200) - 100); //spawns at different positions 
    velocity = new PVector(random(10), random(10)); // generates random velocities for the particle 
    c = color(random(255), random(255), random(255)); //generates random colors for the particle 
  }
  
  //method
  void draw(){
    fill(c);
    ellipse(position.x, position.y, particleradius * 2, particleradius * 2); //draws the cluster of particles that surrounds each other while a few fly out.
  }
  
  void update(){
    PVector acceleration = new PVector(force * -1.0 * position.x / position.mag(), force * -1.0 * position.y / position.mag()); //Everytime it accelerates, the particles move even farther away from the center and faster. 
    velocity.add(acceleration);
    position.add(velocity);
  }


}
