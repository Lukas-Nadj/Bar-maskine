void vælgdrink() {
  image(Vælgdrink, 0, 0);

  for (int m = 0; m < 14; m ++) {
    if (m-1>=index-1&&index+1>=m-1) {
      if (index==m-1) {
        fill(#FF8989);
      } else {
        fill(#FFC4C4);
      }
    } else {
      fill(255);
    }
    ellipse (m*97+45, 59, 60, 60);

if (index<=10&&index>=-1){
    ellipse (400-130, 360, 360, 360);
    ellipse (800-130, 360, 360, 360);
    ellipse (1200-130, 360, 360, 360);
} else if (index==11){
    ellipse (400-130, 360, 360, 360);
    ellipse (800-130, 360, 360, 360);
}else if (index==-2){
   ellipse (800-130, 360, 360, 360);
    ellipse (1200-130, 360, 360, 360);
}
    imageMode(CENTER);
    image(smalldrinks[m], m*97+45, 59);
    imageMode(CORNER);
  }


  ellipse (400-130, 360, 360, 360);
  ellipse (800-130, 360, 360, 360);
  ellipse (1200-130, 360, 360, 360);
  imageMode(CENTER);

  for (int v = 0; v < 14; v ++) {
    image(bigdrinks[v], v*400-130-index*400, 360);
  }
  imageMode(CORNER);




  noStroke();
  rect(0, 90, 80, height);
  rect(1260, 90, 106, height);
  stroke(0);
}
