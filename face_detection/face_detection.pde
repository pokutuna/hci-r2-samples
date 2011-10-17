import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

void setup() {
  size(320, 240);

  opencv = new OpenCV(this);
  opencv.capture(width, height);
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT);
}

void draw() {
  opencv.read();
  image(opencv.image(), 0, 0);
    
  Rectangle[] faces = opencv.detect();
    
  noFill();
  stroke(255,0,0);
  for( int i=0; i<faces.length; i++ ) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height); 
  }
}
