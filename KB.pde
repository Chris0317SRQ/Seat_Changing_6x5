boolean overSeat(int x, int y, int width, int height)  {
  if (mouseX > x && mouseX < x+width && 
      mouseY > y && mouseY < y+height) {
   posX= mouseX/150;
    posY=mouseY/150-1;
    return true;
  } else {
    return false;
  }
}
void keyPressed() {
  if(in==1)
  {
    System.out.println(in);
    if(key!=ENTER&&key-'0'<=9&&key-'0'>=0)
    {
      str+=key;
      System.out.println(str);
    }
    else if(key==ENTER)
    {
      SEAT[posX][posY]=parseInt(str);
      SEAT_Color[posX][posY]=true;
      System.out.println("str="+str+"SEAT="+SEAT[posX][posY]);
      Ts.add(parseInt(str));
      str="";
      in=0;
    }
  }
}
void candraw()
{
    fill(240,15,0);
    square(posX*150,(posY+1)*150,150);    
    for(int i=0;i<6;i++)
    {
       for(int j=0;j<5;j++)
       {
          if(SEAT_Color[i][j]==true)
          { 
            if(XX==i&&YY==j)
            {
               fill(#FAEB40);
               square(i*150,(j+1)*150,150);
               textSize(100);
               fill(#E61D1D);
               String ue = new String(""+SEAT[i][j]);
               text(ue,i*150+26, (j+1)*150+106);
            }
            else
            {
                fill(50);
                square(i*150,(j+1)*150,150);
                textSize(100);
                fill(255,255,255);
                String ue = new String(""+SEAT[i][j]);
                text(ue,i*150+26, (j+1)*150+106);
            }
          }} } }
