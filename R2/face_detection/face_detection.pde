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

void draw() {
  opencv.read();
  image(opencv.image(), 0, 0);
    
  Rectangle[] faces = opencv.detect();
    
  for( int i=0; i<faces.length; i++ ) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height); 
  }
}

/*
  Rectangleは四角形を表すクラス
  x座標, y座標, 幅(width)), 高さ(height)を持つ
 */