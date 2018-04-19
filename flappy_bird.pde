void setup() {
  size(500, 500);
}

float Yv = 0;
float y = 250;
float x = 30;
float w = 50;
float h = 25;
float tobstacleX = 500;
float tobstacleHeight = random(50, 300);
float tobstacleWidth = 50;
boolean gameOn = true; 
int points = 0;

void draw() {
  background(135, 247, 255);
  noStroke();
  //bird
  fill(255, 238, 5);
  rect(x, y, w, h);
  fill(255, 150, 5);
  rect(x + w*0.7, y + h*0.4, w*0.5, h*0.3);
  fill(225);
  rect(x + w*0.7, y + h*0.3 - h*0.4, w*0.2, h*0.4);
  fill(0);
  rect(x + w*0.8, y + h*0.1, w*0.1, h*0.2);
  if(gameOn) {
    //bobstacle
    fill(0, 158, 5);
    rect(tobstacleX, tobstacleHeight + 100, tobstacleWidth, 500);
    //tobstacle
    rect(tobstacleX, 0, tobstacleWidth, tobstacleHeight);
    //tobstacle code
    tobstacleX -= 3;
    if(tobstacleX < -tobstacleWidth) {
      tobstacleX = random(500, 600);
      tobstacleHeight = random(50, 300);
      points++;
    }
    //grass
    //grass
    fill(155, 244, 66);
    rect(0, 480, 500, 20);
    //move code
    y += Yv;
    Yv += 0.1;
    //collision code
    if((x + w * 1.25 > tobstacleX &&  x < tobstacleX + tobstacleWidth && !(y > tobstacleHeight && y < tobstacleHeight + 100)) || y > 500) {
      gameOn = false;
      tobstacleX = 500;
      y = 300;
    }
  }
  fill(225);
  textSize(50);
  text(points, 225, 50);
}

void keyPressed() {
  if(keyCode == UP) {
      Yv = -3;
      if(!gameOn) {
        gameOn = true;
        points = 0;
      }
  }
}
