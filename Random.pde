int cnt_called=0;
String text="";
Vector<Integer> seq = new Vector<Integer>();
void addSeq()
{
  for (int i = 1; i <=30; i++) seq.add(i);
  Collections.shuffle(seq, new Random(System.currentTimeMillis()));
  Collections.shuffle(seq, new Random(System.currentTimeMillis()));  
}
void straw()
{
  text=new String(""+seq.get(cnt_called));
  println(text);
  
  for(int i=0;i<6;i++)
  {
     for(int j=0;j<5;j++)
     {
       if(SEAT[i][j]==seq.get(cnt_called))
       { 
         XX=i;
         YY=j;     
       }  
     }
  }
  cnt_called++;
  if(cnt_called==30)
  {
    Collections.shuffle(seq, new Random(System.currentTimeMillis()));
    Collections.shuffle(seq, new Random(System.currentTimeMillis()));
    cnt_called=0;
  }
  
}
void DrawCirc()
{
  stroke(#FAEB40);
  fill(0);
  circle(1200,450,400);
  textSize(200);
  fill(255,255,255);
  text(text,1101,506);
}
void addIn()
{
  int cnt=0;
  for(int i=0;i<6;i++)
  {
    for(int j=0;j<5;j++)
    {
       if(SEAT_Color[i][j]==false)  {SEAT[i][j]=vec.get(cnt);cnt++;}
       SEAT_Color[i][j]=true;
    }
  }
}
void random1()
{
  s="Random Time Seed";
  for (int i = 1; i <=30; i++)   
    if (!Ts.contains(i)) {vec.add(i);Ts.add(i);}
  Collections.shuffle(vec, new Random(System.currentTimeMillis()));
  Collections.shuffle(vec, new Random(System.currentTimeMillis()));
  addIn();
}
void random2()
{
  s="Old Fashioned Way";
  int cnt=0;
  y=(int)random(1,31);
  Random generator = new Random(System.currentTimeMillis());
  y = generator.nextInt(30)+1;
  for (int i = 1; i <=30; i++) { 
          if (Ts.contains(y))
           {
             y++;
             while(Ts.contains(y)&&cnt<30)
             {
               cnt++;
               y=(y+1)%30;               
             }
           }
           if(y==0) y=30;
           vec.add(y);
           Ts.add(y);
           y=(y+x)%30;
           println(y);
           
           cnt=0;
        }
    addIn();
}
