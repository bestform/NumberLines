boolean showIntervalNumbers = false;

void setup() {
  background(255);
  size(1900, 1000);
}

boolean mouseWasPressed = true;

void draw() {
  if (mouseWasPressed) {  
    background(255);
    
    translate(440, 0);
    
    for (int i = 0; i < 5; i++) {
      translate(0, 150);
      drawNumberLine();  
    }
    
    mouseWasPressed = false;
  }
}

void mousePressed() {
  mouseWasPressed = true;
}

void drawNumberLine() {

  int start = -1;
  int end = 2;
  float interval = int(random(2, 20));
  int scale = 300;
  FloatList marks = new FloatList();
  for (int i = 0; i < 5; i++) {
    float newMark = int(random(start*interval, end*interval))/interval;
    if (!marks.hasValue(newMark)) {
      marks.append(newMark);
    }        
  }
  marks.sort();
  
  String[] markNames = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"};  
  
  noSmooth();
 
  // Draw line
  stroke(0);
  strokeWeight(3);
  line(start * scale, 0, end * scale, 0);
  
 
  // Mark whole numbers
  for (float i = start; i < end + 1; i++) {
    line(i * scale, i == 0 ? -20 : -10, i * scale, 0);
  }
  
  // Mark intervals
  strokeWeight(2);
  float step = 1 / interval;
  for (float i = start; i < end; i+=step) {
    line(i * scale, -5, i * scale, 0);
  }

  smooth();
  
  // Label whole numbers
  textSize(22);
  fill(0, 0, 0);
  textAlign(CENTER);
  for (int i = start; i < end + 1; i++) {
    text(i, i*scale, 25); 
  }
  
  // Label interval numbers
  if (showIntervalNumbers) {
    textSize(12);
    fill(0, 0, 0);
    textAlign(CENTER);
    for (float i = start; i < end; i+=step) {
      if (int(i) != i) {
        text(nf(i, 1, 2), i*scale, 25);
      }
    }
  }
  
  // Draw marks
  fill(110, 110, 200);
  stroke(110, 110, 200);
  textSize(22);
  for(int i = 0; i < marks.size(); i++) {
    float mark = marks.get(i);
    triangle(mark * scale, -10, mark * scale - 5, -20, mark * scale + 5, -20);
    text(markNames[i], mark * scale, -25);
  }
  
  // Draw arrows
  fill(0);
  stroke(0);
  strokeWeight(3);
  triangle(start * scale - 40, 0, start * scale - 20, 5, start * scale - 20, -5);
  triangle(end * scale + 40, 0, end * scale + 20, 5, end * scale + 20, -5);
  line(start * scale, 0, start * scale - 20, 0);
  line(end * scale, 0, end * scale + 20, 0);
}
