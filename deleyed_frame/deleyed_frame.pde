import hypermedia.video.*;

OpenCV opencv;
int frameIndex = 0;
PImage[] frames = new PImage[16];

void setup() {
  size(640, 480);

  opencv = new OpenCV(this);
  opencv.capture(width, height);

  initializeFrames();
}

// 先に16回読み込んでおいてframesを初期化
void initializeFrames() {
  for(int i = 0 ; i < frames.length; i++) {
    opencv.read();
    pushImage();
  }
}

void pushImage() {
  frames[frameIndex] = opencv.image();
  incrementFrameIndex();
}

void incrementFrameIndex() {
  frameIndex += 1;
  if (frameIndex == 16) frameIndex = 0;
}

void draw() {
  opencv.read();
  pushImage();

  int w = width / 4;
  int h = height / 4;

  for(int i = 0; i < frames.length; i++) {
    int x = i % 4 * w;
    int y = i / 4 * h;
    image(frames[i], x, y, w, h);
  }
}
