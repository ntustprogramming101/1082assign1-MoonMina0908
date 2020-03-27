float lifeGap =20;
float lawnHeight=15;
float groundhogHeight=80;
final float square =80;

float laserWidth=10;
float laserRange = square*2+25;

float laserX;
float laserY;
float laserWSpeed = 2;
float laserW = 0;
float laserMaxW = 40;
float laserOne = 0;
float laserTwo = 0;
float laserSpeedOne=2;
float laserSpeedTwo=2;

float soldierX, soldierY;
float soldierSpeed;

float robotX, robotY;

PImage bgImg;
PImage groundhogImg;
PImage lifeImg;
PImage robotImg;
PImage soilImg;
PImage soldierImg;

void setup() {
	size(640, 480, P2D);
	// Enter Your Setup Code Here

  //img load
  bgImg =loadImage("img/bg.jpg");
  groundhogImg =loadImage("img/groundhog.png");
  lifeImg =loadImage("img/life.png");
  robotImg =loadImage("img/robot.png");
  soilImg =loadImage("img/soil.png");
  soldierImg =loadImage("img/soldier.png");
  
  //soldier starting position
  soldierX=-square;
  soldierY=square*2+floor(random(4))*square;
  
  //robot starting position
  robotX=square*2+floor(random(6))*square;
  robotY=square*2+floor(random(3))*square;
  
  //laser start
  laserX= robotX+25;
  laserY= robotY+37;
  
}

void draw() {
	// Enter Your Code Here

  //bg
  image(bgImg,0,0);
  
  //lawn
  noStroke();
  fill(124,204,25);
  rect(0,square*2-15,640,square*2);
  
  //sun
  noStroke();
  fill(255,255,0);
  ellipse(width-50,height-430,125,125);
  fill(253,184,19);
  ellipse(width-50,height-430,115,115);
  
  //life
  image(lifeImg,10,10);
  image(lifeImg,10+70,10);
  image(lifeImg,10+70*2,10);
  
  //groundhog
  imageMode(CENTER);
  image(groundhogImg,width/2,square+groundhogHeight/2);
  
  //soil
  imageMode(CORNER);
  image(soilImg,0,square*2);
  
  //soldier
  image(soldierImg,-square+soldierX,soldierY);
  soldierX +=5;
  soldierX %=720;
  
  //laser
  strokeWeight(laserWidth);
  stroke(255,0,0);
  
  //laser move
  line(laserX-laserOne,laserY,laserX-laserTwo+laserW,laserY);
  laserW += laserWSpeed;
  laserOne += laserSpeedOne;
  laserTwo += laserSpeedTwo;
  
  if(laserW >= laserMaxW){
    laserWSpeed = 0;
  }else{laserWSpeed = 2;}
  
  if(laserX-laserOne < laserX - laserRange ){
    laserW = 0;
  }
  if(laserW == 0){
    laserOne = 0;
    laserTwo= 0;
  }
  
  //robot
  image(robotImg,robotX,robotY);
}
