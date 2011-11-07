import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
PImage faceArea, img;

void setup() {
  size(640, 480);

  opencv = new OpenCV(this);
  opencv.capture(width, height);
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT);

  img = loadImage("hitode.png");
}

void draw() {
  opencv.read();
  image(opencv.image(), 0, 0);
    
  Rectangle[] faces = opencv.detect();

  if (1 <= faces.length) {
    faceArea = get(faces[0].x, faces[0].y, faces[0].width, faces[0].height); // 顔領域をコピー
    image(faceArea, 0, 0);
    image(img, faces[0].x, faces[0].y, faces[0].width, faces[0].height);
  }
}
