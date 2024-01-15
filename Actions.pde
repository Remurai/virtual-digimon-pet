class Actions{
  boolean btnVisible = false;
  boolean growVisible = false;
  boolean feedAnimate = false;
  boolean playAnimate = false;
  boolean slpAnimate = false;
  int feedTimer=0;
  int playTimer=0;
  int slpTimer=0;
  
  //Display all the buttons and animation when the user interacts with the pet
  void show(){
    if (btnVisible == true){
      feedBtn();
      playBtn();
      sleepBtn();
      growBtn();
      feed();
      play();
      sleep();
    }
  }
  
  //Makes a feed button for the user
  void feedBtn(){
    //button
    fill(0);
    rectMode(CENTER);
    rect(p.xpos-120,350,100,50);
    
    //text
    fill(255);
    textSize(30);
    textAlign(CENTER,CENTER);
    text("Feed",p.xpos-120,350);
  }
  
  //Makes a play button for the user
  void playBtn(){
    //button
    fill(0);
    rectMode(CENTER);
    rect(p.xpos,350,100,50);
    
    //text
    fill(255);
    textSize(30);
    textAlign(CENTER,CENTER);
    text("Play",p.xpos,350);
  }
  
  //Makes a sleep button for the user
  void sleepBtn(){
    //button
    fill(0);
    rectMode(CENTER);
    rect(p.xpos+120,350,100,50);
    
    //text
    fill(255);
    textSize(30);
    textAlign(CENTER,CENTER);
    text("Sleep",p.xpos+120,350);
  }
  
  //Makes a grow button for the user
  void growBtn(){
    if (growVisible == true){
      //button
      fill(0);
      rectMode(CENTER);
      rect(p.xpos,280,200,50);
      
      //text
      fill(255);
      textSize(30);
      textAlign(CENTER,CENTER);
      text("Grow",p.xpos,280);
    }
  }
  
  //Makes the pet to eat
  void feed(){
    if (feedAnimate == true){
      feedTimer+=1;
      if (feedTimer <= 50){
        if (p.grow == true){
          imageMode(CENTER);
          image(GreymonF1,p.xpos,500,200,200);
          image(Food,p.xpos+110,500,80,80);
        }
        else{
          imageMode(CENTER);
          image(AgumonF1,p.xpos,500,200,200);
          image(Food,p.xpos+90,500,80,80);
        }
      }
      
      else if (feedTimer>50  && feedTimer<=100){
        if (p.grow == true){
          imageMode(CENTER);
          image(GreymonF2,p.xpos,500,200,200);
        }
        else{
          imageMode(CENTER);
          image(AgumonF2,p.xpos,500,200,200);
        }
      }
      
      else{ 
        p.hgy = 300;
        feedTimer=0;
        feedAnimate = false;
        if (p.exp != 301) p.exp+=30;
      }
    }
  }
  
  //Makes the pet to play
  void play(){
    if (playAnimate == true){
      playTimer+=1;
      if (playTimer<=50){
        if (p.grow == true){
          imageMode(CENTER);
          image(GreymonP1,p.xpos,500,200,200);
        }
        else{
          imageMode(CENTER);
          image(AgumonP1,p.xpos,500,200,200);
        }
      }
      
      else if (playTimer>50  && playTimer<=100){
        if (p.grow == true){
          imageMode(CENTER);
          image(GreymonP2,p.xpos,500,200,200);
        }
        else{
          imageMode(CENTER);
          image(AgumonP2,p.xpos,500,200,200);
        }
      }
      
      else{ 
        p.hpy = 300;
        playTimer=0;
        playAnimate = false;
        if (p.exp != 301) p.exp+=30;
      }
    }
  }
  
  //Makes the pet to sleep
  void sleep(){
    if (slpAnimate == true){
      slpTimer+=1;
      if (slpTimer<=50){
        if (p.grow == true){
          imageMode(CENTER);
          image(GreymonS1,p.xpos,500,200,200);
        }
        else{
          imageMode(CENTER);
          image(AgumonS1,p.xpos,500,200,200);
        }
      }
      
      else if (slpTimer>50  && slpTimer<=100){
        if (p.grow == true){
          imageMode(CENTER);
          image(GreymonS2,p.xpos,500,200,200);
        }
        else{
          imageMode(CENTER);
          image(AgumonS2,p.xpos,500,200,200);
        }
      }
      
      else{ 
        p.slp = 300;
        slpTimer=0;
        slpAnimate = false;
        if (p.exp != 301) p.exp+=30;
      }
    }
  }
}
