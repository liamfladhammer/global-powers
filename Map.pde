class Map{
  PImage img;
  ArrayList<Zone> zones;
 
  Map(){
    zones=new ArrayList<Zone>();
  }
  
  Map(String filepath){
    img=loadImage(filepath);
    zones=new ArrayList<Zone>();
  }
  
  Map(PImage image){
    img=image;
    zones=new ArrayList<Zone>();
  }
  
  void setImage(String filepath){
    img=loadImage(filepath);
  }
  
  void setImage(PImage image){
    img=image;
  }
  
  void display(){
    image(img, 0, 0);
      for(Zone z: zones){
        z.displayConnections();
      }
      for(Zone z: zones){
        z.displayZones();
      }
  }
 
  void addZone(Zone z){
    zones.add(z);
  }
  
  Zone z(float x, float y){
    for(Zone z: zones)
      if(z.clickInZone(x, y))
        return z;
    return null;
  }
  
  Zone z(String name){
    for(Zone z: zones)
      if(z.getZName().equals(name))
        return z;
    return null;
  }
}
