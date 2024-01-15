class Pet{
  int xpos = 640;
  int xspeed = 1;
  int exp = 0;
  float hgy = 300;
  float hpy = 300;
  float slp = 300;
  float statspeed = 0.1;
  boolean stop = false;
  boolean grow = false;
  
  //Display pet
  void show(){
    move();
    stats();
    showExp();
    behaviour();
  }
  
  //Let the pet moves freely
  void move(){  
    //Stop the pet when the user interacts
    if (stop == false){
      xpos+=xspeed;
      
      //If the  moving direction is left side
      if (xspeed == 1){
        if (xpos%12 <= 5){
          if (grow == true){
            imageMode(CENTER);
            image(GreymonLW1,xpos,500,200,200);
          }
          else{
            imageMode(CENTER);
            image(AgumonLW1,xpos,500,200,200);
          }
        }
        else {
          if (grow == true){
            imageMode(CENTER);
            image(GreymonLW2,xpos,500,200,200);
          }
          else{
            imageMode(CENTER);
            image(AgumonLW2,xpos,500,200,200);
          }
        }
      }
      //If the moving direction is right side
      else if (xspeed == -1){
        if (xpos%10 <= 5){
          if (grow == true){
            imageMode(CENTER);
            image(GreymonRW1,xpos,500,200,200);
          }
          else{
            imageMode(CENTER);
            image(AgumonRW1,xpos,500,200,200);
          }
        }
        else {
          if (grow == true){
            imageMode(CENTER);
            image(GreymonRW2,xpos,500,200,200);
          }
          else{
            imageMode(CENTER);
            image(AgumonRW2,xpos,500,200,200);
          }
        }
      }
    }
      
      //Change moving direction
      if (xpos >= 1000 || xpos<=280){
        xspeed =- xspeed;
      }
    }
  
  //Changes its behaviour depending on its stats
  void behaviour(){
    //When the user interacts with the pet
    if (stop == true && a.slpAnimate == false && a.playAnimate == false && a.feedAnimate == false){
      //If the moving direction is left side
      if (xspeed == 1){
        if (grow == true){
          imageMode(CENTER);
          image(GreymonL,xpos,500,200,200);
        }
        else{
          imageMode(CENTER);
          image(AgumonL,xpos,500,200,200);
        }
      }
      //If the moving direction is right side
      else {
        if (grow == true){
          imageMode(CENTER);
          image(GreymonR,xpos,500,200,200);
        }
        else{
          imageMode(CENTER);
          image(AgumonR,xpos,500,200,200);
        }
      }
    }
    
    //Change emotion depending on the stats
    if (hgy<=100 || hpy<=100 || slp<=100){
      imageMode(CENTER);
      image(Sad,xpos-110,450,60,60);
    }
    
    else if (hgy<=200 || hpy<=200 || slp<=200){
      imageMode(CENTER);
      image(Good,xpos-110,450,60,60);
    }
    
    else if (hgy<=300 || hpy<=300 || slp<=300){
      imageMode(CENTER);
      image(Happy,xpos-110,450,60,60);
    }
  }
  
  //Display the pet's stats
  void stats(){
    fill(255);
    rectMode(CENTER);
    rect(1050,85,450,160);
    fill(0);
    textSize(30);
    textAlign(CENTER,CENTER);
    text("Stats",1050,20);
    rectMode(CORNER);
    
    //Hungry
    fill(0);
    textSize(20);
    textAlign(CENTER,CENTER);
    text("Hunger",910,55);
    
    //Change color when stat decreases
    if (hgy<=100) fill(255,0,0);
    else if (hgy<=200) fill(255,255,0);
    else if (hgy<=300) fill(0,255,0);
    rect(950,50,hgy,20);
    
    //Happiness
    fill(0);
    textSize(20);
    textAlign(CENTER,CENTER);
    text("Happiness",895,85);
    
    //Change color when stat decreases
    if (hpy<=100) fill(255,0,0);
    else if (hpy<=200) fill(255,255,0);
    else if (hpy<=300) fill(0,255,0);
    rect(950,80,hpy,20);
    
    //Sleep
    fill(0);
    textSize(20);
    textAlign(CENTER,CENTER);
    text("Sleep",920,115);
    
    //Change color when stat decreases
    if (slp<=100) fill(255,0,0);
    else if (slp<=200) fill(255,255,0);
    else if (slp<=300) fill(0,255,0);
    rect(950,110,slp,20);
    
    //Decrease stats over time
    hgy-=statspeed;
    hpy-=statspeed;
    slp-=statspeed;
    
    //Limits the lowest stats
    if (hgy<=10) hgy=10;
    if (hpy<=10) hpy=10;
    if (slp<=10) slp=10;
  }
  
  //Show the experience gains
  void showExp(){
    fill(0);
    textSize(20);
    textAlign(CENTER,CENTER);
    text("Experience",890,145);
    fill(0,255,253);
    rect(950,140,exp,20);
    
    //If the pet's experience reachs to 10, makes it grow.
    if (exp==300){
      a.growVisible=true;
    }
    
    //Limits the experience gain
    else if (exp>=300){
      exp = 301;
    }
  }
}
