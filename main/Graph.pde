//class written by Aislinn Smyth 19/03/2020
//added to by Michael Makarenko 24/03/2020
//Added to by Michael Makarenko on 26/03/2020


//these are the  fixed distances to the border (position of graph) - Aislinn Smyth

public class Graph
{
  int ypos;
  int xpos;
  int line1, line2 = 0, line3 = 0, line4 = 0, line5 = 0;
  String dataType;
  color lineColour;
  color rectColour;
  color wordColour;

  //default constructor for null/empty graph - Michael Makarenko
  Graph()
  {
    this.dataType = null;
  }

  //main constructor - Aislinn Smyth and Michael Makarenko
  Graph(int xpos, int ypos, int line1, int line2, int line3, int line4, int line5, String dataType, 
    color lineColour, color rectColour, color wordColour)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.line1 = line1;
    this.line2 = line2;
    this.line3 = line3;
    this.line4 = line4;
    this.line5 = line5;
    this.dataType = dataType;
    this.lineColour = lineColour;
    this.rectColour = rectColour;
    this.wordColour = wordColour;
  }

  void draw()
  {
    //only draw a graph if correctly defined (not null/empty) - Michael Makarenko
    if (dataType != null)
    {
      //drawing the graph - Aislinn Smyth
      stroke(lineColour);
      line(xpos, ypos+10, xpos+(5*100), ypos+10); // horizontal line - Aislinn Smyth
      line(xpos, ypos+10, xpos, ypos-GRAPH_HEIGHT);  // vertical line - Aislinn Smyth
      
      fill(wordColour);
      text(dataType, xpos-130, ypos-100); //x-axis label
      if (dateList != null)
      {
        text(dateList.get(line1).ticker, xpos+10, ypos+50);  //y-axis labels
        text(dateList.get(line2).ticker, xpos+100, ypos+50);
        text(dateList.get(line3).ticker, xpos+190, ypos+50);
        text(dateList.get(line4).ticker, xpos+280, ypos+50);
        text(dateList.get(line5).ticker, xpos+370, ypos+50);
      }
      else
      {
        text(DataPoints.get(line1).ticker, xpos+10, ypos+50);  //y-axis labels
        text(DataPoints.get(line2).ticker, xpos+100, ypos+50);
        text(DataPoints.get(line3).ticker, xpos+190, ypos+50);
        text(DataPoints.get(line4).ticker, xpos+280, ypos+50);
        text(DataPoints.get(line5).ticker, xpos+370, ypos+50);
      }

      //actual rectangular bars, The DataPoints.get() is calling the position of the value in the arrayList - Aislinn Smyth
      stroke(0);
      fill(rectColour);

      //results for volume of each company - Michael Makarenko
      if (dataType.equals("Volume"))
      {
        int maxVolume;
        if (dateList!= null)
        {
          if (dateList.get(line1).volume > dateList.get(line2).volume)
            maxVolume = dateList.get(line1).volume;
          else
            maxVolume = dateList.get(line2).volume;
          if (dateList.get(line3).volume > maxVolume)
            maxVolume = dateList.get(line3).volume;
          if (dateList.get(line4).volume > maxVolume)
            maxVolume = dateList.get(line4).volume;
          if (dateList.get(line5).volume > maxVolume)
            maxVolume = dateList.get(line5).volume;
          rect (20+xpos, ypos, 30, (-float(dateList.get(line1).volume) / maxVolume) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-float(dateList.get(line2).volume) / maxVolume) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-float(dateList.get(line3).volume) / maxVolume) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-float(dateList.get(line4).volume) / maxVolume) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-float(dateList.get(line5).volume) / maxVolume) * GRAPH_HEIGHT);
        }
        else
        {
          if (DataPoints.get(line1).volume > DataPoints.get(line2).volume)
            maxVolume = DataPoints.get(line1).volume;
          else
            maxVolume = DataPoints.get(line2).volume;
          if (DataPoints.get(line3).volume > maxVolume)
            maxVolume = DataPoints.get(line3).volume;
          if (DataPoints.get(line4).volume > maxVolume)
            maxVolume = DataPoints.get(line4).volume;
          if (DataPoints.get(line5).volume > maxVolume)
            maxVolume = DataPoints.get(line5).volume;
          rect (20+xpos, ypos, 30, (-float(DataPoints.get(line1).volume) / maxVolume) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-float(DataPoints.get(line2).volume) / maxVolume) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-float(DataPoints.get(line3).volume) / maxVolume) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-float(DataPoints.get(line4).volume) / maxVolume) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-float(DataPoints.get(line5).volume) / maxVolume) * GRAPH_HEIGHT);
        }
      }
      //results for open_price of each company - Michael Makarenko and Aislinn Smyth
      if (dataType.equals("Open Price"))
      {
        float maxOP;
        if (dateList != null)
        {
          if (dateList.get(line1).open_price > dateList.get(line2).open_price)
            maxOP = dateList.get(line1).open_price;
          else
            maxOP = dateList.get(line2).open_price;
          if (dateList.get(line3).open_price > maxOP)
            maxOP = dateList.get(line3).open_price;
          if (dateList.get(line4).open_price > maxOP)
            maxOP = dateList.get(line4).open_price;
          if (dateList.get(line5).open_price > maxOP)
            maxOP = dateList.get(line5).open_price;
          rect (20+xpos, ypos, 30, (-dateList.get(line1).open_price / maxOP) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-dateList.get(line2).open_price / maxOP) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-dateList.get(line3).open_price / maxOP) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-dateList.get(line4).open_price / maxOP) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-dateList.get(line5).open_price / maxOP) * GRAPH_HEIGHT);
        }
        else
        {
          if (DataPoints.get(line1).open_price > DataPoints.get(line2).open_price)
            maxOP = DataPoints.get(line1).open_price;
          else
            maxOP = DataPoints.get(line2).open_price;
          if (DataPoints.get(line3).open_price > maxOP)
            maxOP = DataPoints.get(line3).open_price;
          if (DataPoints.get(line4).open_price > maxOP)
            maxOP = DataPoints.get(line4).open_price;
          if (DataPoints.get(line5).open_price > maxOP)
            maxOP = DataPoints.get(line5).open_price;
          rect (20+xpos, ypos, 30, (-DataPoints.get(line1).open_price / maxOP) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-DataPoints.get(line2).open_price / maxOP) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-DataPoints.get(line3).open_price / maxOP) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-DataPoints.get(line4).open_price / maxOP) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-DataPoints.get(line5).open_price / maxOP) * GRAPH_HEIGHT);
        }
      }
      //results for close_price of each company - Michael Makarenko and Aislinn Smyth
      if (dataType.equals("Closing Price"))
      {
        float maxCP;
        if (dateList != null)
        {
          if (dateList.get(line1).close_price > dateList.get(line2).close_price)
            maxCP = dateList.get(line1).close_price;
          else
            maxCP = dateList.get(line2).close_price;
          if (dateList.get(line3).close_price > maxCP)
            maxCP = dateList.get(line3).close_price;
          if (dateList.get(line4).close_price > maxCP)
            maxCP = dateList.get(line4).close_price;
          if (dateList.get(line5).close_price > maxCP)
            maxCP = dateList.get(line5).close_price;
          rect (20+xpos, ypos, 30, (-dateList.get(line1).close_price / maxCP) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-dateList.get(line2).close_price / maxCP) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-dateList.get(line3).close_price / maxCP) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-dateList.get(line4).close_price / maxCP) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-dateList.get(line5).close_price / maxCP) * GRAPH_HEIGHT);
        }
        else
        {
          if (DataPoints.get(line1).close_price > DataPoints.get(line2).close_price)
            maxCP = DataPoints.get(line1).close_price;
          else
            maxCP = DataPoints.get(line2).close_price;
          if (DataPoints.get(line3).close_price > maxCP)
            maxCP = DataPoints.get(line3).close_price;
          if (DataPoints.get(line4).close_price > maxCP)
            maxCP = DataPoints.get(line4).close_price;
          if (DataPoints.get(line5).close_price > maxCP)
            maxCP = DataPoints.get(line5).close_price;
          rect (20+xpos, ypos, 30, (-DataPoints.get(line1).close_price / maxCP) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-DataPoints.get(line2).close_price / maxCP) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-DataPoints.get(line3).close_price / maxCP) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-DataPoints.get(line4).close_price / maxCP) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-DataPoints.get(line5).close_price / maxCP) * GRAPH_HEIGHT);
        }
      }
      //results for low of each company - Michael Makarenko and Aislinn Smyth
      if (dataType.equals("Low"))
      {
        float maxLow;
        if (dateList != null)
        {
          if (dateList.get(line1).low > dateList.get(line2).low)
            maxLow = dateList.get(line1).low;
          else
            maxLow = dateList.get(line2).low;
          if (dateList.get(line3).low > maxLow)
            maxLow = dateList.get(line3).low;
          if (dateList.get(line4).low > maxLow)
            maxLow = dateList.get(line4).low;
          if (dateList.get(line5).low > maxLow)
            maxLow = dateList.get(line5).low;
          rect (20+xpos, ypos, 30, (-dateList.get(line1).low / maxLow) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-dateList.get(line2).low / maxLow) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-dateList.get(line3).low / maxLow) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-dateList.get(line4).low / maxLow) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-dateList.get(line5).low / maxLow) * GRAPH_HEIGHT);
        }
        else
        {
          if (DataPoints.get(line1).low > DataPoints.get(line2).low)
            maxLow = DataPoints.get(line1).low;
          else
            maxLow = DataPoints.get(line2).low;
          if (DataPoints.get(line3).low > maxLow)
            maxLow = DataPoints.get(line3).low;
          if (DataPoints.get(line4).low > maxLow)
            maxLow = DataPoints.get(line4).low;
          if (DataPoints.get(line5).low > maxLow)
            maxLow = DataPoints.get(line5).low;
          rect (20+xpos, ypos, 30, (-DataPoints.get(line1).low / maxLow) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-DataPoints.get(line2).low / maxLow) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-DataPoints.get(line3).low / maxLow) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-DataPoints.get(line4).low / maxLow) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-DataPoints.get(line5).low / maxLow) * GRAPH_HEIGHT);
        }
      }
      //results for high of each company - Michael Makarenko and Aislinn Smyth
      if (dataType.equals("High"))
      {
        float maxHigh;
        if (dateList != null)
        {
          if (dateList.get(line1).high > dateList.get(line2).high)
            maxHigh = dateList.get(line1).high;
          else
            maxHigh = dateList.get(line2).high;
          if (dateList.get(line3).high > maxHigh)
            maxHigh = dateList.get(line3).high;
          if (dateList.get(line4).high > maxHigh)
            maxHigh = dateList.get(line4).high;
          if (dateList.get(line5).high > maxHigh)
            maxHigh = dateList.get(line5).high;
          rect (20+xpos, ypos, 30, (-dateList.get(line1).high / maxHigh) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-dateList.get(line2).high / maxHigh) * GRAPH_HEIGHT); 
          rect (200+xpos, ypos, 30, (-dateList.get(line3).high / maxHigh) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-dateList.get(line4).high / maxHigh) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-dateList.get(line5).high / maxHigh) * GRAPH_HEIGHT);
        }
        else
        {
          if (DataPoints.get(line1).high > DataPoints.get(line2).high)
            maxHigh = DataPoints.get(line1).high;
          else
            maxHigh = DataPoints.get(line2).high;
          if (DataPoints.get(line3).high > maxHigh)
            maxHigh = DataPoints.get(line3).high;
          if (DataPoints.get(line4).high > maxHigh)
            maxHigh = DataPoints.get(line4).high;
          if (DataPoints.get(line5).high > maxHigh)
            maxHigh = DataPoints.get(line5).high;
          rect (20+xpos, ypos, 30, (-DataPoints.get(line1).high / maxHigh) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-DataPoints.get(line2).high / maxHigh) * GRAPH_HEIGHT); 
          rect (200+xpos, ypos, 30, (-DataPoints.get(line3).high / maxHigh) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-DataPoints.get(line4).high / maxHigh) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-DataPoints.get(line5).high / maxHigh) * GRAPH_HEIGHT);
        }
      }
      //results for adjusted_close for each company - Michael Makarenko and Aislinn Smyth
      if (dataType.equals("Adjusted Close"))
      {
        float maxAC;
        if (dateList != null)
        {
          if (dateList.get(line1).adjusted_close > dateList.get(line2).adjusted_close)
            maxAC = dateList.get(line1).adjusted_close;
          else
            maxAC = dateList.get(line2).adjusted_close;
          if (dateList.get(line3).adjusted_close > maxAC)
            maxAC = dateList.get(line3).adjusted_close;
          if (dateList.get(line4).adjusted_close > maxAC)
            maxAC = dateList.get(line4).adjusted_close;
          if (dateList.get(line5).adjusted_close > maxAC)
            maxAC = dateList.get(line5).adjusted_close;
          rect (20+xpos, ypos, 30, (-dateList.get(line1).adjusted_close / maxAC) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-dateList.get(line2).adjusted_close / maxAC) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-dateList.get(line3).adjusted_close / maxAC) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-dateList.get(line4).adjusted_close / maxAC) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-dateList.get(line5).adjusted_close / maxAC) * GRAPH_HEIGHT);
        }
        else
        {
          if (DataPoints.get(line1).adjusted_close > DataPoints.get(line2).adjusted_close)
            maxAC = DataPoints.get(line1).adjusted_close;
          else
            maxAC = DataPoints.get(line2).adjusted_close;
          if (DataPoints.get(line3).adjusted_close > maxAC)
            maxAC = DataPoints.get(line3).adjusted_close;
          if (DataPoints.get(line4).adjusted_close > maxAC)
            maxAC = DataPoints.get(line4).adjusted_close;
          if (DataPoints.get(line5).adjusted_close > maxAC)
            maxAC = DataPoints.get(line5).adjusted_close;
          rect (20+xpos, ypos, 30, (-DataPoints.get(line1).adjusted_close / maxAC) * GRAPH_HEIGHT);  
          rect (110+xpos, ypos, 30, (-DataPoints.get(line2).adjusted_close / maxAC) * GRAPH_HEIGHT);  
          rect (200+xpos, ypos, 30, (-DataPoints.get(line3).adjusted_close / maxAC) * GRAPH_HEIGHT);
          rect (290+xpos, ypos, 30, (-DataPoints.get(line4).adjusted_close / maxAC) * GRAPH_HEIGHT);
          rect (380+xpos, ypos, 30, (-DataPoints.get(line5).adjusted_close / maxAC) * GRAPH_HEIGHT);
        }
      }
    }
  }
}
