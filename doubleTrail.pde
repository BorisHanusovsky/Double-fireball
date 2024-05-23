int TRAIL_LEN = 200;
float SQUARE_SIZE = 100;
ArrayList<Position> buffer1 = new ArrayList<Position>();
ArrayList<Position> buffer2 = new ArrayList<Position>();
float alpha;
float X1, Y1, X2, Y2;

void setup(){
  frameRate(120);
  fullScreen();
  //size(600,600);
  background(50);
  noStroke();
  for(int i = 0; i < TRAIL_LEN; i++){
    buffer1.add(new Position(0,0));
    buffer2.add(new Position(0,0));
  }
}

void draw(){
  background(50);
  X1 = mouseX + random(-20,20);
  Y1 = mouseY + random(-20,20);
  X2 = width - mouseX  + random(-20,20);
  Y2 = height - mouseY + random(-20,20);
  //Y2 = Y1;
  alpha = 0;
  fill(245,208,42,alpha);
  
  for(int i = TRAIL_LEN - 2; i >= 0; i--){
    buffer1.set(i + 1, buffer1.get(i));
    buffer2.set(i + 1, buffer2.get(i));
  }
  buffer1.set(0, new Position(X1, Y1));
  buffer2.set(0, new Position(X2, Y2));
  
  for(int i = TRAIL_LEN - 1; i >= 0; i--){
    alpha += 255/ TRAIL_LEN;
    fill(245,208 -1.97 * i,42,alpha);
    rect(buffer1.get(i).X - SQUARE_SIZE/2,
         buffer1.get(i).Y - SQUARE_SIZE/2,
         SQUARE_SIZE - i * SQUARE_SIZE/TRAIL_LEN,
         SQUARE_SIZE - i * SQUARE_SIZE/TRAIL_LEN);
         
    rect(buffer2.get(i).X - SQUARE_SIZE/2,
         buffer2.get(i).Y - SQUARE_SIZE/2,
         SQUARE_SIZE - i * SQUARE_SIZE/TRAIL_LEN,
         SQUARE_SIZE - i * SQUARE_SIZE/TRAIL_LEN);
  }
}

class Position{
  public float X, Y;
  public Position(float x, float y){
    X = x;
    Y = y;
  }
}
