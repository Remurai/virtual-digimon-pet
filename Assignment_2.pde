PImage AgumonL, AgumonR, AgumonLW1, AgumonLW2, AgumonRW1, AgumonRW2, AgumonS1, AgumonS2, AgumonP1, AgumonP2, AgumonF1, AgumonF2;
PImage GreymonL, GreymonR, GreymonLW1, GreymonLW2, GreymonRW1, GreymonRW2, GreymonS1, GreymonS2, GreymonP1, GreymonP2, GreymonF1, GreymonF2;
PImage Background, Food, Happy, Good, Sad;

//Declare classes for the virtual pet
Pet p = new Pet();
Actions a = new Actions();

void setup(){
  size(1280,720);
  smooth();
  AgumonL = loadImage("Agumon(LInteract).png");
  AgumonR = loadImage("Agumon(RInteract).png");
  AgumonLW1 = loadImage("Agumon(walk1).png");
  AgumonLW2 = loadImage("Agumon(walk2).png");
  AgumonRW1 = loadImage("Agumon(Rwalk1).png");
  AgumonRW2 = loadImage("Agumon(Rwalk2).png");
  AgumonS1 = loadImage("Agumon(sleep1).png");
  AgumonS2 = loadImage("Agumon(sleep2).png");
  AgumonP1 = loadImage("Agumon(play1).png");
  AgumonP2 = loadImage("Agumon(play2).png");
  AgumonF1 = loadImage("Agumon(eat1).png");
  AgumonF2 = loadImage("Agumon(eat2).png");
  GreymonL = loadImage("Greymon(LInteract).png");
  GreymonR = loadImage("Greymon(RInteract).png");
  GreymonLW1 = loadImage("Greymon(walk1).png");
  GreymonLW2 = loadImage("Greymon(walk2).png");
  GreymonRW1 = loadImage("Greymon(Rwalk1).png");
  GreymonRW2 = loadImage("Greymon(Rwalk2).png");
  GreymonS1 = loadImage("Greymon(sleep1).png");
  GreymonS2 = loadImage("Greymon(sleep2).png");
  GreymonP1 = loadImage("Greymon(play1).png");
  GreymonP2 = loadImage("Greymon(play2).png");
  GreymonF1 = loadImage("Greymon(eat1).png");
  GreymonF2 = loadImage("Greymon(eat2).png");
  Background = loadImage("Background.jpg");
  Food = loadImage("Food.png");
  Happy = loadImage("Happy.png");
  Good = loadImage("Good.png");
  Sad = loadImage("Sad.png");
  }

void draw(){
  //Set a background for the pet
  background(Background);
  
  //Display the pet and its action
  p.show();
  a.show();
}

void mousePressed(){
  //If the user pressed the pet, it shows the action buttons for the user to perform
  if (p.stop == false && mouseX>=p.xpos-100 && mouseX<=p.xpos+100 && mouseY>=400 && mouseY<=600){
    p.stop = true;
    a.btnVisible = true;
  }
  
  //If the user pressed the feed button, it will reset the hunger stat
  else if (a.btnVisible == true  && mouseX>=p.xpos-170 && mouseX<=p.xpos-70 && mouseY>=325 && mouseY<=375 && a.slpAnimate == false && a.playAnimate == false){
    a.feedAnimate=true;    
  }
  
  //If the user pressed the play button, it will reset the happiness stat
  else if (a.btnVisible == true  && mouseX>=p.xpos-50 && mouseX<=p.xpos+50 && mouseY>=325 && mouseY<=375 && a.slpAnimate == false && a.feedAnimate == false){
    a.playAnimate=true;    
  }
  
  //If the user pressed the sleep button, it will reset the sleep stat
  else if (a.btnVisible == true  && mouseX>=p.xpos+70 && mouseX<=p.xpos+170 && mouseY>=325 && mouseY<=375 && a.feedAnimate == false  && a.playAnimate == false){
    a.slpAnimate=true;    
  }
  
  //If the user pressed the grow button, it will grow to adult
  else if (a.btnVisible == true  && mouseX>=p.xpos-100 && mouseX<=p.xpos+100 && mouseY>=255 && mouseY<=305 && a.growVisible == true){
    a.growVisible = false;
    p.exp+=1;
    p.grow = true;
    a.btnVisible = false;
    p.stop = false;
  }
  
  //If the user pressed outside the pet, it will not show the action buttons
  else if (!(mouseX>=p.xpos-100 && mouseX<=p.xpos+100 && mouseY>=400 && mouseY<=600) && a.slpAnimate == false && a.feedAnimate == false  && a.playAnimate == false){ 
    p.stop = false;
    a.btnVisible = false;
  }
}
