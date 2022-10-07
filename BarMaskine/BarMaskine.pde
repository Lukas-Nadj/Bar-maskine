PImage Forside;PImage Vælgdrink;PImage information;
float Balls;
int ballsTime  = 0;
Byte state = 0;
int idletime = 0;
int d = 0;
Boolean hælder = false;
PImage[] drinks = new PImage[14];

String a = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet fringilla augue. Donec rutrum bibendum sapien et rhoncus. Quisque vel lorem in massa iaculis rhoncus ac at orci. Phasellus elit augue, mollis et elementum vel, sodales vel magna. Phasellus vehicula porta mi, pellentesque cursus libero pretium eu. Etiam placerat lectus at congue viverra. Aliquam erat volutpat. Suspendisse eget faucibus erat, vel sodales arcu. In sit amet ex ac leo ultrices porttitor. Cras est massa, feugiat ut sagittis et, suscipit sit amet lectus. Vivamus in semper sapien. Curabitur mi nisl, efficitur quis metus non, pharetra facilisis ipsum. Etiam pretium ante in vehicula luctus. Donec vitae tristique odio. Mauris urna felis, vulputate at nibh id, aliquam vulputate massa.";
String t = "Martini";

void setup() {
  size(1366, 768);
  frameRate(60);
  Forside = loadImage("Forside.png");
  Vælgdrink = loadImage("Vælg drink.png");
  information = loadImage("Mere information.png");
  Balls=(width-97)/(frameRate*60);
  for (d=0; d<drinks.length; d++) {
    drinks[d]= loadImage("drink"+d+".png");
    drinks[d].resize(40, 40);
  }
  load();
}

void draw() {
  //printArray(drinks);
  //println(ballsTime);
  println(frameRate);
  ballsTime += 1;
  if (ballsTime>60*frameRate) {
    ballsTime = 0;
    //println("done");
  }
  idletime += 1;
  if (idletime>30*frameRate) {
    state = 0;
    idletime = 0;
  }
  //println(idletime);


  if (state == 0) {
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
    } else if (state == 1) {
  image(Vælgdrink, 0, 0);
} else if (state == 2) {
  image(information, 0, 0);
  for (d=0; d<drinks.length; d++) {
    drinks[d]= loadImage("drink"+d+".png");
    drinks[d].resize(359, 541);
  }
  byte e = 2;
  if (e==2) {
    
    imageMode(CENTER);
    image(drinks[e], 419, 384.5);
    imageMode(CORNER);
    
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text(Titel[e],838,105,405,91);
    
    textSize(20);
    textAlign(LEFT,BOTTOM);
    text(a,838,219,405,315);
    
  }
} else {
}
}

void mousePressed() {
  idletime = 0;
  if (hælder) {
    return;
  }

  if (state==0&&mouseX>564&&mouseX<564+249&&mouseY>575&&mouseY<575+78) {
    state = 1;
  } else if (state==1&&mouseX>417&&mouseX<417+228&&mouseY>625&&mouseY<625+96) {
    state = 0;
  } else if (state==1&&mouseX>708&&mouseX<708+228&&mouseY>625&&mouseY<625+96) {
    state = 2;
  } else if (state==2&&mouseX>884&&mouseX<884+140&&mouseY>599&&mouseY<599+77) {
    state = 1;
  } else if (state==2&&mouseX>1050&&mouseX<1050+140&&mouseY>599&&mouseY<599+77&&!hælder) {
    hælder = true;
    println("Hæld!");
    delay(3000);
    println("Færdig!");
    hælder = false;
  }
}
