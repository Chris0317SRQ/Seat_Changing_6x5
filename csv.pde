Table table,table2;
 
void export()
{
  s="Export to CSV";
   table = new Table();
  //table.addColumn("a");
  //table.addColumn("b");
  //table.addColumn("c");
  for(int i=0;i<6;i++)table.addColumn();
  table.addColumn("base");
  for(int i=0;i<5;i++) table.addRow();
  TableRow newRow = table.addRow();
  for(int i=0;i<6;i++)
  {
     for(int j=0;j<5;j++)
     {
        table.setInt(j,i, SEAT[i][j]);       
     }
  }
  
   newRow.setInt("base",x);
  if(loadT()==false)
  {
    if(day()<20) saveTable(table,"Seat-"+month()+".csv");
    else saveTable(table,"Seat-"+set+".csv");
  }
  else s="Load Failed";
  for(int i=0;i<6;i++)
  {
     for(int j=0;j<5;j++)
     {
        table.setInt(4-j,5-i, SEAT[i][j]);       
     }
  }
  table.addRow();
  table.setString(6,2,"TABLE");
  table.setString(6,3,"TABLE");
  if(day()<15) saveTable(table,"Print-"+month()+"("+month()+day()+"-"+hour()+minute()+second()+").csv");
  else saveTable(table,"Print-"+set+"("+month()+day()+"-"+hour()+minute()+second()+").csv");
  
}
boolean loadT()
{
  table2 = new Table();
  table2 = loadTable("Seat-"+month()+".csv", "header");
  if(table2==null) 
  {
    table2=loadTable("Seat-"+set+".csv", "header");
    if(table2==null) return false;    
  }
  return true;
}
int det=month()-1;
int set=month()+1;
void load()
{
  table = new Table();
  table = loadTable("Seat-"+month()+".csv", "header");
  if(table==null) table=loadTable("Seat-"+det+".csv", "header");  
  int uu=0;
  s="Importing CSV...";
  if(table!=null)
  {
    for(int i=0;i<6;i++)
    {
       for(int j=0;j<5;j++)
       {
         uu=table.getInt(j,i);    
         if(uu==0) SEAT_Color[i][j]=false;
         else
         {
          SEAT[i][j]=uu;
          SEAT_Color[i][j]=true;
         }
       }
    }
    x=table.getInt(5,6)+1;
    s="CSV Imported";
  }
  else s="CSV Import Failed";
}
