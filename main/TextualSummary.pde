// added by Oluwatumininu Ogunbadejo 01/04/2020
// added to by Jiss Joseph on 02/04/2020
//Added to by Aislinn Smyth 02/04/2020

public class TextualSummary 
{
  int ypos;
  int xpos;
  int line1, line2 = 0, line3 = 0, line4 = 0, line5 = 0;
  String[] stats;
  color wordColour;
  String dataType = null;
  CompanyData stock = null;
  String text = "";
  int dataValue;
      
  //default constructor 
  TextualSummary()
  {
  }
  
   //Constructor for CompanyData - Michael Makarenko
  TextualSummary(int xpos, int ypos, CompanyData stock, color wordColour)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.stock = stock;
    this.wordColour = wordColour;
  }
  
  //Constructor for generic text output - Michael Makarenko
  TextualSummary(int xpos, int ypos, String text, color wordColour)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.text = text;
    this.wordColour = wordColour;
  }
  
  //Constructor for 5 DataPoints - Oluwatumininu Ogunbadejo
  TextualSummary(int xpos, int ypos, int line1, int line2, int line3, int line4, int line5, String dataType, color wordColour)
  {
    this.xpos = xpos;
    this.ypos = ypos; 
    this.line1 = line1;
    this.line2 = line2;
    this.line3 = line3;
    this.line4 = line4;
    this.line5 = line5;
    this.dataType = dataType;
    this.wordColour = wordColour;
  }
  
          
  void draw()
  {
    if (text != "")
    {
      fill(wordColour);
      text(text, xpos, ypos);
    }
    //draw for CompanyData - Michael Makarenko
    if (stock != null)
    {
      fill(wordColour);
      text(stock.ticker + " Exchange: " + stock.exchange, xpos, ypos);
      text(stock.ticker + " Name: " + stock.name, xpos, ypos+30);
      text(stock.ticker + " Sector: " + stock.sector, xpos, ypos+60);
      text(stock.ticker + " Industry: " + stock.industry, xpos, ypos+90);
      text(stock.ticker + " Stock Data Entries: " + stockList.size(), xpos, ypos+120);
      fill(204, 153, 0);
      text("See stockList.csv for list of all data entries for this stock", xpos, ypos+150);
      fill(wordColour);
    }
    //draw for DataPoints and dateList - Oluwatumininu Ogunbadejo & Michael Makarenko
    if (dataType != null)
    {
      fill(wordColour);
      if (dataType.equals("Volume"))
      {
        if (dateList != null)
        {
          text(dateList.get(line1).ticker + " Volume: " + dateList.get(line1).volume, xpos +100 , ypos);
          text(dateList.get(line2).ticker + " Volume: " + dateList.get(line2).volume, xpos + 100, ypos+30);
          text(dateList.get(line3).ticker + " Volume: " + dateList.get(line3).volume, xpos + 100, ypos+60);
          text(dateList.get(line4).ticker + " Volume: " + dateList.get(line4).volume, xpos + 100, ypos+90);
          text(dateList.get(line5).ticker + " Volume: " + dateList.get(line5).volume, xpos + 100, ypos+120);
        }
        else
        {
          text(DataPoints.get(line1).ticker + " Volume: " + DataPoints.get(line1).volume, xpos +100 , ypos);
          text(DataPoints.get(line2).ticker + " Volume: " + DataPoints.get(line2).volume, xpos + 100, ypos+30);
          text(DataPoints.get(line3).ticker + " Volume: " + DataPoints.get(line3).volume, xpos + 100, ypos+60);
          text(DataPoints.get(line4).ticker + " Volume: " + DataPoints.get(line4).volume, xpos + 100, ypos+90);
          text(DataPoints.get(line5).ticker + " Volume: " + DataPoints.get(line5).volume, xpos + 100, ypos+120);
        }
        //makeStats and display - Aislinn Smyth & Michael Makarenko
         stats = makeStats(line1, line2, line3, line4, line5, "Volume");
           text("Mean: " + stats[0], xpos-650, ypos);
           text("Median: " + stats[1], xpos-650, ypos+30);
           //text("Mode: " + stats[2], xpos-600, ypos+60);
           text("Standard Deviation: " + stats[3], xpos-650, ypos+60);
           
   
       }
       
              
       if (dataType.equals("Open Price"))
       {
         if (dateList != null)
         {
           text(dateList.get(line1).ticker + " Open Price: " + dateList.get(line1).open_price, xpos + 100, ypos);
           text(dateList.get(line2).ticker + " Open Price: " + dateList.get(line2).open_price, xpos + 100, ypos+30);
           text(dateList.get(line3).ticker + " Open Price: " + dateList.get(line3).open_price, xpos + 100, ypos+60);
           text(dateList.get(line4).ticker + " Open Price: " + dateList.get(line4).open_price, xpos + 100, ypos+90);
           text(dateList.get(line5).ticker + " Open Price: " + dateList.get(line5).open_price, xpos + 100, ypos+120);
         }
         else
         {
           text(DataPoints.get(line1).ticker + " Open Price: " + DataPoints.get(line1).open_price, xpos + 100, ypos);
           text(DataPoints.get(line2).ticker + " Open Price: " + DataPoints.get(line2).open_price, xpos + 100, ypos+30);
           text(DataPoints.get(line3).ticker + " Open Price: " + DataPoints.get(line3).open_price, xpos + 100, ypos+60);
           text(DataPoints.get(line4).ticker + " Open Price: " + DataPoints.get(line4).open_price, xpos + 100, ypos+90);
           text(DataPoints.get(line5).ticker + " Open Price: " + DataPoints.get(line5).open_price, xpos + 100, ypos+120);
         }
         //makeStats and display
          stats = makeStats(line1, line2, line3, line4, line5, "Open Price");
           text("Mean: " + stats[0], xpos-650, ypos);
           text("Median: " + stats[1], xpos-650, ypos+30);
           //text("Mode: " + stats[2], xpos-600, ypos+60);
           text("Standard Deviation: " + stats[3], xpos-650, ypos+60);
       }
              
       if (dataType.equals("Closing Price"))
       {
         if (dateList != null)
         {
           text(dateList.get(line1).ticker + " Closing Price: " + dateList.get(line1).close_price, xpos + 100, ypos);
           text(dateList.get(line2).ticker + " Closing Price: " + dateList.get(line2).close_price, xpos + 100, ypos+30);
           text(dateList.get(line3).ticker + " Closing Price: " + dateList.get(line3).close_price, xpos + 100, ypos+60);
           text(dateList.get(line4).ticker + " Closing Price: " + dateList.get(line4).close_price, xpos + 100, ypos+90);
           text(dateList.get(line5).ticker + " Closing Price: " + dateList.get(line5).close_price, xpos + 100, ypos+120);
         }
         else
         {
           text(DataPoints.get(line1).ticker + " Closing Price: " + DataPoints.get(line1).close_price, xpos + 100, ypos);
           text(DataPoints.get(line2).ticker + " Closing Price: " + DataPoints.get(line2).close_price, xpos + 100, ypos+30);
           text(DataPoints.get(line3).ticker + " Closing Price: " + DataPoints.get(line3).close_price, xpos + 100, ypos+60);
           text(DataPoints.get(line4).ticker + " Closing Price: " + DataPoints.get(line4).close_price, xpos + 100, ypos+90);
           text(DataPoints.get(line5).ticker + " Closing Price: " + DataPoints.get(line5).close_price, xpos + 100, ypos+120);
         }
         
         //makeStats and display
         
         stats = makeStats(line1, line2, line3, line4, line5, "Closing Price");
           text("Mean: " + stats[0], xpos-650, ypos);
           text("Median: " + stats[1], xpos-650, ypos+30);
           //text("Mode: " + stats[2], xpos-600, ypos+60);
           text("Standard Deviation: " + stats[3], xpos-650, ypos+60);
         
          
       }
            
       if (dataType.equals("Low"))
       {
         if (dateList != null)
         {
           text(dateList.get(line1).ticker + " Low: " + dateList.get(line1).low, xpos + 100, ypos);
           text(dateList.get(line2).ticker + " Low: " + dateList.get(line2).low, xpos + 100, ypos+30);
           text(dateList.get(line3).ticker + " Low: " + dateList.get(line3).low, xpos + 100, ypos+60);
           text(dateList.get(line4).ticker + " Low: " + dateList.get(line4).low, xpos + 100, ypos+90); 
           text(dateList.get(line5).ticker + " Low: " + dateList.get(line5).low, xpos + 100, ypos+120); 
         }
         else
         {
           text(DataPoints.get(line1).ticker + " Low: " + DataPoints.get(line1).low, xpos + 100, ypos);
           text(DataPoints.get(line2).ticker + " Low: " + DataPoints.get(line2).low, xpos + 100, ypos+30);
           text(DataPoints.get(line3).ticker + " Low: " + DataPoints.get(line3).low, xpos + 100, ypos+60);
           text(DataPoints.get(line4).ticker + " Low: " + DataPoints.get(line4).low, xpos + 100, ypos+90); 
           text(DataPoints.get(line5).ticker + " Low: " + DataPoints.get(line5).low, xpos + 100, ypos+120); 
         }
         
          //makeStats and display
          stats = makeStats(line1, line2, line3, line4, line5, "Low");
           text("Mean: " + stats[0], xpos-650, ypos);
           text("Median: " + stats[1], xpos-650, ypos+30);
           //text("Mode: " + stats[2], xpos-600, ypos+60);
           text("Standard Deviation: " + stats[3], xpos-650, ypos+60);
         
        
       }
              
       if (dataType.equals("High"))
       { 
         if (dateList != null)
         {
          text(dateList.get(line1).ticker + " High: " + dateList.get(line1).high, xpos + 100, ypos);
          text(dateList.get(line2).ticker + " High: " + dateList.get(line2).high, xpos + 100, ypos+30);
          text(dateList.get(line3).ticker + " High: " + dateList.get(line3).high, xpos + 100, ypos+60);
          text(dateList.get(line4).ticker + " High: " + dateList.get(line4).high, xpos + 100, ypos+90); 
          text(dateList.get(line5).ticker + " High: " + dateList.get(line5).high, xpos + 100, ypos+120);
         }
         else
         {
          text(DataPoints.get(line1).ticker + " High: " + DataPoints.get(line1).high, xpos + 100, ypos);
          text(DataPoints.get(line2).ticker + " High: " + DataPoints.get(line2).high, xpos + 100, ypos+30);
          text(DataPoints.get(line3).ticker + " High: " + DataPoints.get(line3).high, xpos + 100, ypos+60);
          text(DataPoints.get(line4).ticker + " High: " + DataPoints.get(line4).high, xpos + 100, ypos+90); 
          text(DataPoints.get(line5).ticker + " High: " + DataPoints.get(line5).high, xpos + 100, ypos+120); 
         }
          
           stats = makeStats(line1, line2, line3, line4, line5, "High");
           text("Mean: " + stats[0], xpos-650, ypos);
           text("Median: " + stats[1], xpos-650, ypos+30);
           //text("Mode: " + stats[2], xpos-600, ypos+60);
           text("Standard Deviation: " + stats[3], xpos-650, ypos+60);
          
          //makeStats and display
       }
      
       if (dataType.equals("Adjusted Close"))
       {
         if (dateList != null)
         {
           text(dateList.get(line1).ticker + " Adjusted Close: " + dateList.get(line1).adjusted_close, xpos + 100, ypos);
           text(dateList.get(line2).ticker + " Adjusted Close: " + dateList.get(line2).adjusted_close, xpos + 100, ypos+30);
           text(dateList.get(line3).ticker + " Adjusted Close: " + dateList.get(line3).adjusted_close, xpos + 100, ypos+60);
           text(dateList.get(line4).ticker + " Adjusted Close: " + dateList.get(line4).adjusted_close, xpos + 100, ypos+90); 
           text(dateList.get(line5).ticker + " Adjusted Close: " + dateList.get(line5).adjusted_close, xpos + 100, ypos+120); 
         }
         else
         {
           text(DataPoints.get(line1).ticker + " Adjusted Close: " + DataPoints.get(line1).adjusted_close, xpos + 100, ypos);
           text(DataPoints.get(line2).ticker + " Adjusted Close: " + DataPoints.get(line2).adjusted_close, xpos + 100, ypos+30);
           text(DataPoints.get(line3).ticker + " Adjusted Close: " + DataPoints.get(line3).adjusted_close, xpos + 100, ypos+60);
           text(DataPoints.get(line4).ticker + " Adjusted Close: " + DataPoints.get(line4).adjusted_close, xpos + 100, ypos+90); 
           text(DataPoints.get(line5).ticker + " Adjusted Close: " + DataPoints.get(line5).adjusted_close, xpos + 100, ypos+120); 
         }

         stats = makeStats(line1, line2, line3, line4, line5, "Adjusted Close");
         text("Mean: " + stats[0], xpos-650, ypos);
         text("Median: " + stats[1], xpos-650, ypos+30);
         //text("Mode: " + stats[2], xpos-600, ypos+60);
         text("Standard Deviation: " + stats[3], xpos-650, ypos+60);
       }
     }     
   }
 }
//Calculates mean median mode and standard deviation - Michael Makarenko, Aislinn Smyth & Oluwatumininu Ogunbadejo
String[] makeStats(int line1, int line2, int line3, int line4, int line5, String dataType)
{
  //stats array contains {mean, median, mode, standDev}
  String[] stats = new String[] {"0","0","N/A","0"};
  int zeros = 0;
  int[] lines = new int[] {line1, line2, line3, line4, line5};
  ArrayList<Integer> nonZeros = new ArrayList<Integer>();
  //calculate number of N/A entries and filter them out
  for (int i = 0; i < lines.length; i++)
  {
    if (lines[i] == 0)
      zeros++;
    else
      nonZeros.add(lines[i]);
  }
  // actual calculations of stats according to no. of N/A entries and dataType
  if (zeros == 5)
    return stats;
  if (dateList != null)
  {
    if (zeros == 4 && dataType.equals("Adjusted Close"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(dateList.get(nonZeros.get(0)).adjusted_close);
      stats[1] = stats[0];
      stats[2] = dateList.get(nonZeros.get(0)).ticker;
      return stats;
    }
    //...continued for all dataTypes...
    
    if (zeros == 4 && dataType.equals("Volume"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(dateList.get(nonZeros.get(0)).volume);
      stats[1] = stats[0];
      stats[2] = dateList.get(nonZeros.get(0)).ticker;
      return stats;
    }
    
    if (zeros == 4 && dataType.equals("Open Price"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(dateList.get(nonZeros.get(0)).open_price);
      stats[1] = stats[0];
      stats[2] = dateList.get(nonZeros.get(0)).ticker;
      return stats;
    }
    if (zeros == 4 && dataType.equals("Closing Price"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(dateList.get(nonZeros.get(0)).close_price);
      stats[1] = stats[0];
      stats[2] = dateList.get(nonZeros.get(0)).ticker;
      return stats;
    }
    
    if (zeros == 4 && dataType.equals("High"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(dateList.get(nonZeros.get(0)).high);
      stats[1] = stats[0];
      stats[2] = dateList.get(nonZeros.get(0)).ticker;
      return stats;
    }
    
    if (zeros == 4 && dataType.equals("Low"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(dateList.get(nonZeros.get(0)).low);
      stats[1] = stats[0];
      stats[2] = dateList.get(nonZeros.get(0)).ticker;
      return stats;
    }
    
    if (zeros == 3 && dataType.equals("Adjusted Close"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((dateList.get(nonZeros.get(0)).adjusted_close)
        + (dateList.get(nonZeros.get(1)).adjusted_close)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((dateList.get(nonZeros.get(0)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).adjusted_close - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    //...continued for all dataTypes...
    
    if (zeros == 3 && dataType.equals("Volume"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((dateList.get(nonZeros.get(0)).volume)
        + (dateList.get(nonZeros.get(1)).volume)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((dateList.get(nonZeros.get(0)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).volume - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
    if (zeros == 3 && dataType.equals("Open Price"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((dateList.get(nonZeros.get(0)).open_price)
        + (dateList.get(nonZeros.get(1)).open_price)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((dateList.get(nonZeros.get(0)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).open_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
      if (zeros == 3 && dataType.equals("Closing Price"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((dateList.get(nonZeros.get(0)).close_price)
        + (dateList.get(nonZeros.get(1)).close_price)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((dateList.get(nonZeros.get(0)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).close_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
    if (zeros == 3 && dataType.equals("High"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((dateList.get(nonZeros.get(0)).high)
        + (dateList.get(nonZeros.get(1)).high)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((dateList.get(nonZeros.get(0)).high - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).high - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
    if (zeros == 3 && dataType.equals("Low"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((dateList.get(nonZeros.get(0)).low)
        + (dateList.get(nonZeros.get(1)).low)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((dateList.get(nonZeros.get(0)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).low - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
    
    if (zeros == 2 && dataType.equals("Adjusted Close"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).adjusted_close
        + dateList.get(nonZeros.get(1)).adjusted_close
        + dateList.get(nonZeros.get(2)).adjusted_close) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (dateList.get(nonZeros.get(0)).adjusted_close < dateList.get(nonZeros.get(1)).adjusted_close)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (dateList.get(nonZeros.get(2)).adjusted_close > dateList.get(max).adjusted_close)
        stats[1] = Float.toString(dateList.get(max).adjusted_close);
      else if (dateList.get(nonZeros.get(2)).adjusted_close < dateList.get(min).adjusted_close)
        stats[1] = Float.toString(dateList.get(min).adjusted_close);
      else
        stats[1] = Float.toString(dateList.get(nonZeros.get(2)).adjusted_close);
      
      //calculate mode
      if (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        || dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(1)).ticker))
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).adjusted_close - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    //...continued for all dataTypes...
    
      
    if (zeros == 2 && dataType.equals("Volume"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).volume
        + dateList.get(nonZeros.get(1)).volume
        + dateList.get(nonZeros.get(2)).volume) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (dateList.get(nonZeros.get(0)).volume < dateList.get(nonZeros.get(1)).volume)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (dateList.get(nonZeros.get(2)).volume > dateList.get(max).volume)
        stats[1] = Float.toString(dateList.get(max).volume);
      else if (dateList.get(nonZeros.get(2)).volume < dateList.get(min).volume)
        stats[1] = Float.toString(dateList.get(min).volume);
      else
        stats[1] = Float.toString(dateList.get(nonZeros.get(2)).volume);
      
      //calculate mode
      if (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        || dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(1)).ticker))
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).volume - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
      if (zeros == 2 && dataType.equals("Open Price"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).open_price
        + dateList.get(nonZeros.get(1)).open_price
        + dateList.get(nonZeros.get(2)).open_price) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (dateList.get(nonZeros.get(0)).open_price < dateList.get(nonZeros.get(1)).open_price)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (dateList.get(nonZeros.get(2)).open_price > dateList.get(max).open_price)
        stats[1] = Float.toString(dateList.get(max).open_price);
      else if (dateList.get(nonZeros.get(2)).open_price < dateList.get(min).open_price)
        stats[1] = Float.toString(dateList.get(min).open_price);
      else
        stats[1] = Float.toString(dateList.get(nonZeros.get(2)).open_price);
      
      //calculate mode
      if (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        || dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(1)).ticker))
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).open_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
    if (zeros == 2 && dataType.equals("Closing Price"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).close_price
        + dateList.get(nonZeros.get(1)).close_price
        + dateList.get(nonZeros.get(2)).close_price) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (dateList.get(nonZeros.get(0)).close_price < dateList.get(nonZeros.get(1)).close_price)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (dateList.get(nonZeros.get(2)).close_price > dateList.get(max).close_price)
        stats[1] = Float.toString(dateList.get(max).close_price);
      else if (dateList.get(nonZeros.get(2)).close_price < dateList.get(min).close_price)
        stats[1] = Float.toString(dateList.get(min).close_price);
      else
        stats[1] = Float.toString(dateList.get(nonZeros.get(2)).close_price);
      
      //calculate mode
      if (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        || dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(1)).ticker))
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).close_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
      if (zeros == 2 && dataType.equals("High"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).high
        + dateList.get(nonZeros.get(1)).high
        + dateList.get(nonZeros.get(2)).high) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (dateList.get(nonZeros.get(0)).high < dateList.get(nonZeros.get(1)).high)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (dateList.get(nonZeros.get(2)).high > dateList.get(max).high)
        stats[1] = Float.toString(dateList.get(max).high);
      else if (dateList.get(nonZeros.get(2)).high < dateList.get(min).high)
        stats[1] = Float.toString(dateList.get(min).high);
      else
        stats[1] = Float.toString(dateList.get(nonZeros.get(2)).high);
      
      //calculate mode
      if (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        || dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(1)).ticker))
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).high - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).high - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).high - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
        if (zeros == 2 && dataType.equals("Low"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).low
        + dateList.get(nonZeros.get(1)).low
        + dateList.get(nonZeros.get(2)).low) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (dateList.get(nonZeros.get(0)).low < dateList.get(nonZeros.get(1)).low)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (dateList.get(nonZeros.get(2)).low > dateList.get(max).low)
        stats[1] = Float.toString(dateList.get(max).low);
      else if (dateList.get(nonZeros.get(2)).low < dateList.get(min).low)
        stats[1] = Float.toString(dateList.get(min).low);
      else
        stats[1] = Float.toString(dateList.get(nonZeros.get(2)).low);
      
      //calculate mode
      if (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        || dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(1)).ticker))
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).low - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
    if (zeros == 1 && dataType.equals("Adjusted Close"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).adjusted_close
        + dateList.get(nonZeros.get(1)).adjusted_close
        + dateList.get(nonZeros.get(2)).adjusted_close
        + dateList.get(nonZeros.get(3)).adjusted_close) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).adjusted_close,
        dateList.get(nonZeros.get(1)).adjusted_close,
        dateList.get(nonZeros.get(2)).adjusted_close,
        dateList.get(nonZeros.get(3)).adjusted_close
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).adjusted_close - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    //...continued for all dataTypes...
    
      if (zeros == 1 && dataType.equals("Volume"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).volume
        + dateList.get(nonZeros.get(1)).volume
        + dateList.get(nonZeros.get(2)).volume
        + dateList.get(nonZeros.get(3)).volume) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).volume,
        dateList.get(nonZeros.get(1)).volume,
        dateList.get(nonZeros.get(2)).volume,
        dateList.get(nonZeros.get(3)).volume
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).volume - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
      
      if (zeros == 1 && dataType.equals("Open Price"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).open_price
        + dateList.get(nonZeros.get(1)).open_price
        + dateList.get(nonZeros.get(2)).open_price
        + dateList.get(nonZeros.get(3)).open_price) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).open_price,
        dateList.get(nonZeros.get(1)).open_price,
        dateList.get(nonZeros.get(2)).open_price,
        dateList.get(nonZeros.get(3)).open_price
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).open_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 1 && dataType.equals("Closing Price"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).close_price
        + dateList.get(nonZeros.get(1)).close_price
        + dateList.get(nonZeros.get(2)).close_price
        + dateList.get(nonZeros.get(3)).close_price) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).close_price,
        dateList.get(nonZeros.get(1)).close_price,
        dateList.get(nonZeros.get(2)).close_price,
        dateList.get(nonZeros.get(3)).close_price
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).close_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 1 && dataType.equals("High"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).high
        + dateList.get(nonZeros.get(1)).high
        + dateList.get(nonZeros.get(2)).high
        + dateList.get(nonZeros.get(3)).high) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).high,
        dateList.get(nonZeros.get(1)).high,
        dateList.get(nonZeros.get(2)).high,
        dateList.get(nonZeros.get(3)).high
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).high - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).high - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).high - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).high - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 1 && dataType.equals("Low"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).low
        + dateList.get(nonZeros.get(1)).low
        + dateList.get(nonZeros.get(2)).low
        + dateList.get(nonZeros.get(3)).low) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).low,
        dateList.get(nonZeros.get(1)).low,
        dateList.get(nonZeros.get(2)).low,
        dateList.get(nonZeros.get(3)).low
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).low - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
    if (zeros == 0 && dataType.equals("Adjusted Close"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).adjusted_close
        + dateList.get(nonZeros.get(1)).adjusted_close
        + dateList.get(nonZeros.get(2)).adjusted_close
        + dateList.get(nonZeros.get(3)).adjusted_close
        + dateList.get(nonZeros.get(4)).adjusted_close) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).adjusted_close,
        dateList.get(nonZeros.get(1)).adjusted_close,
        dateList.get(nonZeros.get(2)).adjusted_close,
        dateList.get(nonZeros.get(3)).adjusted_close,
        dateList.get(nonZeros.get(4)).adjusted_close
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if ((dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).adjusted_close - mean), 2)
        + pow((dateList.get(nonZeros.get(4)).adjusted_close - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    //...continued for all dataTypes...
    
    if (zeros == 0 && dataType.equals("Volume"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).volume
        + dateList.get(nonZeros.get(1)).volume
        + dateList.get(nonZeros.get(2)).volume
        + dateList.get(nonZeros.get(3)).volume
        + dateList.get(nonZeros.get(4)).volume) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).volume,
        dateList.get(nonZeros.get(1)).volume,
        dateList.get(nonZeros.get(2)).volume,
        dateList.get(nonZeros.get(3)).volume,
        dateList.get(nonZeros.get(4)).volume
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if ((dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).volume - mean), 2)
        + pow((dateList.get(nonZeros.get(4)).volume - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 0 && dataType.equals("Open Price"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).open_price
        + dateList.get(nonZeros.get(1)).open_price
        + dateList.get(nonZeros.get(2)).open_price
        + dateList.get(nonZeros.get(3)).open_price
        + dateList.get(nonZeros.get(4)).open_price) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).open_price,
        dateList.get(nonZeros.get(1)).open_price,
        dateList.get(nonZeros.get(2)).open_price,
        dateList.get(nonZeros.get(3)).open_price,
        dateList.get(nonZeros.get(4)).open_price
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if ((dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).open_price - mean), 2)
        + pow((dateList.get(nonZeros.get(4)).open_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 0 && dataType.equals("Closing Price"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).close_price
        + dateList.get(nonZeros.get(1)).close_price
        + dateList.get(nonZeros.get(2)).close_price
        + dateList.get(nonZeros.get(3)).close_price
        + dateList.get(nonZeros.get(4)).close_price) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).close_price,
        dateList.get(nonZeros.get(1)).close_price,
        dateList.get(nonZeros.get(2)).close_price,
        dateList.get(nonZeros.get(3)).close_price,
        dateList.get(nonZeros.get(4)).close_price
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if ((dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).close_price - mean), 2)
        + pow((dateList.get(nonZeros.get(4)).close_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 0 && dataType.equals("High"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).high
        + dateList.get(nonZeros.get(1)).high
        + dateList.get(nonZeros.get(2)).high
        + dateList.get(nonZeros.get(3)).high
        + dateList.get(nonZeros.get(4)).high) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).high,
        dateList.get(nonZeros.get(1)).high,
        dateList.get(nonZeros.get(2)).high,
        dateList.get(nonZeros.get(3)).high,
        dateList.get(nonZeros.get(4)).high
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if ((dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).high - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).high - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).high- mean), 2)
        + pow((dateList.get(nonZeros.get(3)).high - mean), 2)
        + pow((dateList.get(nonZeros.get(4)).high - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
    if (zeros == 0 && dataType.equals("Low"))
    {
      //calculate mean
      float mean = (dateList.get(nonZeros.get(0)).low
        + dateList.get(nonZeros.get(1)).low
        + dateList.get(nonZeros.get(2)).low
        + dateList.get(nonZeros.get(3)).low
        + dateList.get(nonZeros.get(4)).low) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        dateList.get(nonZeros.get(0)).low,
        dateList.get(nonZeros.get(1)).low,
        dateList.get(nonZeros.get(2)).low,
        dateList.get(nonZeros.get(3)).low,
        dateList.get(nonZeros.get(4)).low
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(1)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(0)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(0)).ticker;
      }
      else if ((dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(2)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
        || (dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(1)).ticker.equals(dateList.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = dateList.get(nonZeros.get(1)).ticker;
      }
      else if (dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(3)).ticker)
        && dateList.get(nonZeros.get(2)).ticker.equals(dateList.get(nonZeros.get(4)).ticker))
      {
        stats[2] = dateList.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((dateList.get(nonZeros.get(0)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(1)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(2)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(3)).low - mean), 2)
        + pow((dateList.get(nonZeros.get(4)).low - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
  }
  else
  {
    if (zeros == 4 && dataType.equals("Adjusted Close"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(DataPoints.get(nonZeros.get(0)).adjusted_close);
      stats[1] = stats[0];
      stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      return stats;
    }
    //...continued for all dataTypes...
    
    if (zeros == 4 && dataType.equals("Volume"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(DataPoints.get(nonZeros.get(0)).volume);
      stats[1] = stats[0];
      stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      return stats;
    }
    
    if (zeros == 4 && dataType.equals("Open Price"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(DataPoints.get(nonZeros.get(0)).open_price);
      stats[1] = stats[0];
      stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      return stats;
    }
    if (zeros == 4 && dataType.equals("Closing Price"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(DataPoints.get(nonZeros.get(0)).close_price);
      stats[1] = stats[0];
      stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      return stats;
    }
    
    if (zeros == 4 && dataType.equals("High"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(DataPoints.get(nonZeros.get(0)).high);
      stats[1] = stats[0];
      stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      return stats;
    }
    
    if (zeros == 4 && dataType.equals("Low"))
    {
      //mean, median and mode = the only data value, standDev = 0
      stats[0] = Float.toString(DataPoints.get(nonZeros.get(0)).low);
      stats[1] = stats[0];
      stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      return stats;
    }
    
    if (zeros == 3 && dataType.equals("Adjusted Close"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((DataPoints.get(nonZeros.get(0)).adjusted_close)
        + (DataPoints.get(nonZeros.get(1)).adjusted_close)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((DataPoints.get(nonZeros.get(0)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).adjusted_close - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    //...continued for all dataTypes...
    
    if (zeros == 3 && dataType.equals("Volume"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((DataPoints.get(nonZeros.get(0)).volume)
        + (DataPoints.get(nonZeros.get(1)).volume)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((DataPoints.get(nonZeros.get(0)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).volume - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
    if (zeros == 3 && dataType.equals("Open Price"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((DataPoints.get(nonZeros.get(0)).open_price)
        + (DataPoints.get(nonZeros.get(1)).open_price)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((DataPoints.get(nonZeros.get(0)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).open_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
      if (zeros == 3 && dataType.equals("Closing Price"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((DataPoints.get(nonZeros.get(0)).close_price)
        + (DataPoints.get(nonZeros.get(1)).close_price)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((DataPoints.get(nonZeros.get(0)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).close_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
    if (zeros == 3 && dataType.equals("High"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((DataPoints.get(nonZeros.get(0)).high)
        + (DataPoints.get(nonZeros.get(1)).high)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((DataPoints.get(nonZeros.get(0)).high - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).high - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
    if (zeros == 3 && dataType.equals("Low"))
    {
      //mean = median, there is no mode, standDev is calculated as per usual
      float mean = ((DataPoints.get(nonZeros.get(0)).low)
        + (DataPoints.get(nonZeros.get(1)).low)) / 2;
      stats[0] = Float.toString(mean);
      stats[1] = Float.toString(mean);
      float variance = pow((DataPoints.get(nonZeros.get(0)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).low - mean), 2);
      stats[3] = Float.toString(sqrt(variance));//SD = square root of( (x1-mean)^2 + (x2-mean)^2 )
      return stats;
    }
    
    
    if (zeros == 2 && dataType.equals("Adjusted Close"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).adjusted_close
        + DataPoints.get(nonZeros.get(1)).adjusted_close
        + DataPoints.get(nonZeros.get(2)).adjusted_close) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (DataPoints.get(nonZeros.get(0)).adjusted_close < DataPoints.get(nonZeros.get(1)).adjusted_close)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (DataPoints.get(nonZeros.get(2)).adjusted_close > DataPoints.get(max).adjusted_close)
        stats[1] = Float.toString(DataPoints.get(max).adjusted_close);
      else if (DataPoints.get(nonZeros.get(2)).adjusted_close < DataPoints.get(min).adjusted_close)
        stats[1] = Float.toString(DataPoints.get(min).adjusted_close);
      else
        stats[1] = Float.toString(DataPoints.get(nonZeros.get(2)).adjusted_close);
      
      //calculate mode
      if (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        || DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker))
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).adjusted_close - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    //...continued for all dataTypes...
    
      
    if (zeros == 2 && dataType.equals("Volume"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).volume
        + DataPoints.get(nonZeros.get(1)).volume
        + DataPoints.get(nonZeros.get(2)).volume) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (DataPoints.get(nonZeros.get(0)).volume < DataPoints.get(nonZeros.get(1)).volume)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (DataPoints.get(nonZeros.get(2)).volume > DataPoints.get(max).volume)
        stats[1] = Float.toString(DataPoints.get(max).volume);
      else if (DataPoints.get(nonZeros.get(2)).volume < DataPoints.get(min).volume)
        stats[1] = Float.toString(DataPoints.get(min).volume);
      else
        stats[1] = Float.toString(DataPoints.get(nonZeros.get(2)).volume);
      
      //calculate mode
      if (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        || DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker))
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).volume - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
      if (zeros == 2 && dataType.equals("Open Price"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).open_price
        + DataPoints.get(nonZeros.get(1)).open_price
        + DataPoints.get(nonZeros.get(2)).open_price) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (DataPoints.get(nonZeros.get(0)).open_price < DataPoints.get(nonZeros.get(1)).open_price)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (DataPoints.get(nonZeros.get(2)).open_price > DataPoints.get(max).open_price)
        stats[1] = Float.toString(DataPoints.get(max).open_price);
      else if (DataPoints.get(nonZeros.get(2)).open_price < DataPoints.get(min).open_price)
        stats[1] = Float.toString(DataPoints.get(min).open_price);
      else
        stats[1] = Float.toString(DataPoints.get(nonZeros.get(2)).open_price);
      
      //calculate mode
      if (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        || DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker))
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).open_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
    if (zeros == 2 && dataType.equals("Closing Price"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).close_price
        + DataPoints.get(nonZeros.get(1)).close_price
        + DataPoints.get(nonZeros.get(2)).close_price) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (DataPoints.get(nonZeros.get(0)).close_price < DataPoints.get(nonZeros.get(1)).close_price)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (DataPoints.get(nonZeros.get(2)).close_price > DataPoints.get(max).close_price)
        stats[1] = Float.toString(DataPoints.get(max).close_price);
      else if (DataPoints.get(nonZeros.get(2)).close_price < DataPoints.get(min).close_price)
        stats[1] = Float.toString(DataPoints.get(min).close_price);
      else
        stats[1] = Float.toString(DataPoints.get(nonZeros.get(2)).close_price);
      
      //calculate mode
      if (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        || DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker))
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).close_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
      if (zeros == 2 && dataType.equals("High"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).high
        + DataPoints.get(nonZeros.get(1)).high
        + DataPoints.get(nonZeros.get(2)).high) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (DataPoints.get(nonZeros.get(0)).high < DataPoints.get(nonZeros.get(1)).high)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (DataPoints.get(nonZeros.get(2)).high > DataPoints.get(max).high)
        stats[1] = Float.toString(DataPoints.get(max).high);
      else if (DataPoints.get(nonZeros.get(2)).high < DataPoints.get(min).high)
        stats[1] = Float.toString(DataPoints.get(min).high);
      else
        stats[1] = Float.toString(DataPoints.get(nonZeros.get(2)).high);
      
      //calculate mode
      if (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        || DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker))
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).high - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).high - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).high - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
        if (zeros == 2 && dataType.equals("Low"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).low
        + DataPoints.get(nonZeros.get(1)).low
        + DataPoints.get(nonZeros.get(2)).low) / 3;
      stats[0] = Float.toString(mean);
      
      //calculate median (without sorting)
      int max = nonZeros.get(0);
      int min = nonZeros.get(1);
      if (DataPoints.get(nonZeros.get(0)).low < DataPoints.get(nonZeros.get(1)).low)
      {
        min = nonZeros.get(0);
        max = nonZeros.get(1);
      }
      if (DataPoints.get(nonZeros.get(2)).low > DataPoints.get(max).low)
        stats[1] = Float.toString(DataPoints.get(max).low);
      else if (DataPoints.get(nonZeros.get(2)).low < DataPoints.get(min).low)
        stats[1] = Float.toString(DataPoints.get(min).low);
      else
        stats[1] = Float.toString(DataPoints.get(nonZeros.get(2)).low);
      
      //calculate mode
      if (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        || DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker))
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).low - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
    if (zeros == 1 && dataType.equals("Adjusted Close"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).adjusted_close
        + DataPoints.get(nonZeros.get(1)).adjusted_close
        + DataPoints.get(nonZeros.get(2)).adjusted_close
        + DataPoints.get(nonZeros.get(3)).adjusted_close) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).adjusted_close,
        DataPoints.get(nonZeros.get(1)).adjusted_close,
        DataPoints.get(nonZeros.get(2)).adjusted_close,
        DataPoints.get(nonZeros.get(3)).adjusted_close
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).adjusted_close - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    //...continued for all dataTypes...
    
      if (zeros == 1 && dataType.equals("Volume"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).volume
        + DataPoints.get(nonZeros.get(1)).volume
        + DataPoints.get(nonZeros.get(2)).volume
        + DataPoints.get(nonZeros.get(3)).volume) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).volume,
        DataPoints.get(nonZeros.get(1)).volume,
        DataPoints.get(nonZeros.get(2)).volume,
        DataPoints.get(nonZeros.get(3)).volume
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).volume - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
      
      if (zeros == 1 && dataType.equals("Open Price"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).open_price
        + DataPoints.get(nonZeros.get(1)).open_price
        + DataPoints.get(nonZeros.get(2)).open_price
        + DataPoints.get(nonZeros.get(3)).open_price) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).open_price,
        DataPoints.get(nonZeros.get(1)).open_price,
        DataPoints.get(nonZeros.get(2)).open_price,
        DataPoints.get(nonZeros.get(3)).open_price
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).open_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 1 && dataType.equals("Closing Price"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).close_price
        + DataPoints.get(nonZeros.get(1)).close_price
        + DataPoints.get(nonZeros.get(2)).close_price
        + DataPoints.get(nonZeros.get(3)).close_price) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).close_price,
        DataPoints.get(nonZeros.get(1)).close_price,
        DataPoints.get(nonZeros.get(2)).close_price,
        DataPoints.get(nonZeros.get(3)).close_price
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).close_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 1 && dataType.equals("High"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).high
        + DataPoints.get(nonZeros.get(1)).high
        + DataPoints.get(nonZeros.get(2)).high
        + DataPoints.get(nonZeros.get(3)).high) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).high,
        DataPoints.get(nonZeros.get(1)).high,
        DataPoints.get(nonZeros.get(2)).high,
        DataPoints.get(nonZeros.get(3)).high
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).high - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).high - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).high - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).high - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 1 && dataType.equals("Low"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).low
        + DataPoints.get(nonZeros.get(1)).low
        + DataPoints.get(nonZeros.get(2)).low
        + DataPoints.get(nonZeros.get(3)).low) / 4;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).low,
        DataPoints.get(nonZeros.get(1)).low,
        DataPoints.get(nonZeros.get(2)).low,
        DataPoints.get(nonZeros.get(3)).low
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString((sortedData[1] + sortedData[2]) / 2);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).low - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
    if (zeros == 0 && dataType.equals("Adjusted Close"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).adjusted_close
        + DataPoints.get(nonZeros.get(1)).adjusted_close
        + DataPoints.get(nonZeros.get(2)).adjusted_close
        + DataPoints.get(nonZeros.get(3)).adjusted_close
        + DataPoints.get(nonZeros.get(4)).adjusted_close) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).adjusted_close,
        DataPoints.get(nonZeros.get(1)).adjusted_close,
        DataPoints.get(nonZeros.get(2)).adjusted_close,
        DataPoints.get(nonZeros.get(3)).adjusted_close,
        DataPoints.get(nonZeros.get(4)).adjusted_close
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if ((DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).adjusted_close - mean), 2)
        + pow((DataPoints.get(nonZeros.get(4)).adjusted_close - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    //...continued for all dataTypes...
    
    if (zeros == 0 && dataType.equals("Volume"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).volume
        + DataPoints.get(nonZeros.get(1)).volume
        + DataPoints.get(nonZeros.get(2)).volume
        + DataPoints.get(nonZeros.get(3)).volume
        + DataPoints.get(nonZeros.get(4)).volume) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).volume,
        DataPoints.get(nonZeros.get(1)).volume,
        DataPoints.get(nonZeros.get(2)).volume,
        DataPoints.get(nonZeros.get(3)).volume,
        DataPoints.get(nonZeros.get(4)).volume
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if ((DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).volume - mean), 2)
        + pow((DataPoints.get(nonZeros.get(4)).volume - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 0 && dataType.equals("Open Price"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).open_price
        + DataPoints.get(nonZeros.get(1)).open_price
        + DataPoints.get(nonZeros.get(2)).open_price
        + DataPoints.get(nonZeros.get(3)).open_price
        + DataPoints.get(nonZeros.get(4)).open_price) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).open_price,
        DataPoints.get(nonZeros.get(1)).open_price,
        DataPoints.get(nonZeros.get(2)).open_price,
        DataPoints.get(nonZeros.get(3)).open_price,
        DataPoints.get(nonZeros.get(4)).open_price
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if ((DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).open_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(4)).open_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 0 && dataType.equals("Closing Price"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).close_price
        + DataPoints.get(nonZeros.get(1)).close_price
        + DataPoints.get(nonZeros.get(2)).close_price
        + DataPoints.get(nonZeros.get(3)).close_price
        + DataPoints.get(nonZeros.get(4)).close_price) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).close_price,
        DataPoints.get(nonZeros.get(1)).close_price,
        DataPoints.get(nonZeros.get(2)).close_price,
        DataPoints.get(nonZeros.get(3)).close_price,
        DataPoints.get(nonZeros.get(4)).close_price
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if ((DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).close_price - mean), 2)
        + pow((DataPoints.get(nonZeros.get(4)).close_price - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
     if (zeros == 0 && dataType.equals("High"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).high
        + DataPoints.get(nonZeros.get(1)).high
        + DataPoints.get(nonZeros.get(2)).high
        + DataPoints.get(nonZeros.get(3)).high
        + DataPoints.get(nonZeros.get(4)).high) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).high,
        DataPoints.get(nonZeros.get(1)).high,
        DataPoints.get(nonZeros.get(2)).high,
        DataPoints.get(nonZeros.get(3)).high,
        DataPoints.get(nonZeros.get(4)).high
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if ((DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).high - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).high - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).high- mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).high - mean), 2)
        + pow((DataPoints.get(nonZeros.get(4)).high - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
    
    if (zeros == 0 && dataType.equals("Low"))
    {
      //calculate mean
      float mean = (DataPoints.get(nonZeros.get(0)).low
        + DataPoints.get(nonZeros.get(1)).low
        + DataPoints.get(nonZeros.get(2)).low
        + DataPoints.get(nonZeros.get(3)).low
        + DataPoints.get(nonZeros.get(4)).low) / 5;
      stats[0] = Float.toString(mean);
      
      // calculate median (with sorting)
      float[] sortedData = new float[] 
      {
        DataPoints.get(nonZeros.get(0)).low,
        DataPoints.get(nonZeros.get(1)).low,
        DataPoints.get(nonZeros.get(2)).low,
        DataPoints.get(nonZeros.get(3)).low,
        DataPoints.get(nonZeros.get(4)).low
      };
      Arrays.sort(sortedData);
      stats[1] = Float.toString(sortedData[2]);
      
      //calculate mode
      if ((DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(1)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(0)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(0)).ticker;
      }
      else if ((DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(2)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
        || (DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(1)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker)))
      {
        stats[2] = DataPoints.get(nonZeros.get(1)).ticker;
      }
      else if (DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(3)).ticker)
        && DataPoints.get(nonZeros.get(2)).ticker.equals(DataPoints.get(nonZeros.get(4)).ticker))
      {
        stats[2] = DataPoints.get(nonZeros.get(2)).ticker;
      }
      
      // calculate SD = sqrt of( (x1-mean)^2 + (x2-mean)^2 + ... + (xn-mean)^2 )
      float variance = pow((DataPoints.get(nonZeros.get(0)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(1)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(2)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(3)).low - mean), 2)
        + pow((DataPoints.get(nonZeros.get(4)).low - mean), 2);
      stats[3] = Float.toString(sqrt(variance));
      
      return stats;
    }
  }
  return null; //error flag
}
