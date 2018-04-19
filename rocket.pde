void setup() {
  size(500, 500);
}

float Yv = 0;
float Xv = 0;
float y = 250;
float x = 30;
float w = 50;
float h = 25;
float tobstacleX = 500;
float tobstacleHeight = random(50, 300);
float tobstacleWidth = 30;
boolean gameOn = false; 
float fireLength = 30;
float [] [] bullets = {{500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}, {500, 0}};
void draw() {
    noStroke();
    background(225);
     //bullets
     for(int i = 0; i < bullets.length; i++) {
      bullets[i][0] += 10;
      fill(244, 65, 65);
      rect(bullets[i][0], bullets[i][1], 10, 2);
      if(bullets[i][0] + 10 * 1.25 > tobstacleX &&  bullets[i][0] < tobstacleX + tobstacleWidth && !(bullets[i][1] > tobstacleHeight && bullets[i][1] + 2 < tobstacleHeight + 100)) {
        ellipse(bullets[i][0], bullets[i][1], 20, 20);
        bullets[i][0] = 500;
      }
    }
    //fire
    fill(249, 4, 0);
    triangle(x - 5*Xv - 15 - random(0,10), y + h/2, x, y + h/8, x, y + h/8*7);
    fill(249, 166, 0);
    triangle(x - 2.5*Xv - 7 - random(0,5), y + h/2, x, y + h/4, x, y + h/4*3);
    //spaceship
    fill(0);
    rect(x, y, w, h);
    triangle(x + w, y, x + w, y + h, x + w*1.25, y + h/2);
    //spaceship fins
    triangle(x, y, x + w/4, y, x - w/10, y - h/4);
    triangle(x, y + h, x + w/4, y + h, x - w/10, y + h * 1.25);
  if(gameOn) {
    //bobstacle
    fill(0);
    rect(tobstacleX, tobstacleHeight + 100, tobstacleWidth, 500);
    //tobstacle
    rect(tobstacleX, 0, tobstacleWidth, tobstacleHeight);
    //tobstacle code
    tobstacleX -= 3;
    if(tobstacleX < -tobstacleWidth) {
      tobstacleX = random(500, 600);
      tobstacleHeight = random(50, 300);
    }
    //move code
    y += Yv;
    x += Xv;
    if(!keyPressed) {
      Xv = Xv*0.9;
      Yv = Yv*0.9;
    }
    //collision code
    if(x + w * 1.25 > tobstacleX &&  x < tobstacleX + tobstacleWidth && !(y > tobstacleHeight && y + h < tobstacleHeight + 100)) {
      gameOn = false;
    }
  } else {
    x = 30;
    y = 250;
    Xv = 0;
    Yv = 0;
    tobstacleX = 500;
    tobstacleHeight = random(50, 300);
    tobstacleWidth = 30;
  }
}

void keyPressed() {
  gameOn = true;
  if(keyCode == UP) {
    if(Yv > -1.5) {
      Yv = -1;
    }
    Yv += -0.5;
  }
  if(keyCode == DOWN) {
    if(Yv < 1.5) {
      Yv = 1;
    }
    Yv += 0.5;
  }
  if(keyCode == LEFT) {
    if(Xv > -1.5) {
      Xv = -1;
    }
    Xv += -0.5;
  }
  if(keyCode == RIGHT) {
    if(Xv < 1.5) {
      Xv = 1;
    }
    Xv += 0.5;
  }
  if(keyCode == ENTER) {
    int i = 0;
  while(bullets[i][0] <= 500) {
      i++;
    }
    bullets[i][0] = x;
    bullets[i][1] = y + h/2;
  }
}
