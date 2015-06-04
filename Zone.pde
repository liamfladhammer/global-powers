class Zone{
  String zonename;
  float x, y;  
  Nation nat;
  float army;
  ArrayList<Zone> connect;
  
  Zone(float xpos, float ypos){
    x=xpos;
    y=ypos;
    connect=new ArrayList<Zone>();
  }
  
  Zone(float xpos, float ypos, Nation n, float numArmy, String name){
    x=xpos;
    y=ypos;
    nat=n;
    army=numArmy;
    zonename=name;
    connect=new ArrayList<Zone>();
  }
  
  void displayConnections(){
    for(Zone z: connect)
      line(x+25, y+25, z.getX()+25, z.getY()+25);
  }
  
  void displayZones(){
    image(nat.getFlag(), x, y);
    text(""+(int)army, x, y);
  }
  
  void connect(Zone z){ 
    connect.add(z);
    z.connectb(this); //calls another connect method for two way connections
  }
  
  void connectb(Zone z){
    connect.add(z);
  }
  
  boolean connectsTo(Zone z){
    return connect.contains(z);
  }
  
  boolean clickInZone(float xpos, float ypos){
    //println(xpos+" "+x+"      "+ypos+" "+y);
    if(xpos>=x && xpos<=x+50 && ypos>=y && ypos<=y+50)
      return true;
    return false;
  }
  
  void attack(Zone z2){ //should be run through the map for better control
    if(connect.contains(z2)&&army>0){
      float army1=army*nat.getRating();
      float army2=z2.getArmy()*z2.getNation().getRating()*2; //defenders get *2 bonus
      float surv=army1-army2;
      float winrat;
      if(army1>=army2)
        winrat=nat.getRating();
      else
        winrat=z2.getNation().getRating();
      z2.setArmy(abs(surv)/winrat/2);
      setArmy(0);
    }
  }
  
  void setArmy(float a){
    army=a;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  float getArmy(){
    return army;
  }
  
  String getZName(){
    return zonename;
  }
  
  Nation getNation(){
    return nat;
  }
  
  String toString(){
    return zonename;
  }
}
