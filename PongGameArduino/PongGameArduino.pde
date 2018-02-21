import processing.serial.*;
Serial myPort;


void setup()
{
  size(800,500);
println("Available serial ports:");
  println(Serial.list());
  
  myPort = 
    new Serial(this, Serial.list()[0] , 9600);
   
}
  
// int control1 = 0; 
  int ballX = width/2;
  int ballY = height/2;
  int ballSpeedX = 4;
  int ballSpeedY = 3;
  int paddleMove = height/2;
  int paddleMove1 = height/2;
  int x = 0;  
  int y = 0;

void draw()
{
 if (myPort.available() > 0){
   paddleMove = myPort.read() * height / 300;
   println(paddleMove);
  }
 
 
/*textSize(16);
text("ABCD",5 , 5); */


  
  ballX += ballSpeedX;
 ballY += ballSpeedY;
 
/*
    if (key == 's'){
   paddleMove += 6;}
  if (key == 'w'){
     paddleMove += -6; 
   }
     if (keyCode == DOWN){
   paddleMove1 += 6;}
  if (keyCode == UP){
     paddleMove1 += -6; 
   }
   if (paddleMove < 30){
    paddleMove = -paddleMove + 1; 
   }
 */

  if(ballY < 30 || ballY > height) ballSpeedY = -ballSpeedY;
//  if(ballX > width - 10) ballSpeedX = -ballSpeedX;
  //if( ballY < paddleMove + 75) ballSpeedY = -ballSpeedY;
  if(ballX < 20){
  if(ballY > paddleMove && 
     ballY < paddleMove + 75){
     ballSpeedX = -ballSpeedX;}
  }
   if(ballX > width-25){
  if(ballY > mouseY && 
    ballY < mouseY + 75){
     ballSpeedX = -ballSpeedX;}
  }
  if(ballX < 5){
   y = y + 1;
   delay(500);
   ballX = width/2;
   ballY = height/2;
  paddleMove = height/2 + 50;
  paddleMove1 = height/2 + 50;
  }
   if(ballX > 795){
   x = x + 1;
   delay(500);
   ballX = width/2 - 50 ;
   ballY = height/2 - 50;
  paddleMove = height/2 + 50;
  mouseY = height/2 - 50;
  }

  
 
  background(0,0,0);
  rect(width - width + 10,paddleMove, 12, 75);
  rect(width - 22,mouseY, 12, 75);
  rect(0,35,width,2);
  rect(width/2, 35, 3,50);
  rect(width/2, 115, 3,50);
  rect(width/2, 195, 3,50);
  rect(width/2, 275, 3,50);
  rect(width/2, 355, 3,50);
  rect(width/2, 435, 3,50);
  rect(width/2, 515, 3,50);
  
  ellipse(ballX,ballY,15,15);
textSize(32);
textAlign(CENTER);
text("Score: " + x, 80, 30);
text("Score: " + y, width - 150, 30);
//text(x,140,30);
//text(y,715,30);

if(x == 10){ textAlign(CENTER);
textSize(70);
text(" Left Player Wins! " + x, width/2, height /2);}
if(y == 10){ textAlign(CENTER);
textSize(70);
text(" Right Player Wins! " + x, width/2, height /2);
}

}