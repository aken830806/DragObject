float rectX;
float rectY;
float rectW;
float rectH;
PFont font;
float xOffset = 0.0; 
float yOffset = 0.0;
boolean touched = false;

void setup(){
  size(600,600);
  font = createFont("Arial",1);
}
void draw(){
  noStroke();
  fill(235, 240, 242);
  rect(0, 0, width, height);
  
  fill(0);
  textFont(font,20);
  text("x:"+int(rectX),30,30);
  text("y:"+int(rectY),30,70);
  text("w:"+int(rectW),30,110);
  text("h:"+int(rectH),30,150);
  
  fill(0,0,255);
  rect(rectX,rectY,rectW,rectH);
}
void mousePressed(){
  touched = isTouch();
  if(touched){
    xOffset = mouseX-rectX; 
    yOffset = mouseY-rectY;
  }else{
    rectW = 0;
    rectH = 0;
    rectX = mouseX;
    rectY = mouseY;
  }
}
void mouseDragged(){
  if(touched){
    rectX = mouseX - xOffset;
    rectY = mouseY - yOffset;
  }else{
    rectW = mouseX - rectX;
    rectH = mouseY - rectY;
  }
}
void mouseReleased(){
}
boolean isTouch(){
  if(rectW > 0 & rectH > 0){
    if(mouseX > rectX & mouseX < rectX+rectW &
      mouseY > rectY & mouseY < rectY+rectH)
      return true;
  }else if(rectW < 0 & rectH > 0){
    if(mouseX < rectX & mouseX > rectX+rectW &
      mouseY > rectY & mouseY < rectY+rectH)
      return true;
  }if(rectW > 0 & rectH < 0){
    if(mouseX > rectX & mouseX < rectX+rectW &
      mouseY < rectY & mouseY > rectY+rectH)
      return true;
  }if(rectW < 0 & rectH < 0){
    if(mouseX < rectX & mouseX > rectX+rectW &
      mouseY < rectY & mouseY > rectY+rectH)
      return true;
  }
  return false;
}
