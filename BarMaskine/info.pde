//laver en array til navnet af hver drink
String[] Titel = new String[14];

void load() {
  //indlæser navnene
  Titel[0] = "æblejuice";
  Titel[1] = "appelsinjuice";
  Titel[2] = "Ice Tea";
  Titel[3] = "æble-Tea";
  Titel[4] = "appel-Tea";
  Titel[5] = "æblejuice Plus";
  Titel[6] = "Ice Tea plus";
  Titel[7] = "Appelsinjuice Plus";
  Titel[8] = "Æble-Sin-Tea";
  Titel[9] = "Distilled Tea";
  Titel[10] = "Æble-Sin-Tea Plus";
  Titel[11] = "Vand";
  Titel[12] = "Drain";
  Titel[13] = "Clean that shit up";
  
  drinks[0] = new int[]{0, 6, 0, 0, 0, 0, 0, 0, 0};
  drinks[1] = new int[]{0, 0, 6, 0, 0, 0, 0, 0, 0};
  drinks[2] = new int[]{0, 0, 0, 6, 0, 0, 0, 0, 0};
  drinks[3] = new int[]{0, 6, 0, 6, 0, 0, 0, 0, 0};
  drinks[4] = new int[]{0, 0, 6, 6, 0, 0, 0, 0, 0};
  drinks[5] = new int[]{0, 9, 0, 0, 0, 0, 0, 0, 0};
  drinks[6] = new int[]{0, 0, 0, 9, 0, 0, 0, 0, 0};
  drinks[7] = new int[]{0, 0, 9, 0, 0, 0, 0, 0, 0};
  drinks[8] = new int[]{0, 6, 6, 6, 0, 0, 0, 0, 0};
  drinks[9] = new int[]{6, 0, 0, 6, 0, 0, 0, 0, 0};
  drinks[10] = new int[]{0, 5, 5, 5, 0, 0, 0, 0, 0};
  drinks[11] = new int[]{5, 0, 0, 0, 0, 0, 0, 0, 0};
  drinks[12] = new int[]{3, 3, 3, 3, 3, 3, 3, 3, 3};
  drinks[13] = new int[]{3, 3, 3, 3, 3, 3, 3, 3, 3};  

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
