Map map;
PImage pic;
Nation britan, nazi, france, ussr;
Zone selection;
UI ui;

void setup(){  
  pic=loadImage("Europe.jpg");
  map=new Map(pic);
  ui=new UI();
  
  loadNations();
  loadZones();
  connectZones();
  
  size(1000, pic.height);
}

void draw(){
  textSize(16);
  fill(0);

  map.display();
  ui.coordinates();

 if(selection!=null){
    text(selection.getZName(), 20, 60);
  }
}

void loadNations(){
  //britan=new Nation("britan.jpg", 8);
  //nazi=new Nation("nazi.jpg", 10);
  //france=new Nation("france.jpg", 2);
  ussr=new Nation("ussr.png", 3);
}

void loadZones(){
  map.addZone(new Zone(370, 330, ussr, 500, "France"));
  map.addZone(new Zone(480, 225, ussr, 50, "Germany"));
  map.addZone(new Zone(875, 175, ussr, 1000, "Russia"));
  map.addZone(new Zone(625, 225, ussr, 1, "Poland"));
  map.addZone(new Zone(310, 215, ussr, 2, "Great Britan"));
  map.addZone(new Zone(760, 180, ussr, 100, "Belarus"));
  map.addZone(new Zone(830, 300, ussr, 200, "Ukraine"));
}

void connectZones(){
  map.z("France").connect(map.z("Great Britan"));
  map.z("France").connect(map.z("Germany"));
  map.z("Germany").connect(map.z("Poland"));
  map.z("Poland").connect(map.z("Belarus"));
  map.z("Poland").connect(map.z("Ukraine"));
  map.z("Belarus").connect(map.z("Ukraine"));
  map.z("Russia").connect(map.z("Ukraine"));
  map.z("Russia").connect(map.z("Belarus"));    
}

void mouseClicked(){
  if(selection==null)
    selection=map.z(mouseX, mouseY);
  else{
    selection.attack(map.z(mouseX, mouseY));
    selection=null;
  }
}


