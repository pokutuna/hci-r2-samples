import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture capture;
MultiMarker artk; // MultiMarkerクラスを使う

void setup() {
  size(640, 480, P3D);
  stroke(128);
  colorMode(RGB);

  capture = new Capture(this, width, height, 30);

  artk = new MultiMarker(this, width, height, "camera_para.dat");
  // マーカを追加した順にidが振られる
  artk.addARMarker("patt.hiro", 80); // id = 0
  artk.addARMarker("patt.kanji", 80); // id = 1
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}

void draw() {
  background(255);
  artk.drawBackground(capture);
  artk.detect(capture);

  if (artk.isExistMarker(0)) {
    artk.beginTransform(0);
    translate(0, 0, 20);
    fill(255, 128, 0);
    box(40);
    artk.endTransform();
  }

  if (artk.isExistMarker(1)) {
    artk.beginTransform(1);
    translate(0, 0, 20);
    fill(0, 128, 255);
    sphere(40);
    artk.endTransform();
  }
}
