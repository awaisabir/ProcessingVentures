size(700,700);

//road
fill(0);
rect(0, 350, 700, 700*0.2);
fill(255,255,255);
rect(0, 400, 50,20);
rect(335, 400, 60,20);
rect(500, 400, 60,20);
rect(150, 400, 60,20);
rect(635, 400, 60,20);

//car body
int CarbodyX = 160;
int CarbodyY = 300;
int Carbodylength = 400;
int Carbodywidth = 100;
strokeWeight(1.5);
fill(81,87,224);
rect(CarbodyX, CarbodyY, Carbodylength,Carbodywidth);

//wheels
fill(0);
int wheelwidth = 70;
int wheellength = 70;
stroke(255,255,255);
strokeWeight(2);
ellipse(CarbodyX + 65, CarbodyY + 100,wheelwidth ,wheellength);
ellipse(CarbodyX + 65, CarbodyY + 100,wheelwidth-50 ,wheellength-50);
ellipse(CarbodyX + 325, CarbodyY + 100,wheelwidth ,wheellength);
ellipse(CarbodyX + 325, CarbodyY + 100,wheelwidth-50 ,wheellength-50);

//car top part
stroke(0);
strokeWeight(2);
fill(81,87,224);
rect(CarbodyX + 100, CarbodyY - 100. , Carbodylength /2 , Carbodywidth);

//lights
fill(250,250,0);
rect(CarbodyX + 1, CarbodyY + 10,20,10);
rect(CarbodyX + 379, CarbodyY + 10,20,10);

