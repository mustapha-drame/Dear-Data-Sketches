/**
 * Sketch Name: Week 1 Dear Data Sketch
 * Author: Ahmed Mustapha DRAME
 * Description: This sketch includes an interactive visual representation with an audio playback.
 * 
 * Audio Attribution:
 * Title: "Hinoki Wood" As "ImJustAChillGuy" in my sketch
 * Artist: Gia Margaret
 * Source: Youtube
 */

import processing.sound.*;

SoundFile chill_song;
// Let's be clear about my circle properties
int numCircles = 15;  // Number of circles
float arcRadius = 150;  // Radius of the arc
float diameter = 30;  // Diameter of the circles
color[] circleColors = new color[numCircles];  // Array to hold the colors of the circles

void setup() {
  size(500, 500); 
  background(200); // Grey background
  chill_song = new SoundFile(this, "ImJustAChillGuy.wav");
  
  // Directly initialize the colors of the circles (they depict my attention around classes)
  circleColors[0] = color(255, 0, 0);  // Red
  circleColors[1] = color(165, 42, 42); // Brown
  circleColors[2] = color(0, 255, 255); // Turquoise
  circleColors[3] = color(8, 28, 156); // Cobalt blue
  circleColors[4] = color(0, 128, 0); // Green
  circleColors[5] = color(192, 192, 192); // Mixed grey/white
  circleColors[6] = color(0, 0, 0); // Mixed white/black
  circleColors[7] = color(128, 0, 0); // Burgundy Red
  circleColors[8] = color(0, 0, 255); // Blue
  circleColors[9] = color(0, 0, 0); // Black
  circleColors[10] = color(128, 60, 164); // Purple
  circleColors[11] = color(255, 165, 0); // Orange
  circleColors[12] = color(0, 255, 255); // Turquoise
  circleColors[13] = color(255, 165, 0); // Orange
  circleColors[14] = color(255, 0, 0);  // Red
}//they mostly represents colours classmates wore

void draw() {
  background(200);  // Clear background every frame
  drawEye();  // Draw the background eye(the most important)
  drawCircles();  // Draw the circles around the eye
  drawArrow(mouseX, mouseY);  // Draw the arrow pointing to the mouse position
  
}

void drawEye() {
  noStroke();
  fill(255);
  ellipse(width / 2, height / 2, 300, 150); // Eye shape
  
  fill(64, 164, 223); // Iris is blue
  ellipse(width / 2, height / 2, 120, 120);
  
  fill(0); // Black pupil
  ellipse(width / 2, height / 2, 50, 50);
  
  fill(255, 255, 255, 200); // Eye highlights
  ellipse(width / 2 - 20, height / 2 - 20, 20, 20);
  ellipse(width / 2 + 20, height / 2 + 20, 10, 10);
}

void drawCircles() {
  float arcStartAngle = -PI / 2;  // Starting angle for the arc (top of the eye)
  float arcEndAngle = 3 * PI / 2; // Ending angle for the arc (bottom of the eye)

  for (int i = 0; i < numCircles; i++) {
    //move around this angles
    float angle = lerp(arcStartAngle, arcEndAngle, float(i) / (numCircles - 1));
    float x = width / 2 + cos(angle) * arcRadius;
    float y = height / 2 + sin(angle) * arcRadius;
    
    fill(circleColors[i]);
    ellipse(x, y, diameter, diameter);
  }
}

void drawArrow(float targetX, float targetY) {
  float arrowLength = 120; //  Length of the arrow
  float angle = atan2(targetY - height / 2, targetX - width / 2); // Angle of the arrow between the center of the eye (the origin point) and the mouse position

  // Calculate the end point of the arrow
  float arrowX = width / 2 + cos(angle) * arrowLength;
  float arrowY = height / 2 + sin(angle) * arrowLength;

  // Draw the main line of the arrow
  stroke(0); // Black color for the arrow
  strokeWeight(6); // Thickness of the arrow
  line(width / 2, height / 2, arrowX, arrowY);

  // Draw the arrowhead
  fill(0); // Black color for the arrowhead
  noStroke();
  pushMatrix();
  translate(arrowX, arrowY); // Move to the tip of the arrow
  rotate(angle); // Rotate to align the arrowhead with the arrow

  // Draw the triangular arrowhead
  beginShape();
  vertex(0, 0);
  vertex(-15, 7.5); // Left point of the arrowhead
  vertex(-15, -7.5); // Right point of the arrowhead
  endShape(CLOSE);

  popMatrix();
}

// Detect if the mouse is over any of the circles and turn the circle to blue (why do you think ?)
void mousePressed() {
  for (int i = 0; i < numCircles; i++) {
    float angle = lerp(-PI / 2, 3 * PI / 2, float(i) / (numCircles - 1));
    float x = width / 2 + cos(angle) * arcRadius;
    float y = height / 2 + sin(angle) * arcRadius;
    
    // Check if the mouse is inside the circle
    if (dist(mouseX, mouseY, x, y) < diameter / 2) {
      circleColors[i] = color(0, 0, 255); // Turn the circle blue
    }
  }
}

void keyPressed(){
  if (key =='c'){
    if(chill_song.isPlaying()){
      chill_song.stop();
    } else {
      chill_song.play(); // Play the song if it's not playing
    }
  }
}
