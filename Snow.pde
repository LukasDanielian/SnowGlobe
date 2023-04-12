class Snow
{
  float size;
  PVector pos, vel;

  public Snow()
  {
    size = random(15, 25);
    vel = new PVector(random(-1, 1), random(5, 10), random(-1, 1));
    float dist;

    do
    {
      pos = new PVector(random(-width/2, width/2), random(-width/2, 0), random(-width/2, width/2));
      dist = dist(pos.x, pos.y, pos.z, centerPos.x, centerPos.y, centerPos.z);
    }
    while (dist < width * .45 || dist > width * .5);
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateX(frameCount * .01);
    rotateY(frameCount * .01);
    rotateZ(frameCount * .01);
    fill(255);
    box(size, 1, 1);
    box(1, size, 1);
    box(1, 1, size);
    popMatrix();

    pos.add(vel);

    if (outOfBounds())
      pos = PVector.add(centerPos, pos.sub(centerPos).copy().normalize().mult(width/2));
  }
  
  boolean atBottom()
  {
    return pos.y > width * .49;
  }

  boolean outOfBounds()
  {
    return dist(pos.x, pos.y, pos.z, centerPos.x, centerPos.y, centerPos.z) > width * .5;
  }
}
