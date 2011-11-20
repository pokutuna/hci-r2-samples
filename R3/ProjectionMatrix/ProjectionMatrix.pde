import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;

CaptureDS capture;
SingleARTKMarker artk;
PMatrix3D projection = null;

void setup() {
  size(640, 480, P3D);
  stroke(128);
  colorMode(RGB);

  capture = new CaptureDS(this, width, height, 30);

  artk = new SingleARTKMarker(this, width, height, "camera_para.dat");
  artk.setARCodes("patt.hiro", 80);
  artk.setARPerspective(); //ARToolkit準拠の変換行列を使う
}

void captureEvent(CaptureDS myCapture) {
  myCapture.read();
}

void draw() {
  background(255);
  artk.drawBackground(capture);
  artk.detect(capture);

  artk.beginTransform();
  translate(0, 0, 20);
  box(40);
  artk.endTransform();

  if (projection != null) {
    pushMatrix();
    setMatrix(projection); // 変換行列を適用
    translate(0, 0, 20);
    box(40);
    popMatrix();
  }
}

void keyPressed() {
  projection = artk.getMarkerMatrix(); // マーカ座標系への変換行列を取得
  projection.print();
}
