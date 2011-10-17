import hypermedia.video.*;

OpenCV opencv;

void setup() {
  size(640, 480);

  opencv = new OpenCV(this);
  opencv.capture(width, height);
}

void draw() {
  opencv.read();

}
