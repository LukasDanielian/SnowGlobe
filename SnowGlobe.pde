PVector centerPos;
PVector cameraPos;
ArrayList<Snow> snow;
float theta;

void setup()
{
  fullScreen(P3D);
  rectMode(CENTER);
  shapeMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(width * .1);
  perspective(PI/2.75, float(width)/height, .01, width * 10);
  noStroke();

  centerPos = new PVector(0, 0, 0);
  cameraPos = new PVector(sin(frameCount * .01) * width, 0, cos(frameCount * .01) * width);
  snow = new ArrayList<Snow>();
}

void draw()
{
  background(0);
  theta = frameCount * .01;
  cameraPos.x = sin(theta) * width * 2;
  cameraPos.z = cos(theta) * width * 2;
  camera(cameraPos.x, cameraPos.y, cameraPos.z, centerPos.x, centerPos.y, centerPos.z, 0, 1, 0);

  spotLight(255, 255, 255, cameraPos.x, cameraPos.y, cameraPos.z, -sin(theta % TWO_PI) , 0, -cos(theta % TWO_PI), PI/2, 1);

  for (int i = 0; i < 10; i++)
    snow.add(new Snow());

  for (int i = 0; i < snow.size(); i++)
  {
    Snow temp = snow.get(i);
    temp.render();

    if (temp.atBottom())
    {
      snow.remove(i);
      i--;
    }
  }

  renderSnowman();
  renderBase();
}

void renderSnowman()
{
  pushMatrix();
  //Base
  translate(centerPos.x, centerPos.y + width/2 - 400, centerPos.z);
  fill(255);
  sphere(400);

  //Middle
  translate(0, -600, 0);
  sphere(300);
  fill(#311515);
  box(1200, 20, 20);

  //Buttons
  pushMatrix();
  translate(0, 0, 300);
  fill(0);
  sphere(20);
  translate(0, 100, 0);
  sphere(20);
  translate(0, -200, 0);
  sphere(20);
  popMatrix();

  //Top
  translate(0, -450, 0);
  fill(255);
  sphere(200);

  //Face
  pushMatrix();
  translate(0, 0, 200);
  fill(#CB6D15);
  box(20, 20, 100);
  translate(-60, -50, 0);
  fill(0);
  sphere(20);
  translate(120, 0, 0);
  sphere(20);
  popMatrix();
  popMatrix();
}

void renderBase()
{
  pushMatrix();
  translate(0, width * .75, width/2 + 100);
  fill(0);
  rect(0, 0, width, width/4);
  translate(0, 0, 50);
  fill(255);
  text("Danielian Softworks®", 0, 0);


  translate(0, 0, -width/2 - 150);
  fill(#865F3A);
  box(width, width/2, width);
  popMatrix();
}
