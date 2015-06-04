class Nation{
  PImage flag;
  float rating;
  
  Nation(){
  }
  
  Nation(String filepath, float rat){
    flag=loadImage(filepath);
    rating=rat;
  }
  
  PImage getFlag(){
    return flag;
  }
  
  float getRating(){
    return rating;
  }
  
  boolean equals(Nation n){
    if(flag.equals(n.getFlag()))
      return true;
    return false;
  }
}
