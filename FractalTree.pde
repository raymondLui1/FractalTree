private double fractionLength = .8; 
private int smallestBranch = 15; 
private double branchAngle = 0.5;  

public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(0,255,0);   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2, 255);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle, int colorWeight) 
{   
  //your code here    
  double angle1 = angle+branchAngle+Math.random()*0.2;
  double angle2 = angle-branchAngle-Math.random()*0.2;
  double angle3 = angle+Math.random()*0.2-0.1;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  int endX3 = (int)(branchLength*Math.cos(angle3) + x);
  int endY3 = (int)(branchLength*Math.sin(angle3) + y);
  stroke(colorWeight, 0, 0);
  line(x, y, endX1, endY1);
  stroke(0, 0, colorWeight);
  line(x, y, endX2, endY2);
  stroke(0, colorWeight, 0);
  line(x, y, endX3, endY3);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1, colorWeight-25);
    drawBranches(endX2, endY2, branchLength, angle2, colorWeight-25);
    drawBranches(endX3, endY3, branchLength, angle3, colorWeight-25);
  }
} 
