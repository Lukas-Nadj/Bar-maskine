PImage Forside;
PImage Vælgdrink;
PImage information;
Byte state = 0;
int idletime = 0;
Boolean hælder = false;
void setup(){
  size(1366, 768);
  frameRate(30);
  Forside = loadImage("Forside.png");
  Vælgdrink = loadImage("Vælg drink.png");
  information = loadImage("Mere information.png");

}

void draw(){
  idletime += 1;
  if(idletime>30*frameRate){
    state = 0;
    idletime = 0;
  }
  println(idletime);
  if (state == 0){
  image(Forside, 0, 0);
  } else if (state == 1){
  image(Vælgdrink, 0, 0);
  } else if (state == 2){
    image(information, 0, 0);
  } else{
    
  }
}

void mousePressed(){
  idletime = 0;
  if(hælder){
    return;
  }
  
  if(state==0&&mouseX>564&&mouseX<564+249&&mouseY>575&&mouseY<575+78){
    state = 1;
  } else if(state==1&&mouseX>417&&mouseX<417+228&&mouseY>625&&mouseY<625+96){
    state = 0;
  } else if(state==1&&mouseX>708&&mouseX<708+228&&mouseY>625&&mouseY<625+96){
    state = 2;
  } else if(state==2&&mouseX>884&&mouseX<884+140&&mouseY>599&&mouseY<599+77){
    state = 1;
  } else if(state==2&&mouseX>1050&&mouseX<1050+140&&mouseY>599&&mouseY<599+77&&!hælder){
    hælder = true;
    println("Hæld!");
    delay(3000);
    println("Færdig!");
    hælder = false;
    
  }
}
