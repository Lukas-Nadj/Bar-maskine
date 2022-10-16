void vælgdrink() {
  //tegn baggrund
  image(Vælgdrink, 0, 0);
  // tegner overviewet i toppen, og farver ellipsen for at indikere hvor man er
  for (int m = 0; m < 14; m ++) {
    if (m>=index+1&&index+1>=m-2) {
      if (index+1==m-1) {
        fill(#FF8989);
      } else {
        fill(#FFC4C4);
      }
    }
    ellipse (m*97+45, 59, 60, 60);
    fill(255);

    imageMode(CENTER);
    image(smalldrinks[m], m*97+45, 59);
    imageMode(CORNER);
  }

  // der ligger normalt 3 ellipser på skærmen bag drinkene, men når man når den aller sidste eller første drink, er der ingen drink til højre eller venstre
  //derfor tegner vi kun de nødvendige 
  if (index<=10&&index>=-1) {
    ellipse (400-130, 360, 360, 360);
    ellipse (800-130, 360, 360, 360);
    ellipse (1200-130, 360, 360, 360);
  } else if (index==11) {
    ellipse (400-130, 360, 360, 360);
    ellipse (800-130, 360, 360, 360);
  } else if (index==-2) {
    ellipse (800-130, 360, 360, 360);
    ellipse (1200-130, 360, 360, 360);
  }
  imageMode(CENTER);
  
  //tegner drinkene til skærmen med en forskydning proportionel til deres index
  for (int v = 0; v < 14; v ++) {
    image(bigdrinks[v], v*400-130-index*400, 360);
  }
  imageMode(CORNER);



  // vi tegner usynlige rektangler i kanterne af siden, for at gemme drinks i udkanten af skærmen 
  noStroke();
  rect(0, 90, 80, height);
  rect(1260, 90, 106, height);
  stroke(0);

  //tegner pilene
  image(RPil, 1304, 315);
  image(LPil, 20, 315);
}
