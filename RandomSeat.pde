import processing.javafx.*;
import processing.pdf.*;
import java.util.Random;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.*; 
Set<Integer> Ts = new TreeSet<Integer>();
Set<Integer> Called = new TreeSet<Integer>();
PImage img;
Vector<Integer> vec = new Vector<Integer>();
int rectX, rectY,circleX, circleY,circle2X, circle2Y,circle1X, circle1Y;
int rectSizeX =600, rectSizeY=230,circleSize = 93, circle1Size = 93;   // Diameter of circ
color rectColor, circleColor, baseColor,circle1Color,circle2Color,rectHighlight, circleHighlight,circle1Highlight, circle2Highlight,currentColor;
boolean rectOver = false,circleOver = false,circle1Over = false,circle2Over = false,tt=false;
int XX=-1,YY=-1,posX=2000,posY=2000,x=month()+1,y=2,in=0,c1=0,c2=0,c0=0;
String s ="",str="";
int[] arr = new int[30];
int[][] SEAT=new int[6][5];
boolean[][] SEAT_Color=new boolean[6][5];
void setup() {
  size(1500,900);
  background(255,255,255);
  button();
  img = loadImage("Img"+(int)random(1,16)+".jpg");
  addSeq();
  load();
}

void draw() 
{
  seat();
  drawbutton();
  draw_text();
  candraw();
  if(DD==true )DrawCirc();
}
void button()
{
  rectColor = color(#5E6AF5);
  rectHighlight = color(#767EF5);
  circleColor = color(#E61D1D);
  circleHighlight = color(#F30056);
  circle1Color = color(#FAEB40);
  circle1Highlight = color(#FAD040);
  circle2Color = color(#3AF29F);
  circle2Highlight = color(#3ADEA2);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = 1000;
  circleY =circle1Y = circle2Y =100;
  circle1X =1200;
  circle2X = 1400;
  rectX = 900;
  rectY =670;
  ellipseMode(CENTER);
}
void draw_text()
{
  textSize(70);
  fill(255);
  text(s,915, 813);  // Text wraps within text box
}

void drawbutton() {
  update(mouseX, mouseY);
  image(img, 900, 0);
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  
  }
  stroke(255);
  rect(rectX, rectY, rectSizeX, rectSizeY);
  
  if (circleOver) {
    fill(circleHighlight);
    
  } else {
    fill(circleColor);  
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
  
  if (circle1Over) {
    fill(circle1Highlight);
  } else {
    fill(circle1Color);
  }
  stroke(0);
  ellipse(circle1X, circle1Y, circle1Size, circle1Size);
  if (circle2Over) {
    fill(circle2Highlight);
    
  } else {
    fill(circle2Color);  
  }
  stroke(0);
  ellipse(circle2X, circle2Y, circleSize, circleSize);
}
void seat()
{
  fill(0);
  rect(300,10,300,80);
  for(int i=0;i<6;i++)
    for(int j=1;j<6;j++)
    {
      fill(255);
      square(i*150,j*150,150);
    }
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = circle1Over = circle2Over = tt=false;
  } else if ( overRect(rectX, rectY, rectSizeX, rectSizeY) ) {
    rectOver = true;
    circleOver = circle1Over = circle2Over = tt=false;
  } else if ( overCircle(circle1X, circle1Y, circle1Size) ) {
    circleOver = circle2Over = tt= rectOver= false;
    circle1Over = true;
   }
    else if(overSeat(0,150,900,750))
    {
      circleOver= circle1Over=rectOver = circle2Over = false;
      tt=true;
    }
    else if ( overCircle(circle2X, circle2Y, circle1Size) ) {
    circle1Over = circleOver =tt=rectOver= false;
    circle2Over = true;}
  else {
     circle2Over=circleOver =circle1Over= rectOver = tt=false;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
    fill(255,255,255);
     stroke(255,255,255);
    //rect(905,150,600,200);
    c0=(c0+1)%3;
    c1=c2=0;
  }
  else if (circle2Over) {
    currentColor = circle2Color;
    fill(255,255,255);
     stroke(255,255,255);
    //rect(905,150,600,200);
    c2=(c2+1)%3;
    c0=c1=0;
  }
  else if (circle1Over) {
    currentColor = circle1Color;
    fill(255,255,255);
     stroke(255,255,255);
 //rect(905,150,600,200);
    c1=(c1+1)%3;
    c0=0;
    c2=0;
  }
  else if (rectOver) {
    currentColor = rectColor;
       fill(255,255,255);
      stroke(255,255,255);
 //rect(905,150,600,200);

    if(c0==1) export();
    else if(c0==2)load();
    else if(c1==1)
    {
      if(Ts.size()==30) Clear();
      random1();}
    else if(c1==2)
    {
      if(Ts.size()==30) Clear();
      random2();}
    else if(c2==1||(overCircle(1200,450,400)&&DD==true)){DD=true;straw();}
    else if(c2==2)Clear();
  }
  else if(tt) in=1;
  
   if(c0==1) s="Export to CSV";
    else if(c0==2)s="Import CSV";
    else if(c1==1)s="Random Time Seed";
    else if(c1==2)s="Old Fashioned Way";
    else if(c2==1)s="Draw Straws";
    else if(c2==2)s="Clear Output";
    else s="";
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
boolean DD=false;
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void Clear()
{
   for(int i=0;i<6;i++)
   {
     for(int j=0;j<5;j++)
     {
        SEAT_Color[i][j]=false;
        SEAT[i][j]=0; } }
   vec.clear();
   Ts.clear();
}
