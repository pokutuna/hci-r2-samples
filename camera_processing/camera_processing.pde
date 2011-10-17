import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);

  cam = new Capture(this, width, height, 30);
}

void captureEvent(Capture capture) {
  capture.read();
}

void draw() {
  image(cam, 0, 0);
}
