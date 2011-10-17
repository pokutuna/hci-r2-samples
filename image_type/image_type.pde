import hypermedia.video.*;

OpenCV opencv;

void setup() {
  size(1000, 200);

  opencv = new OpenCV(this);
  opencv.capture(height, height);
  
  PFont font = createFont("ipaexg.ttf", 20);
  fill(255, 0, 128);
  textFont(font);
}

void draw() {
  opencv.read();

  image(opencv.image(), 0, 0);
  text("default", 10, 30);

  image(opencv.image(OpenCV.SOURCE), 200, 0);
  text("SOURCE", 210, 30);

  opencv.flip(OpenCV.FLIP_BOTH);
  image(opencv.image(OpenCV.BUFFER), 400, 0);
  text("BUFFER\n(after opencv.flip)", 410, 30);

  image(opencv.image(OpenCV.MEMORY), 600, 0);
  text("MEMORY\n(update to press key)", 610, 30);

  image(opencv.image(), 800, 0);
  text("default\n(after opencv.flip)", 810, 30);
}

void keyPressed() {
  opencv.remember();
}
