float y1=50,y2=1,y3=200,y4=3;
float T=0.1,F=0;
float m1=1,m2=3,k1=0.5,k2=1,b=0.2;
void setup() {
size(800,200);
smooth();
}
void draw(){
background(255);
y1+=T*y2;
y2+=(-T/m1)*(b*(y2-y4)+k2*((y1-200)-(y3-400))+k1*(y1-200));
y3+=T*y4;
y4+=(-T/m2)*(b*(y4-y2)+k2*((y3-400)-(y1-200))-F);
fill(0);
ellipse(y1,height/2,20,20);
fill(0);
ellipse(y3,height/2,20,20);
//saveFrame("line-######.png");
}
