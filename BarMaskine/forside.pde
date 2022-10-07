void forside() {
  image(Forside, 0, 0);
  byte c = 0;
  for (int i = 0; i < 28; i ++) {
    c += 1;
    if (c==13) {
      c = 0;
    }
    ellipse (i*97+ballsTime*(-Balls), 700, 60, 60);
    imageMode(CENTER);
    image(drinks[c], i*97+ballsTime*(-Balls), 700);
    imageMode(CORNER);
  }
}
