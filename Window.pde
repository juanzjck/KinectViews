

class PWindow extends PApplet {
  float xt;
  float yt;
  String  imgpath;
  PImage image;
  

  float ZOOM = 0.0001;
int LEVELS = 4;
float TIMEOUT = 400;

float old_t = 0;

int N = 200;
PVector[] points;
  PWindow(String imgpath) {
    super();
   this.imgpath= imgpath;
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

 void settings() {
 size(640, 480,P3D); 
      // size(800, 400);
}

  void setup() {
 
      image = loadImage("/Users/juansalazar/Desktop/KinecTrakin/hola.jpg");

    smooth();
    strokeWeight(0.3);
    background(0);
    stroke(255, 255, 255, 30);
    points = new PVector[N];
    new_points();
    }
void new_points() {
    for (int i=0; i<N; i++) {
        points[i] = new PVector(random(-40, width+40), random(-40, width+40));
    }
}
  void draw() {
     background(image);
     background(0);
   // text("x:"+x+"y"+y,12,12);
       for ( int i = 0; i < columns; i++) {
        // Begin loop for rows
        for ( int j = 0; j < rows; j++) {
          int x = i*cellsize + cellsize/2;  // x position
          int y = j*cellsize + cellsize/2;  // y position
          int loc = x + y*img.width;  // Pixel array location
          color c = img.pixels[loc];  // Grab the color
          // Calculate a z position as a function of mouseX and pixel brightness
          float z = (xt / float(width)) * brightness(img.pixels[loc]) - 20.0;
          // Translate to the location, set fill and stroke, and draw the rect
          pushMatrix();
          translate(x, y, z);
          fill(c, 204);
          noStroke();
          rectMode(CENTER);
          rect(0, 0, cellsize, cellsize);
          popMatrix();
        }
      }
      /*
          float t = millis();
    
    if (t - old_t > TIMEOUT) {
        new_points();
        old_t = t;
    }
    
    for (int i=0; i<N; i++) {
        PVector old_point = points[i];
        
        PVector new_point = new PVector(old_point.x, old_point.y);
        for (int j=1; j<=LEVELS; j++) {
          //10.0*(noise(1, old_point.x*ZOOM*j*j*10*xt, old_point.y*ZOOM*j*j*10*xt)-0.5)/j*j,
                //10.0*(noise(2, old_point.y*ZOOM*j*j*10*yt, old_point.y*ZOOM*j*j*10*yt)-0.5)/j*j
            new_point.add(new PVector(
                10.0*(noise(xt,yt)-0.5)/j*j,
                10.0*(noise(xt,yt)-0.5)/j*j
            ));
        }
        PVector point_difference = PVector.sub(new_point, old_point);
        PVector line_vector = new PVector(-point_difference.y, point_difference.x);
        line_vector.mult(3.0);
        line_vector.add(old_point);
        line(old_point.x, old_point.y, line_vector.x, line_vector.y);
        points[i] = new_point;
  
  }*/

  }

  public void comunication(float x,float y){
   this.xt=x;
  this.yt=y;
  }
  

}  