void vaelgdrink() {
  //tegn baggrund
  image(Vaelgdrink, 0, 0);
  // tegner overviewet i toppen, og farver ellipsen for at indikere hvor man er
  for (int m = 0; m < 14; m ++) {
    if (m>=index+1&&index+1>=m-2) {
      if (index+1==m-1) {
        fill(#FF8989);
      } else {
        fill(#FFC4C4);
      }
    }
    ellipse (m*117+65, 59, 60, 60);
    fill(255);

    imageMode(CENTER);
    image(smalldrinks[m], m*117+65, 59);
    imageMode(CORNER);
  }

  // der ligger normalt 3 ellipser på skaermen bag drinkene, men når man når den aller sidste eller første drink, er der ingen drink til højre eller venstre
  //derfor tegner vi kun de nødvendige 
  ellipseMode(CENTER);
  if (index<=10&&index>=-1) {
    ellipse (width/2-450, height/2, 400, 500);
    ellipse (width/2, height/2, 400, 500);
    ellipse (width/2+450, height/2, 400, 500);
  } else if (index==11) {
    ellipse (width/2-450, height/2, 400, 500);
    ellipse (width/2, height/2, 400, 500);
  } else if (index==-2) {
    ellipse (width/2, height/2, 400, 500);
    ellipse (width/2+450, height/2, 400, 500);
    
  }
  //ellipseMode(CORNER);
  imageMode(CENTER);
  
  //tegner drinkene til skaermen med en forskydning proportionel til deres index
  for (int v = 0; v < 14; v ++) {
    image(bigdrinks[v], v*450-130-index*450, 600);
  }
  imageMode(CORNER);



  // vi tegner usynlige rektangler i kanterne af siden, for at gemme drinks i udkanten af skaermen 
  noStroke();
  rect(0, 90, 100, height);
  rect(width-106, 90, 106, height);
  stroke(0);

  //tegner pilene
  image(RPil, width-60, height/2-69.5);
  image(LPil, 20, height/2-69.5);
}
