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
  image(img, 0, 0);

  loadPixels();
  for(int i = 0; i < pixels.length; i++) {
    if (isSkin(pixels[i])) {
      pixels[i] = changeColor(pixels[i]);
    }
  }
  updatePixels();
}
