/*
Particle System.pde
Author: Kathy Ching
Summary: A particle system that pulsates as you keep running it. The more you run it, the more particles will start to fall out of the cluster that it is
initially in, in the middle. Clicking will force the particles to shake. It's kinda like a colorful salt shaker.
*/

//Radius of particles, number of particles and how much force they are going to be clustered together
var particleradius = 3.0;
var numofparticles = 1000;
var force = 6.0;

ArrayList<Particle> particles;

function setup(){
  createCanvas(500, 500);
  smooth();
  frameRate()(24);
  noStroke();
  particles = new ArrayList<Particle>(); //particles of this system
  for(var i = 0; i < numofparticles; i++){
    particles.add(new Particle());
  }
}

function draw(){
  background(0);
  //loop through the particle sytem
  // == or -==
   if (mouseIsPressed == true) {
      translate(random(25),random(-25)); //gives that shaking effect every time you mouseclick
  }
  push();
  translate(width/2, height/2);
  for(Particle particle : particles){
    particle.draw();
  }
  pop();
  for(Particle particle : particles){
    particle.update();
  }

}

class Particle{
  // fields do not exist, had to edit this because fields technically become constructors in javascript
  // Web Dev is like being a body builder as opposed to be Bruce Lee, one you master technique, the other you just go to the gym all the time
  constructor (position = new var(random(200) - 100, random(200) - 100), velocity = new var(random(10), random(10)), c =color(random(255), random(255), random(255))) {

    this.position = position; //spawns at different positions
    this.velocity = velocity;  // generates random velocities for the particle
    this.c = c; //generates random colors for the particle
  }

  //method
  draw(){
    fill(c);
    ellipse(position.x, position.y, particleradius * 2, particleradius * 2); //draws the cluster of particles that surrounds each other while a few fly out.
  }

  update(){
    var acceleration = new var(force * -1.0 * position.x / position.mag(), force * -1.0 * position.y / position.mag()); //Everytime it accelerates, the particles move even farther away from the center and faster.
    velocity.add(acceleration);
    position.add(velocity);
  }


}
