/* Isabell Herzog 
   subject: Eingabe/Ausgabe
   lesson: Processing_Sketch 
*/
   
//instance variables
float [] parameterx1 = new float [16];
float [] parametery1 = new float [16];
float [] parameterx2 = new float [16];
float [] parametery2 = new float [16];
ArrayList<ArrayList<float[]>> triangles = new ArrayList<ArrayList<float[]>>();
float randomKey1;
float randomKey2;
int a;
int b;
float savex1;
float savey1;
float savex2;
float savey2;
int positionArray1;
int positionArray2;
int zaehler = 0;
boolean down = false;


void setup (){
  frameRate (1);
  size (500, 500);
  background (255);
}

void draw(){  
  background (255);
  smooth();
  strokeWeight(3);

  // old triangles          //i        //array über das ich gehe
  for (ArrayList<float[]> triangle : triangles){  
    float[] xyArray = new float[triangle.get(0).length];
    float[] rgbArray = new float[triangle.get(1).length];
    
    for(int i=0; i<triangle.get(0).length; i++){
      xyArray[i] = triangle.get(0)[i];
    } 
    
    for(int i=0; i<triangle.get(1).length; i++){
      rgbArray[i] = triangle.get(1)[i]; 
    }
    
    noStroke ();
    fill(rgbArray[0], rgbArray[1], rgbArray[2], 180);
    triangle (xyArray[0], xyArray[1], xyArray[2], xyArray[3], xyArray[4], xyArray[5]);
  }
  stroke(40);
 
  //corner-lines
  line (width/2, height/2, 57.5, 57.5);
  line (width/2, height/2, 442.5, 57.5);
  line (width/2, height/2, 467.5, 467.5);
  line (width/2, height/2, 32.5, 467.5);
  
  //rectangles declaration
  float rect_x = width/2 - 17.5;
  float rect_y = height/2 - 17.5;
  int rect_width = 35;
  int rect_height = 35;
  noFill();

  //draw rectangles 
  for (int i=1; i<9; i++) {
      rect (rect_x, rect_y, rect_width, rect_height);
      rect_x = rect_x - 25;
      rect_y = rect_y - 25;
      rect_width = rect_width + 50;
      rect_height = rect_height + 50;
  }

 
  //lines
  float endy1 = 0;
  float endy2 = 0;
  float endx3 = 0;
  float endx4 = 0;
  
  //for: is drawing sixteen variable lines 
  for (int i = 0; i <= 15; i++){
    
    //if: is defining four lines on the left side
    if (i < 4){ 
      float endx1 = 57.5;
      endy1 = endy1 + random(77.5, 105.6);
      parameterx1[i] = endx1;
      parametery1[i] = endy1;
    }
    
    //if: is defining four lines on the right side
    if ((i >= 4) && (i < 8)){
      float endx2 = 442.5;
      endy2 = endy2 + random(77.5, 105.6);
      parameterx1[i] = endx2;
      parametery1[i] = endy2;
    }
    
    //if: is defining four lines on the upper side
    if ((i >= 8) && (i < 12)){
      endx3 = endx3 + random(77.5, 105.6);
      float endy3 = 57.5;
      parameterx1[i] = endx3;
      parametery1[i] = endy3;
    }
  
    //if: is defining four lines on the lower side
    if ((i >= 12) && (i <= 15)){
     float endy4;
     
     //if: is looking for the two lines which should be longer than the other fourteen
     if ((i==12) || (i==15)){
       endx4 = endx4 + random(77.5, 105.6);
       endy4 = 467.5;
       parameterx1[i] = endx4;
       parametery1[i] = endy4;
     }
     
     //else: belongs to the first if, which is defining four lines on the lower side
     else{ 
       endx4 = endx4 + random(77.5, 105.6);
       endy4 = 442.5;
       parameterx1[i] = endx4;
       parametery1[i] = endy4;
     }
   } 
  }
 
 //special-line/crossline
 arrayCopy(parameterx1, parameterx2); //copy x-values from array1 in array2
 arrayCopy(parametery1, parametery2); //copy y-values from array1 in array2
   randomKey1 = random (0,14); //random value which could describe the first point from the crossline
   randomKey2 = random (0,14); //random value which could describe the second point from the crossline
   a = ceil(randomKey1); //change float into integer 
   b = ceil(randomKey2); //change float into integer
    
    
 //rules for the crossline declaration
 for (int i=1; i<2; i++){
     
    if ((a <= 3) && (b <= 3) || (a > 3) && (a <= 7) && (b > 3) && (b <= 7) || (a > 7) && (a <= 11) && (b > 7) && (b <= 11) || (a > 11) && (a <= 14) && (b > 11) && (b <= 14) || (a == 12) || (b == 12)) {
      randomKey1 = random (0,14);
      randomKey2 = random (0,14);
      a = ceil(randomKey1);
      b = ceil(randomKey2);
      i = i-1;
    }

    else {
      println ("warum? a: " + a + ", b: " + b);
      savex1 = parameterx1[a];
      savey1 = parametery1[a];
      savex2 = parameterx2[b];
      savey2 = parametery2[b];
      positionArray1 = a;
      positionArray2 = b;
       
    }   
 }
   
 //run
 for (int i=0; i<=15; i++){
   if ((positionArray1 != i) && (positionArray2 != i) ){
       line(width/2, height/2, parameterx1[i], parametery1[i]);
    }
 
    if (i == 12){
       line(32.5, 467.5, parameterx1[i], parametery1[i]); //horizontal lines beetween the corner line and the first longer line
    }
     
    if (i == 15){
      line(467.5, 467.5, parameterx1[i], parametery1[i]); //horizontal lines beetween the corner line and the second longer line
    } 
  }
  
  ArrayList<float[]> paramsAndRgb = new ArrayList<float[]>();
  
  //arrayList   
  float[] triangle = new float [6];
  triangle[0]= width/2;
  triangle[1]= height/2;
  triangle[2]= parameterx1[a];
  triangle[3]= parametery1[a];
  triangle[4]= parameterx2[b];
  triangle[5]= parametery2[b];
  paramsAndRgb.add(triangle);
    
  float[] rgb = new float [3];
  rgb[0]= random(0,255);
  rgb[1]= random(0,255);
  rgb[2]= random(0,255); 
  paramsAndRgb.add(rgb);
  
  triangles.add(paramsAndRgb);/* oder nur triangles.add(new float[]{width/2, height/2, parameterx1[a], parametery1[a], parameterx2[b], parametery2[b]});*/
 if (down == false){  
  noStroke ();
  fill (rgb[0], rgb[1], rgb[2], 180);
  triangle (width/2, height/2, parameterx1[a], parametery1[a], parameterx2[b], parametery2[b]);
    stroke(40);
    line(savex1, savey1, savex2, savey2); //triangle
    line (width/2, height/2,savex1, savey1); //triangle
    line (width/2, height/2, savex2, savey2); //triangle 
  }
  else{
    line (width/2, height/2,savex1, savey1); //triangle
    line (width/2, height/2, savex2, savey2); //triangle 
    noLoop();
  }
}

void mousePressed() {
  down = true;
}
