
//processing step1
void setup (){
  
size (600, 600);
  // cornerLines
  line (300,300,600,0);
  line (300,300,600,600);
  line (300,300,0,600);
  line (300,300,0,0);
  
  
  // rectangles
  float rect_x = 280;
  float rect_y = 280;
  int rect_width = 40;
  int rect_height = 40;
  noFill();
  
  for (int i=1; i<9; i++) {
      rect (rect_x, rect_y, rect_width, rect_height);
      rect_x = rect_x - 35;
      rect_y = rect_y - 35;
      rect_width = rect_width + 70;
      rect_height = rect_height + 70;
  }
  
  // line_center to right outer edge  
  FloatList list1;
  list1 = new FloatList();
  float randomVal1 = random(600);
  list1.append(randomVal1);
  
  for(int i=1; i<=3; i++){
        list1.append(random(600));	
        
        if(list1.get(i) > list1.get(i-1)){
          if(list1.get(i) - list1.get(i-1) < 10){
            list1.remove(i);
            i--;          
          }
          
        }  
        else {
            list1.remove(i);
            i--;
        }        
  }
  
  for(int i=0; i<list1.size(); i++){
	line (300, 300, 600, list1.get(i));
  } 
  
  // line_center to bottom outer edge 
  FloatList list2;
  list2 = new FloatList();
  
  for(int i=0; i<4; i++){
    float randomVal2 = random(600);
  
  if(list2.hasValue(randomVal2) != true){
    list2.append(randomVal2);
  } else {
           i--;
        }
  }
  
  for(int i=0; i<list2.size(); i++){
  line (300, 300, list2.get(i), 600);
  } 
  
  // line_center to left outer edge  
  FloatList list3;
  list3 = new FloatList();
  
  for(int i=0; i<4; i++){
    float randomVal2 = random(600);
    
  
  if(list3.hasValue(randomVal2) != true){
    list3.append(randomVal2);
  } else {
           i--;
        }
  }
  
  for(int i=0; i<list3.size(); i++){
  line (300, 300, 0, list3.get(i));
  } 
  
  // line_center to top outer edge  
  FloatList list4;
  list4 = new FloatList();
  
  for(int i=0; i<4; i++){
    float randomVal2 = random(600);
  
  if(list4.hasValue(randomVal2) != true){
    list4.append(randomVal2);
  } else {
           i--;
        }
  }
  
  for(int i=0; i<list4.size(); i++){
  line (300, 300, list4.get(i), 0);
  } 
}
