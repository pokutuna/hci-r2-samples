import processing.core.*;
import jp.nyatla.nyar4psg.*;
import hypermedia.video.*;

PFont font;
OpenCV opencv;
SingleARTKMarker nya;

void setup() {
  size(640, 480, P3D);
  colorMode(RGB, 100);
  font = createFont("FFScala", 32);
  opencv = new OpenCV(this);
  opencv.capture(width, height);
  nya = new SingleARTKMarker(this, width, height, "camera_para.dat");
  nya.setARCodes("patt.hiro", 80);
}


void draw() {
  background(255);
  opencv.read();

  PImage img = opencv.image();
  nya.drawBackground(img);

  // マーカの状態を取得するサンプル
  switch(nya.detect(img)){
  case SingleARTKMarker.ST_NOMARKER: // マーカがない
    return;
  case SingleARTKMarker.ST_NEWMARKER: // 新しくマーカが見つかった
    println("Marker found.");
    return;
  case SingleARTKMarker.ST_UPDATEMARKER: //マーカの位置が更新された
    break;
  case SingleARTKMarker.ST_REMOVEMARKER: // マーカが画面から消えた
    println("Marker removed.");
    return;
  default:
    return;
  }

  nya.beginTransform();
  translate(0, 0, 20);
  box(40);
  nya.endTransform();
}
