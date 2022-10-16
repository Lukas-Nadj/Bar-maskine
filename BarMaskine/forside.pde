void forside() {
  //tegner baggrunden
  image(Forside, 0, 0);
  //vi har faktisk duplikeret vores drinks på bunden så vi kan scrolle dem ind på skærmen, og når de så når udkanten, hoppe fra kopien drinksne over til de originale, så de kan scrolle ind igen
    
    //indexen er til lokation, mens c variablen er en index der tilsvarere hvilken drink det er, altså fra 0-14 og så 0-14 igen. istedet for 0-28
    byte c = 0;
    for (int i = 0; i < 28; i ++) {
      c += 1;
      if (c==13) {
        c = 0;
      }
      
      ellipse (i*97+ballsTime*(-Balls), 700, 60, 60);
      imageMode(CENTER);
      image(smalldrinks[c], i*97+ballsTime*(-Balls), 700);
      imageMode(CORNER);
    }
}
