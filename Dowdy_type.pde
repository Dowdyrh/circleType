import geomerative.*;
boolean recording = false;
RFont font;
String MyText = "R D";
RPoint[] pnts;

//----------------SETUP---------------------------------
void setup() {
  frameRate(20);
  
  size(1500, 800);
  
  
  RG.init(this); 
  font = new RFont("FreeSans.ttf", 500, CENTER);

  //CONFIGURE SEGMENT LENGTH AND MODE
  //SETS THE SEGMENT LENGTH BETWEEN TWO POINTS ON A SHAPE/FONT OUTLINE
  RCommand.setSegmentLength(13);//ASSIGN A VALUE OF 10, SO EVERY 10 PIXELS
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
  if (MyText.length() > 0) {
    
    RGroup grp;
    
    grp = font.toGroup(MyText);
    
    pnts = grp.getPoints();
  }
}

//----------------DRAW---------------------------------

void draw() {
  background(255);
  
  translate(670, 500);
  
  for (int i=0; i<pnts.length; i++) {
    noFill();
    stroke(0);
    strokeWeight(1);
    ellipse(pnts[i].x + random(mouseY/10),
    pnts[i].y + random(mouseY/10),
    12 + mouseX/9, 12 + mouseX/9);
  }
  
  if (recording) {
    saveFrame("output/frames####.png");
  }
  
  textAlign(CENTER);
  fill(255);
  if (!recording) {
    text("Press r to start recording.", width/2, height-24);
  } else {
    text("Press r to stop recording.", width/2, height-24);
  }
  
  stroke(255);
  if (recording) {
    fill(255,0,0);
  } else {
    noFill();
  }
  ellipse(width/2, height-48, 16, 16);
}
  
  void keyPressed() {
    if (key == 'r' || key == 'R') {
      recording = !recording;
    }
  }