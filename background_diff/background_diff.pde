import hypermedia.video.*;

OpenCV opencv;

void setup() {
  size(640, 480);

  opencv = new OpenCV(this);
  opencv.capture(width / 2, height / 2);
}

void draw() {
  opencv.read();
  image(opencv.image(), 0, 0); // 元画像(左上)

  opencv.absDiff(); // MEMORYとの差分を取る
  image(opencv.image(OpenCV.MEMORY), 320, 0); // MEMORYに保存された画像(右上)
  image(opencv.image(), 320, 240); // 差分(右下)
}

void keyPressed() {
  opencv.remember(); // OpenCV.MEMORY に画像を保存
}