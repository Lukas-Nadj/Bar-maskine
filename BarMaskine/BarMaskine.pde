PImage Forside;
PImage Vælgdrink;
PImage information;
PImage LPil, RPil;
float Balls;
int ballsTime  = 0;
Byte state = 0;
int idletime = 0;
Boolean hælder = false;
PImage[] smalldrinks = new PImage[14];
PImage[] bigdrinks = new PImage[14];

//bestemmer hvilken drink vi kigger på
int index = 4;

String a = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet fringilla augue. Donec rutrum bibendum sapien et rhoncus. Quisque vel lorem in massa iaculis rhoncus ac at orci. Phasellus elit augue, mollis et elementum vel, sodales vel magna. Phasellus vehicula porta mi, pellentesque cursus libero pretium eu. Etiam placerat lectus at congue viverra. Aliquam erat volutpat. Suspendisse eget faucibus erat, vel sodales arcu. In sit amet ex ac leo ultrices porttitor. Cras est massa, feugiat ut sagittis et, suscipit sit amet lectus. Vivamus in semper sapien. Curabitur mi nisl, efficitur quis metus non, pharetra facilisis ipsum. Etiam pretium ante in vehicula luctus. Donec vitae tristique odio. Mauris urna felis, vulputate at nibh id, aliquam vulputate massa.";

void setup() {
  size(1366, 768);
  frameRate(60);
  //vi loader vores billeder ved opstart hvilket reducere lag senere hen i programmet.
  Forside = loadImage("Forside.png");
  Vælgdrink = loadImage("Vælg drink.png");
  information = loadImage("Mere information.png");
  RPil = loadImage("RightArrow.png");
  LPil = loadImage("LeftArrow.png");
  Balls=(width-97)/(frameRate*60);


  //vi loader drink billederne og skalere dem til de to nødvendige størrelser for vores program
  for (int d=0; d<bigdrinks.length; d++) {
    bigdrinks[d] = loadImage("data/"+"drink"+d+".png");
    bigdrinks[d].resize(359, 541);
    smalldrinks[d] = loadImage("data/"+"drink"+d+".png");
    smalldrinks[d].resize(40, 40);
  }
  //indlæser drinknavne
  load();
}
void draw() {
  background(0);

  //vi timer vores animationer relativ til frames, her animere vi de scrollende kugler på forsiden
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

  //state management. tegner kun den side til canvas hvis den er i rigtige state
  if (state == 0) {
    forside();
  } else if (state == 1) {
    vælgdrink();
  } else if (state == 2) {
    mereinfo();
  }
}

void mousePressed() {
  //når man interragere med skærmen i hvilkensomhelst kapacitet genstarter vi vores timeout timer.
  idletime = 0;
  //return bryder ud af en funktion, hvilket er tilpassende når drinken hælder og vi ikke bruger en hælde-skærm
  if (hælder) {
    return;
  }
  if (state==0) { //forsiden
    
    if (mouseX>564&&mouseX<564+249&&mouseY>575&&mouseY<575+78) {
      state = 1;
    }
  } else if (state==1) { //vælg drink
    
    if (index!=11&&mouseX>width-489&&mouseY>171&&mouseY<171+416&&mousePressed) {
      //scroll til højre
      index+=1;
      println(index);
    } else if (index!=-2&&mouseX<489&&mouseY>171&&mouseY<171+416&&mousePressed) {
      //scroll til venstre
      index-=1;
      println(index);
    } else if (mouseX>417&&mouseX<417+228&&mouseY>625&&mouseY<625+96) {
      //tilbage til forside
      state = 0;
    } else if (mouseX>708&&mouseX<708+228&&mouseY>625&&mouseY<625+96) {
      //frem til mere information
      state = 2;
    }
  } else {
    //mere information
    if (mouseX>884&&mouseX<884+140&&mouseY>599&&mouseY<599+77) {
      //tilbage til drinks
      state = 1;
    } else if (mouseX>1050&&mouseX<1050+140&&mouseY>599&&mouseY<599+77&&!hælder) {
      //hæld drink
      hælder = true;
      println("Hæld!");
      delay(3000);
      println("Færdig!");
      hælder = false;
    }
  }
}
