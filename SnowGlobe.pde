PVector centerPos;
PVector cameraPos;
ArrayList<Snow> snow;

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  perspective(PI/2.5, float(width)/height, .01, width * 10);

  centerPos = new PVector(0, 0, 0);
  cameraPos = new PVector(sin(frameCount * .01) * width, 0, cos(frameCount * .01) * width);
  snow = new ArrayList<Snow>();
}

void draw()
{
  background(0);

  cameraPos.x = sin(frameCount * .01) * width;
  cameraPos.z = cos(frameCount * .01) * width;
  camera(cameraPos.x, cameraPos.y, cameraPos.z, centerPos.x, centerPos.y, centerPos.z, 0, 1, 0);

  if (snow.size() < 1000)
  {
    for (int i = 0; i < 10; i++)
      snow.add(new Snow());
  }

  for (int i = 0; i < snow.size(); i++)
  {
    Snow temp = snow.get(i);
    temp.render();
    
    if(temp.atBottom())
       snow.set(i,new Snow());
  }
}
