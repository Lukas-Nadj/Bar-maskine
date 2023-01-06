PImage Forside;
PImage Vaelgdrink;
PImage information;
PImage LPil, RPil;
float Balls;
int ballsTime  = 0;
Byte state = 0;
int idletime = 0;
Boolean haelder = false;
PImage[] smalldrinks = new PImage[14];
PImage[] bigdrinks = new PImage[14];
int[][] drinks = new int[14][9];

//bestemmer hvilken drink vi kigger påre
int index = 4;

String a = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet fringilla augue. Donec rutrum bibendum sapien et rhoncus. Quisque vel lorem in massa iaculis rhoncus ac at orci. Phasellus elit augue, mollis et elementum vel, sodales vel magna. Phasellus vehicula porta mi, pellentesque cursus libero pretium eu. Etiam placerat lectus at congue viverra. Aliquam erat volutpat. Suspendisse eget faucibus erat, vel sodales arcu. In sit amet ex ac leo ultrices porttitor. Cras est massa, feugiat ut sagittis et, suscipit sit amet lectus. Vivamus in semper sapien. Curabitur mi nisl, efficitur quis metus non, pharetra facilisis ipsum. Etiam pretium ante in vehicula luctus. Donec vitae tristique odio. Mauris urna felis, vulputate at nibh id, aliquam vulputate massa.";

void setup() {
  //size(1366, 768);
  fullScreen();
  frameRate(60);
  //vi loader vores billeder ved opstart hvilket reducere lag senere hen i programmet.
  Forside = loadImage("Forside.png");
  Vaelgdrink = loadImage("Vaelg drink.png");
  information = loadImage("Mere information.png");
  RPil = loadImage("RightArrow.png");
  LPil = loadImage("LeftArrow.png");
  Balls=(width-97)/(frameRate*60);
  Forside.resize(width, height);
  Vaelgdrink.resize(width, height);
  information.resize(width, height);

  //vi loader drink billederne og skalere dem til de to nødvendige størrelser for vores program
  for (int d=0; d<bigdrinks.length; d++) {
    bigdrinks[d] = loadImage("data/"+"drink"+d+".png");
    bigdrinks[d].resize(int(359*1.25), int(541*1.25));
    smalldrinks[d] = loadImage("data/"+"drink"+d+".png");
    smalldrinks[d].resize(40, 40);
  }
  //indlaeser drinknavne
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
    vaelgdrink();
  } else if (state == 2) {
    mereinfo();
  }
}

void mousePressed() {
  println(mouseX, mouseY);
  //når man interragere med skaermen i hvilkensomhelst kapacitet genstarter vi vores timeout timer.
  idletime = 0;
  //return bryder ud af en funktion, hvilket er tilpassende når drinken haelder og vi ikke bruger en haelde-skaerm
  if (haelder) {
    return;
  }
  if (state==0) { //forsiden
    
    if (mouseX>635&&mouseX<903&&mouseY>862&&mouseY<978) {
      state = 1;
    }
  } else if (state==1) { //vaelg drink
    
    if (index!=11&&mouseX>width-489&&mousePressed) {
      //scroll til højre
      
      index+=1;
      
      println(index);
    } else if (index!=-2&&mouseX<489&&mousePressed) {
      //scroll til venstre
      
      index-=1;
      
      println(index);
    } else if (mouseX>467&&mouseX<728&&mouseY>936&&mouseY<1083) {
      //tilbage til forside
      state = 0;
    } else if (mouseX>794&&mouseX<1055&&mouseY>938&&mouseY<1085) {
      //frem til mere information
      state = 2;
    }
  } else {
    //mere information
    if (mouseX>993&&mouseX<1151&&mouseY>899&&mouseY<1011) {
      //tilbage til drinks
      state = 1;
    } else if (mouseX>1181&&mouseX<1352&&mouseY>900&&mouseY<1014&&!haelder) {
      //haeld drink
      haelder = true;
      println("vi haelder bitch: "+((int)index+(int)2));
      printArray(drinks[index+2]);
      loadStrings("http://10.113.9.124/STRING?M0="+str(drinks[index+2][0])+"&M1="+str(drinks[index+2][1])+"&M2="+str(drinks[index+2][2])+"&M3="+str(drinks[index+2][3])+"&M4="+str(drinks[index+2][4])+"&M5="+str(drinks[index+2][5])+"&M6="+str(drinks[index+2][6])+"&M7="+str(drinks[index+2][7])+"&M8="+str(drinks[index+2][8]));
      haelder = false;
    }
  }
}
