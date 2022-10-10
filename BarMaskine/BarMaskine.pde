PImage Forside;
PImage Vælgdrink;
PImage information;
float Balls;
int ballsTime  = 0;
Byte state = 0;
int idletime = 0;
Boolean hælder = false;
PImage[] drinks = new PImage[14];
PImage[] smalldrinks = new PImage[14];
PImage[] bigdrinks = new PImage[14];

int index = 4;

String a = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet fringilla augue. Donec rutrum bibendum sapien et rhoncus. Quisque vel lorem in massa iaculis rhoncus ac at orci. Phasellus elit augue, mollis et elementum vel, sodales vel magna. Phasellus vehicula porta mi, pellentesque cursus libero pretium eu. Etiam placerat lectus at congue viverra. Aliquam erat volutpat. Suspendisse eget faucibus erat, vel sodales arcu. In sit amet ex ac leo ultrices porttitor. Cras est massa, feugiat ut sagittis et, suscipit sit amet lectus. Vivamus in semper sapien. Curabitur mi nisl, efficitur quis metus non, pharetra facilisis ipsum. Etiam pretium ante in vehicula luctus. Donec vitae tristique odio. Mauris urna felis, vulputate at nibh id, aliquam vulputate massa.";
String t = "Martini";

void setup() {
  size(1366, 768);
  frameRate(60);
  Forside = loadImage("Forside.png");
  Vælgdrink = loadImage("Vælg drink.png");
  information = loadImage("Mere information.png");
  Balls=(width-97)/(frameRate*60);
  for (int d=0; d<drinks.length; d++) {
    drinks[d]= loadImage("data/"+"drink"+d+".png");
  }

  for (int d=0; d<drinks.length; d++) {
    bigdrinks[d] = loadImage("data/"+"drink"+d+".png");
    bigdrinks[d].resize(359, 541);
    smalldrinks[d] = loadImage("data/"+"drink"+d+".png");
    smalldrinks[d].resize(40, 40);
  }



  load();
}
void draw() {
  background(0);

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

  if (state == 0) {
    forside();
  } else if (state == 1) {
    vælgdrink();
  } else if (state == 2) {
    mereinfo();
  }
}

void mousePressed() {
  idletime = 0;
  if (hælder) {
    return;
  }
  if(state==1){
  if (index!=11&&mouseX>width-489&&mouseY>171&&mouseY<171+416&&mousePressed) {
    index+=1;
    println(index);
  } else if (index!=-2&&mouseX<489&&mouseY>171&&mouseY<171+416&&mousePressed) {
    index-=1;
    println(index);
  } else if (state==1&&mouseX>417&&mouseX<417+228&&mouseY>625&&mouseY<625+96) {
    state = 0;
  } else if (state==1&&mouseX>708&&mouseX<708+228&&mouseY>625&&mouseY<625+96) {
    state = 2;
  }
  }


  if (state==0&&mouseX>564&&mouseX<564+249&&mouseY>575&&mouseY<575+78) {
    state = 1;
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
