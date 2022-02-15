/*
  Written by Michael Makarenko on 12/03/2020

  Class that will contain data, one line of data stored per object.
  Data is split and converted into variable types appropriately.
  Works specifically with the dailyprices csv files
  - Michael Makarenko
  
  Class may also contain arrayList which stores each extracted value 
  from the .csv file and stores them in their own arrayList
  (not currently in use)
  - Jiss Joseph
*/
public class DataPoint
{
  // instance variables
  
  //ArrayList<String> Ticker = new ArrayList();
  //ArrayList<Float> openPrice = new ArrayList();
  //ArrayList<Float> closePrice = new ArrayList();
  //ArrayList<Float> adjustedCLose = new ArrayList();
  //ArrayList<Float> low = new ArrayList();
  //ArrayList<Float> high = new ArrayList();
  //ArrayList<Integer> Volume = new ArrayList();
  //ArrayList<String> Date = new ArrayList();
  
  String line;
  String[] splitLine;
  String ticker;
  float open_price;
  float close_price;
  float adjusted_close;
  float low;
  float high;
  int volume;
  int date;
  float change;
  
  //int Volumes;
  // String Ticker;
  // Float open_Price;
  // Float close_Price;
  // Float adjusted_Price;
  // Float low;
  // Float high;
  // String date = " ";
  
  //default constructor
  DataPoint()
  {
    this.line = null;
  }
  
  /*
    Constructor splits the comma-separated values and assigs them to variables.
    Since date is in format YYYY-MM-DD, we split that by hyphens and add them into
      one integer to make sorting by date easier.
    For reference: split() turns a String into a String[], separating elements by
      a certain char, like "," or "-".
    - Michael Makarenko
  */
  DataPoint(String line)
  {
    this.line = line;
    splitLine = split(this.line, ",");
    ticker = splitLine[0];
    open_price = float(splitLine[1]);
    close_price = float(splitLine[2]);
    adjusted_close = float(splitLine[3]);
    low = float(splitLine[4]);
    high = float(splitLine[5]);
    volume = int(splitLine[6]);
    String[] dateString = split(splitLine[7], "-");
    int year = int(dateString[0])*10000;
    int month = int(dateString[1])*100;
    int day = int(dateString[2]);
    date = year + month + day;
    change = open_price - close_price;
  }
  
  // for loop that goes through the column for Volume and adds the values into
  // a seperate array.
  //void LoadData()
  //{
  //  table = loadTable("daily_prices1k.csv");
  //  for (TableRow row : table.rows())
  //  {
  //    Volumes = row.getInt(6);
  //    Volume.add(Volumes);
  //    
  //   date = row.getString(7);
  //   Date.add(date);
  //  }
  //}
  
}
