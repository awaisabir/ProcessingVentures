size(500,500);
background(255);

int houseWidth = 200;
int houseHeight = 150;
int houseX = width/2;
int houseY = height*2/3;

fill(70, 162, 31);
rect(0, height*2/3, width, height/3);

fill(234,210,121);

rectMode(CENTER);
rect(houseX, houseY, houseHeight, houseWidth);

fill(234, 121, 125);
triangle(houseX + houseHeight/2,//x1  //houseHeight was used instead of HouseWidth because of the intechange of them both when the parameters for the rrect() function were being set.
         houseY - houseWidth/2 , //y1  //houseHeight was used instead of HouseWidth because of the intechange of them both when the parameters for the rrect() function were being set.
        houseX - houseHeight/2, //x2   //houseHeight was used instead of HouseWidth because of the intechange of them both when the parameters for the rrect() function were being set.
       houseY - houseWidth/2, //y2  //houseHeight was used instead of HouseWidth because of the intechange of them both when the parameters for the rrect() function were being set.
        houseX, //x3  //houseX was to be used because the tip of the triangle is supposed to be in the exact center, which also happens to be the value for houseX.
        houseY - houseWidth);//y3  //Using these 2 values through random use gave me the exact Y value for the tip. Sometimes if stuck, trying random values is a good way to overcome obstacles!
