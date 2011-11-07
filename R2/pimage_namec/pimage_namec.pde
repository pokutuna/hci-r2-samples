import hypermedia.video.*;

OpenCV opencv;
PImage img;

void setup() {
  size(640, 480);

  opencv = new OpenCV(this);
  opencv.capture(width, height);

  colorMode(HSB, 360);
}

boolean isSkin(color c) {
  if(5 < hue(c) && hue(c) < 35 ) {
    return true;
  } else {
    return false;
  }
}

color changeColor(color c) {
  return color(hue(c) + 100, saturation(c), brightness(c));
}

void draw() {
  opencv.read();
  img = opencv.image();

  color c;
  for(int w = 0; w < img.width; w++) {
    for(int h = 0; h < img.height; h++){
      c = img.get(w, h);
      if (isSkin(c)) {
        img.set(w, h, changeColor(c));
      }
    }
  }

  image(img, 0, 0);
}
