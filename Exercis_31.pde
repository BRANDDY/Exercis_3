float rotSecs = 0;
float rotMins = 0;
float rotHours = 0;

int s = 0;
int m;
int h;
int d;
int mon;
int yr;

int lastSec = 0;
int lastMin = 0;
int lastHour = 0;

int faceSize = 500;
PFont font;

void setup() {
    size(800,600,P2D);
    strokeWeight(2);
    font = loadFont("OCRAExtended-48.vlw");
}

void draw() {
    setTime();
    setFace();
    dayTime();
    rotAngle();
    rotTime();
}

void setTime() {
    s = second();
    m = minute();
    h = hour();
    d = day();
    mon = month();
    yr = year();
}

void setFace() {
    fill(#5A3535);
    stroke(55);
    ellipse(width / 2, height / 2, faceSize, faceSize);
    fill(100);
    ellipse(width / 2, height / 2, faceSize - 15, faceSize - 15);
    
    stroke(0, 127, 255, 44);
    for (int i = 0; i < 12; i++) {
        float rot = ((float) i / 12) * TWO_PI;
        pushMatrix();
        translate(width / 2, height / 2);
        rotate(rot);
        line(0, faceSize / 5, 0, faceSize / 2 - 10);
        popMatrix();
    }
    pushMatrix();
    translate(width / 2,height / 2);
    fill(#5F4949,120);
    square(20, - 80,80);
    square(120, - 80,80);
    popMatrix();
}

void rotAngle() {
    if (s != lastSec) {
        rotSecs = ((float) s / 60) * TWO_PI;
        lastSec = s;
    }
    
    if (m != lastMin) {
        rotMins = ((float) m / 60) * TWO_PI; 
        lastMin = m;
    }
    
    if (h != lastHour) {
        rotHours = ((float) h / 12) * TWO_PI;  
        lastHour = h;
    }
}

void rotTime() {
    roteRule(rotSecs,220);
    roteRule(rotMins,150);
    roteRule(rotHours,80);
    
    pushMatrix();
    translate(width / 2,height / 2);
    PImage round;
    round = loadImage("r.png");
    imageMode(CENTER);
    rotate(cos(radians(map(frameCount, 0, 60, -90, 270))));
    image(round, 0,0,500,500);
    popMatrix();    
}

void roteRule(float t,int l){
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(t);
    fill(55);
    stroke(55);
    line(0, 0, 0, -l);
    ellipse(0, -l, 10,10);
    popMatrix();
}

void dayTime() {
    pushMatrix();
    translate(width / 2,height / 2);
    fill(220);
    textFont(font,70);
    textAlign(CENTER, CENTER);
    text(month(),60, - 40);
    text(day(),160, - 40);
    popMatrix();
}