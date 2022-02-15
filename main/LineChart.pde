//Added to by Aislinn Smyth 30/03/2020
//Added to by Jiss Joseph on 22/0/2020
//Added to be Michael Makarenko on 23/04/2020
// coded similarly as to Graph class as to ensure that we can co ordinate line charts with charts.
public class LineChart 
{
  //we initialise all the variables in the class and then they are passed into a constructor
  int ypos;
  int xpos;
  int line1, line2 = 0, line3 = 0, line4 = 0, line5 = 0;
  String dataType;
  color wordColour;
  color lineColour;
  float radius;
 ArrayList<Integer> colorList = new ArrayList();
  // dataArray = data to be passed through
  private int[] dataArray;
  private int width;  private int height ;private int maxValue;private int spacing;private int ratio; 
  private int lastSelected = -1;
  private boolean sliding = false;
  private int slidingRemainder;
// default constructor for a null/empty graph
  LineChart()
  {
    this.dataType = null;
  }
// main constructor
  LineChart(int xpos, int ypos, int line1, int line2, int line3, int line4, int line5, 
    String dataType, color lineColour, color wordColour, float radius)
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
    this.lineColour = lineColour;
    this.radius = radius;
  }

// draw method draws the line chart manually, it draws two lines a vertical and a horizontal line beside the graph, it then draws individual points using the code ellipse
  void draw() {

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
 
      // code for if someone asks for the volume graphs:
      if (dataType.equals("Volume")) 
      {
        float Volume1,Volume2,Volume3,Volume4,Volume5;
        int maxVolume;
        if (dateList != null)
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
  
          //converting all the data into a variable float as it is easier to code and meets the requirements of ellipse.
          Volume1 = (-float(dateList.get(line1).volume) / maxVolume * GRAPH_HEIGHT);
          Volume2 = (-float(dateList.get(line2).volume) / maxVolume * GRAPH_HEIGHT); 
          Volume3 = (-float(dateList.get(line3).volume) / maxVolume * GRAPH_HEIGHT);
          Volume4 = (-float(dateList.get(line4).volume) / maxVolume * GRAPH_HEIGHT);
          Volume5 = (-float(dateList.get(line5).volume) / maxVolume * GRAPH_HEIGHT);
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
  
          //converting all the data into a variable float as it is easier to code and meets the requirements of ellipse.
          Volume1 = (-float(DataPoints.get(line1).volume) / maxVolume * GRAPH_HEIGHT);
          Volume2 = (-float(DataPoints.get(line2).volume) / maxVolume * GRAPH_HEIGHT); 
          Volume3 = (-float(DataPoints.get(line3).volume) / maxVolume * GRAPH_HEIGHT);
          Volume4 = (-float(DataPoints.get(line4).volume) / maxVolume * GRAPH_HEIGHT);
          Volume5 = (-float(DataPoints.get(line5).volume) / maxVolume * GRAPH_HEIGHT);
        }

        // drawing the circles at certain instances, the radius is the width and height the circle will be, we add a number to the xpos each time so they are evenly distributed
        ellipse(xpos+20, ypos + Volume1, radius, radius);
        ellipse(110+xpos, ypos + Volume2, radius, radius); 
        ellipse(200+xpos, ypos + Volume3, radius, radius); 
        ellipse(290+xpos, ypos + Volume4, radius, radius);
        ellipse(380+xpos, ypos + Volume5, radius, radius);
       
        //drawing the individual lines which will match each point together.
        stroke(lineColour);
        line(xpos+20, ypos+ Volume1, 110+xpos, ypos + Volume2);
        line(110+xpos, ypos + Volume2, 200+xpos, ypos +Volume3);
        line(200+xpos, ypos + Volume3, 290+xpos, ypos + Volume4);
        line(290+xpos, ypos+ Volume4, 380+xpos, ypos + Volume5);
      }
      //code if asked for the Opening Price graphs
      if (dataType.equals("Open Price"))
      {
        float openPrice1,openPrice2,openPrice3,openPrice4,openPrice5;
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
  
          openPrice1 =(-dateList.get(line1).open_price / maxOP * GRAPH_HEIGHT); 
          openPrice2 = (-dateList.get(line2).open_price / maxOP * GRAPH_HEIGHT);
          openPrice3 = (-dateList.get(line3).open_price / maxOP * GRAPH_HEIGHT);
          openPrice4 = (-dateList.get(line4).open_price / maxOP * GRAPH_HEIGHT);
          openPrice5 = (-dateList.get(line5).open_price / maxOP * GRAPH_HEIGHT);
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
  
          openPrice1 =(-DataPoints.get(line1).open_price / maxOP * GRAPH_HEIGHT); 
          openPrice2 = (-DataPoints.get(line2).open_price / maxOP * GRAPH_HEIGHT);
          openPrice3 = (-DataPoints.get(line3).open_price / maxOP * GRAPH_HEIGHT);
          openPrice4 = (-DataPoints.get(line4).open_price / maxOP * GRAPH_HEIGHT);
          openPrice5 = (-DataPoints.get(line5).open_price / maxOP * GRAPH_HEIGHT);
        }

        ellipse(20+xpos, ypos + openPrice1, radius, radius); 
        ellipse(110+xpos, ypos + openPrice2, radius, radius);
        ellipse(200+xpos, ypos + openPrice3, radius, radius);
        ellipse(290+xpos, ypos + openPrice4, radius, radius);
        ellipse(380+xpos, ypos + openPrice5, radius, radius);
        
        stroke(lineColour);
        line(20+xpos, ypos + openPrice1, 110 + xpos, ypos + openPrice2);
        line(110 + xpos, ypos + openPrice2, 200 + xpos, ypos + openPrice3);
        line(200 + xpos, ypos + openPrice3, 290+xpos, ypos + openPrice4);
        line(290+xpos, ypos + openPrice4, 380+xpos, ypos + openPrice5);
       
      }
      //code for the closing price graphs:
      if (dataType.equals("Closing Price"))
      {
        float closingPrice1,closingPrice2,closingPrice3,closingPrice4,closingPrice5;
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
  
          closingPrice1 = (-dateList.get(line1).close_price / maxCP * GRAPH_HEIGHT); 
          closingPrice2 = (-dateList.get(line2).close_price / maxCP * GRAPH_HEIGHT);
          closingPrice3 = (-dateList.get(line3).close_price / maxCP * GRAPH_HEIGHT);
          closingPrice4 = (-dateList.get(line4).close_price / maxCP * GRAPH_HEIGHT);
          closingPrice5 = (-dateList.get(line5).close_price / maxCP * GRAPH_HEIGHT);
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
  
          closingPrice1 = (-DataPoints.get(line1).close_price / maxCP * GRAPH_HEIGHT); 
          closingPrice2 = (-DataPoints.get(line2).close_price / maxCP * GRAPH_HEIGHT);
          closingPrice3 = (-DataPoints.get(line3).close_price / maxCP * GRAPH_HEIGHT);
          closingPrice4 = (-DataPoints.get(line4).close_price / maxCP * GRAPH_HEIGHT);
          closingPrice5 = (-DataPoints.get(line5).close_price / maxCP * GRAPH_HEIGHT);
        }

        ellipse(20+xpos, ypos + closingPrice1, radius, radius);  
        ellipse(110+xpos, ypos + closingPrice2, radius, radius);   
        ellipse(200+xpos, ypos + closingPrice3, radius, radius);
        ellipse(290+xpos, ypos + closingPrice4, radius, radius);
        ellipse(380+xpos, ypos + closingPrice5, radius, radius);
        
        stroke(lineColour);
        line(20+xpos, ypos + closingPrice1, 110+xpos, ypos + closingPrice2);
        line(110+xpos, ypos + closingPrice2, 200+xpos, ypos + closingPrice3);
        line(200+xpos, ypos + closingPrice3, 290+xpos, ypos + closingPrice4);
        line(290+xpos, ypos + closingPrice4, 380+xpos, ypos + closingPrice5);
      }
      //code for the low graphs:
      if (dataType.equals("Low"))
      {
        float low1,low2,low3,low4,low5;
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
  
          low1 = (-dateList.get(line1).low / maxLow * GRAPH_HEIGHT);  
          low2 = (-dateList.get(line2).low / maxLow * GRAPH_HEIGHT); 
          low3 =  (-dateList.get(line3).low / maxLow * GRAPH_HEIGHT);
          low4 = (-dateList.get(line4).low / maxLow * GRAPH_HEIGHT);
          low5 =(-dateList.get(line5).low / maxLow * GRAPH_HEIGHT);
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
  
          low1 = (-DataPoints.get(line1).low / maxLow * GRAPH_HEIGHT);  
          low2 = (-DataPoints.get(line2).low / maxLow * GRAPH_HEIGHT); 
          low3 =  (-DataPoints.get(line3).low / maxLow * GRAPH_HEIGHT);
          low4 = (-DataPoints.get(line4).low / maxLow * GRAPH_HEIGHT);
          low5 =(-DataPoints.get(line5).low / maxLow * GRAPH_HEIGHT);
        }

        ellipse(20+xpos, ypos + low1, radius, radius);  
        ellipse(110+xpos, ypos + low2, radius, radius);
        ellipse(200+xpos, ypos + low3, radius, radius);
        ellipse(290+xpos, ypos + low4, radius, radius);
        ellipse(380+xpos, ypos + low5, radius, radius);
        
        stroke(lineColour);
        line(20+xpos, ypos + low1, 110+xpos, ypos + low2);
        line(110+xpos, ypos + low2, 200+xpos, ypos + low3);
        line(200+xpos, ypos + low3, 290+xpos, ypos + low4);
        line(290+xpos, ypos + low4, 380+xpos, ypos + low5);
        
      }
      
      //code for the high graphs:
      if (dataType.equals("High"))
      {
        float high1,high2,high3,high4,high5;
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
  
          high1 = (-dateList.get(line1).high / maxHigh * GRAPH_HEIGHT); 
          high2 = (-dateList.get(line2).high / maxHigh * GRAPH_HEIGHT); 
          high3 = (-dateList.get(line3).high / maxHigh * GRAPH_HEIGHT);
          high4 = (-dateList.get(line4).high / maxHigh * GRAPH_HEIGHT);
          high5 = (-dateList.get(line5).high / maxHigh * GRAPH_HEIGHT);
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
  
          high1 = (-DataPoints.get(line1).high / maxHigh * GRAPH_HEIGHT); 
          high2 = (-DataPoints.get(line2).high / maxHigh * GRAPH_HEIGHT); 
          high3 = (-DataPoints.get(line3).high / maxHigh * GRAPH_HEIGHT);
          high4 = (-DataPoints.get(line4).high / maxHigh * GRAPH_HEIGHT);
          high5 = (-DataPoints.get(line5).high / maxHigh * GRAPH_HEIGHT);
        }

        ellipse(20+xpos, ypos + high1, radius, radius);
        ellipse(110+xpos, ypos + high2, radius, radius); 
        ellipse(200+xpos, ypos + high3, radius, radius);
        ellipse(290+xpos, ypos + high4, radius, radius);
        ellipse(380+xpos, ypos + high5, radius, radius);
        
        stroke(lineColour);
        line(20+xpos, ypos + high1, 110+xpos, ypos + high2);
        line(110+xpos, ypos + high2, 200+xpos, ypos + high3);
        line(200+xpos, ypos + high3, 290+xpos, ypos + high4);
        line(290+xpos, ypos + high4, 380+xpos, ypos + high5);
      }
    //code for the adjusted close graphs:
      if (dataType.equals("Adjusted Close"))
      {
        float adjustedClose1,adjustedClose2,adjustedClose3,adjustedClose4,adjustedClose5;
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
  
          adjustedClose1 = (-dateList.get(line1).adjusted_close / maxAC * GRAPH_HEIGHT);
          adjustedClose2 = (-dateList.get(line2).adjusted_close / maxAC * GRAPH_HEIGHT);
          adjustedClose3 = (-dateList.get(line3).adjusted_close / maxAC * GRAPH_HEIGHT);
          adjustedClose4 = (-dateList.get(line4).adjusted_close / maxAC * GRAPH_HEIGHT);
          adjustedClose5 = (-dateList.get(line5).adjusted_close / maxAC * GRAPH_HEIGHT);
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
  
          adjustedClose1 = (-DataPoints.get(line1).adjusted_close / maxAC * GRAPH_HEIGHT);
          adjustedClose2 = (-DataPoints.get(line2).adjusted_close / maxAC * GRAPH_HEIGHT);
          adjustedClose3 = (-DataPoints.get(line3).adjusted_close / maxAC * GRAPH_HEIGHT);
          adjustedClose4 = (-DataPoints.get(line4).adjusted_close / maxAC * GRAPH_HEIGHT);
          adjustedClose5 = (-DataPoints.get(line5).adjusted_close / maxAC * GRAPH_HEIGHT);
        }

        ellipse(20+xpos, ypos + adjustedClose1, radius, radius);
        ellipse(110+xpos, ypos + adjustedClose2, radius, radius);
        ellipse(200+xpos, ypos + adjustedClose3, radius, radius);
        ellipse(290+xpos, ypos + adjustedClose4, radius, radius);
        ellipse(380+xpos, ypos + adjustedClose5, radius, radius);
        
        stroke(lineColour);
        line(20+xpos, ypos + adjustedClose1, 110+xpos, ypos + adjustedClose2);
        line(110+xpos, ypos + adjustedClose2, 200+xpos, ypos + adjustedClose3);
        line(200+xpos, ypos + adjustedClose3, 290+xpos, ypos + adjustedClose4);
        line(290+xpos, ypos + adjustedClose4, 380+xpos, ypos + adjustedClose5);
      }
    }
  }
     
  //draws the entire chart, first item on the left
  void drawChartVertical()
  {
    for (int i = 0; i < dataArray.length; i++)
    {
      colorMode(HSB, 340, 90, 100);
      fill((int)colorList.get(i), 23,120);
      rect(xpos+(i*spacing), ypos + (maxValue + dataArray[i]), spacing, dataArray[i], 25, 25, 0, 0);
      colorMode(RGB,255);
    }
    
  }
  
  // Draws function horizontally, first item on the bottom
  void drawChartHorizontal()
  {
    for (int i = 0; i < dataArray.length; i++)
    {
      colorMode(HSB, 340, 90, 100);
      fill((int)colorList.get(i), 23,130);
      rect( ypos,xpos+(i*spacing),dataArray[i]*ratio, spacing, 0, 25, 25, 0);
      colorMode(RGB,255);
    }
   
  }
  
  // Returns the sliding value, explained further in sliding method
  boolean isSliding()
  {
    return sliding;
  }
  void slide()
  {
    if (sliding == false)
    {
      slidingRemainder = ypos;
      sliding = true;
      ypos = ypos-(dataArray[0]*ratio);
    }
  }

//Sliding is the name given to when the graph page is first clicked on and the data is made to appear coming from the side. 
//The motion should be smoooth as we are trying to isolate the features before the graph is draw on screen - Jiss Joseph
  void sliding()
  {
  if((ypos < slidingRemainder)&&(sliding == true))
  {
    ypos+=20;
    println("sliding");
  }
  if((ypos > slidingRemainder)&&(sliding == true))
  {
    ypos-=1;
    println("sliding");
  }
  else if((ypos == slidingRemainder)&&(sliding == true))
  {
    sliding = false;
  }  
  }
  
}
