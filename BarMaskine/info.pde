//laver en array til navnet af hver drink
String[] Titel = new String[14];

void load() {
  //indlæser navnene
  Titel[0] = "Orange juice";
  Titel[1] = "Drink 2";
  Titel[2] = "Cosmopolitan";
  Titel[3] = "Drink 4";
  Titel[4] = "Drink 5";
  Titel[5] = "Drink 6";
  Titel[6] = "Drink 7";
  Titel[7] = "Drink 8";
  Titel[8] = "Drink 9";
  Titel[9] = "Drink 10";
  Titel[10] = "Drink 11";
  Titel[11] = "Drink 12";
  Titel[12] = "Drink 13";
  Titel[13] = "Drink 14";
}

void mereinfo() {
  //tegner baggrund
  image(information, 0, 0);
  //tegner billedet af drinken
  imageMode(CENTER);
  image(bigdrinks[index+2], 419, 384.5);
  imageMode(CORNER);

  //skriver drinknavn på skærmen
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text(Titel[index+2], 838, 105, 405, 91);

  //lorem ipsum tekst, som er reserveret til beskrivelse af drink/ingredient.
  textSize(20);
  textAlign(LEFT, BOTTOM);
  text(a, 838, 219, 405, 315);
  fill(255);
}
