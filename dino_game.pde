void setup() {
  size(500, 300);
}

//Game
boolean gameOn = false;
//dino
float x = 50;
float y = 0;
float Yv = 0;
//cactus 1
float cactusX = 500;
float cactusHeight = 45;
float cactusWidth = 20;
//cactus 2
float cactus2X = 700;
float cactus2Height = 45;
float cactus2Width = 20;
//points
int points = 0;
//legup
String legup = "left";
int leguptime = 5;
//speed
float speed = 3;
//nightmode
color sky = 225;
color ground = 100;

void draw() {
  background(sky);
  fill(ground);
  stroke(ground);
  line(500, 260, 0, 260);
  noStroke();
  //left leg
  if(legup == "left") {
    rect(x, 230 - y, 5, 25);
  } else {
    rect(x, 230 - y, 5, 30);
  }
  //right leg
  if(legup == "right") {
    rect(x + 10, 230 - y, 5, 25);
  } else {
    rect(x + 10, 230 - y, 5, 30);
  }
  //body
  rect(x, 220 - y, 15, 30);
  //tail
  rect(x - 5, 240 - y, 5, 10);
  rect(x - 15, 245 - y, 15, 5);
  //head
  rect(x  + 5, 205 - y, 25, 15);
  //arm
  rect(x + 15, 230 - y, 6, 3);
  //hand
  rect(x + 18, 233 - y, 3, 3);
  //jaw
  rect(x + 15, 222 - y, 7, 2);
  //cheek
  rect(x + 15, 220 - y, 1, 2);
  //eye
  fill(sky);
  rect(x + 12, 210 - y, 2, 2);
  //cactus
  fill(ground);
  rect(cactusX, 260 - cactusHeight, cactusWidth, cactusHeight); //cactus 1
  rect(cactus2X, 260 - cactus2Height, cactus2Width, cactus2Height); //cactus 2
  //cactusX code
  if(gameOn) {
    cactusX -= speed;
    cactus2X -= speed;
    if(cactusX < -cactusWidth) {
      cactusX = random(500, 800);
    }
    if(cactus2X < -cactus2Width) {
      cactus2X = random(1000, 1500);
    }
    if(abs(cactus2X-cactusX) < 200) {
      while(abs(cactus2X-cactusX) < 200) {
        cactus2X += 100;
      }
    }
  } else{
    cactusX = 500;
    cactus2X = 700;
  }
  //Points
  fill(ground);
  textSize(15);
  text(points, 10, 20);
  //points code
  if(gameOn) {
    points++;
    speed = points/1000 + 3;
  } else {
    points = 0;
  }
  if(points > 10000) {
    textSize(50);
    text("YOU WIN!!!!!!!!", 100, 150);
  }
  //Yv code
  y += Yv;
  if(y == 0) {
    Yv = 0;
  } else {
    Yv -= 0.5;
  }
  //cactus collision code
  if((cactusX < x + 30 && y < cactusHeight && x - 15 < cactusX + cactusWidth) || (cactus2X < x + 30 && y < cactus2Height && x - 15 < cactus2X + cactus2Width)) {
    gameOn = false;
    y = 0;
    Yv = 0;
  }
  //Dino Game Title
  if(!gameOn) {
    fill(ground);
    textSize(50);
    text("DINO GAME", 100, 150);
    textSize(20);
    text("by Prealge", 180, 170);
  }
  //moving legs
  if(gameOn && y == 0) {
    if(leguptime == 0) {
      if(legup == "left") {
        legup = "right";
      } else {
        legup = "left";
      }
      leguptime = 5;
    } else {
      leguptime--;
    }
  } else {
    legup = "";
  }
  //nightmode
  if((points/1000)%1==0 && (points/1000)%2 != 0) {
    ground = 225;
    sky = 100;
  }
  if((points/1000)%2 == 0){
    ground = 100;
    sky = 225;
  }
}

void keyPressed() {
  if(keyCode == UP || keyCode == ENTER) {
    gameOn = true;
    if(y == 0) {
      Yv = 12;
    }
  }
}
