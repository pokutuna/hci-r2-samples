import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

void setup() {
  size(320, 240);

  opencv = new OpenCV(this);
  opencv.capture(width, height);
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT); //顔正面のカスケード識別器をロード

  noFill();
  stroke(255,0,0);
}

void blurRectangle(Rectangle rectangle) {
  opencv.ROI(rectangle);
  opencv.blur(OpenCV.BLUR, 13);
  opencv.ROI(null);
}

void draw() {
  opencv.read();
  Rectangle[] faces = opencv.detect();

  for( int i=0; i<faces.length; i++ ) {
    blurRectangle(faces[i]);
  }

  image(opencv.image(), 0, 0);
}
