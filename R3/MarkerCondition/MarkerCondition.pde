import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;
import hypermedia.video.*;

PFont font;
Capture capture;
SingleARTKMarker artk;

void setup() {
  size(640, 480, P3D);
  colorMode(RGB, 100);

  font = createFont("FFScala", 32);

  capture = new Capture(this, width, height);

  artk = new SingleARTKMarker(this, width, height, "camera_para.dat");
  artk.setARCodes("patt.hiro", 80);
}


void draw() {
  background(255);
  capture.read();

  artk.drawBackground(capture);

  // マーカの状態を取得するサンプル
  switch(artk.detect(capture)){
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

  artk.beginTransform();
  translate(0, 0, 20);
  box(40);
  artk.endTransform();
}
