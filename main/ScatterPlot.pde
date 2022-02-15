//class created by Aislinn Smyth on 12/04/2020
//Added to by Michael Makarenko on 13/02/2020
//Added to by Aislinn Smyth on 20/04/2020
//Added to by Jiss Joseph on 21/04/2020
//Added to by Michael Makarenko on 22/04/2020
//Added to by Aislinn Smyth on 22/04/2020
//Added to by Jiss Joseph on 23/04/2020

public class ScatterPlot
{
  int xpos;
  int ypos;
  color lineColor;
  String dataType;
  color wordColor;
  int radius;
  private int maxValue;
  private int[] dataArray;

  ScatterPlot()
  {
    dataType = null;
  }

  ScatterPlot(int xpos, int ypos, color lineColor, color wordColor, int radius, String dataType)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.lineColor = lineColor;
    this.wordColor = wordColor;
    this.radius = radius;
    if (dataType != null)
    {
      this.dataType = dataType;
    }
    //default dataType is volume if parameter is null
    else
    {
      this.dataType = "Volume";
    }
  }

  void draw()
  {
    if (dataType != null && stockList != null)
    {
      if (stockList.size() > 9)
      {
        stroke(lineColor);
        line(xpos-700, ypos+300, xpos+(5*100), ypos+300);
        line(xpos-700, ypos+300, xpos-700, ypos-700);
        
         //the labels for the graph and the key, to find where to put the dots in accordance to the text look at the text directly under which says 10th% and look where the positions are - Aislinn Smyth
         
        fill(wordColor);
        text( "10th%", xpos-685, ypos+385);
        text( "20th%", xpos-575, ypos+385);
        text( "30th%", xpos-465, ypos+385);
        text( "40th%", xpos-355, ypos+385);
        text( "50th%", xpos-245, ypos+385);
        text( "60th%", xpos-135, ypos+385);
        text( "70th%", xpos-25, ypos+385);
        text( "80th%", xpos+85, ypos+385);
        text( "90th%", ypos+695, ypos+385);
        text( "100th%", ypos+805, ypos+385);
        
        text( "STOCK VALUES", xpos-1000, ypos-50);
        
                  
        text( "KEY: 10th% stand for the 10th percentile", xpos+469, ypos-469);
        text("of the values in stockList.csv", xpos+469, ypos-439);
  
        //for(int i = 0; i > stockList.size(); i++){
        // theres 4798 and we calculate percentile 10-100, this will give the position of the number at the 10th/20th/30th percentile in the arraylist.
        int sizeOfArraylist = stockList.size();
    
        //calculates the percentile of each in the arraylost or divided size - Aislinn Smyth
        float positionOne = sizeOfArraylist * 0.1;
        float positionTwo = sizeOfArraylist * 0.2;
        float positionThree = sizeOfArraylist * 0.3;
        float positionFour = sizeOfArraylist * 0.4;
        float positionFive = sizeOfArraylist * 0.5;
        float positionSix = sizeOfArraylist * 0.6;
        float positionSeven = sizeOfArraylist * 0.7;
        float positionEight = sizeOfArraylist * 0.8;
        float positionNine =sizeOfArraylist * 0.9;
        float positionTen = sizeOfArraylist - 1;
  
        
        int position1 = int (positionOne);
        int position2 = int (positionTwo);
        int position3 = int (positionThree);
        int position4 = int (positionFour);
        int position5 = int (positionFive);
        int position6 = int (positionSix);
        int position7 = int (positionSeven);
        int position8 = int (positionEight);
        int position9 = int (positionNine);
        int position10 = int (positionTen);
  
        //// By putting the position of the number in the position of the arraylist the value at that position is stored in valueOne/valueTwo...
        // Plotting points on the graph for each dataType, High, Low, Adjusted Close, Volume, Opening Price, Closing Price. - Aislinn Smyth
        if (dataType.equals("Volume"))
        {
          int valueOnee = stockList.get(position1).volume;
          int valueTwoo = stockList.get(position2).volume;
          int valueThreee = stockList.get(position3).volume;
          int valueFourr = stockList.get(position4).volume;
          int valueFivee = stockList.get(position5).volume;
          int valueSixx = stockList.get(position6).volume;
          int valueSevenn = stockList.get(position7).volume;
          int valueEightt = stockList.get(position8).volume;
          int valueNinee = stockList.get(position9).volume;
          int valueTenn = stockList.get(position10).volume;
         
         //Plotting to scale - Oluwatumininu Ogunbadejo  
          float valueOne = -float(valueOnee) / GRAPH_SCALE;
          float valueTwo = -float(valueTwoo) / GRAPH_SCALE;
          float valueThree = -float(valueThreee) / GRAPH_SCALE;
          float valueFour = -float(valueFourr) / GRAPH_SCALE;
          float valueFive = -float(valueFivee) / GRAPH_SCALE;
          float valueSix = -float(valueSixx) / GRAPH_SCALE;
          float valueSeven = -float(valueSevenn) / GRAPH_SCALE;
          float valueEight = -float(valueEightt) / GRAPH_SCALE;
          float valueNine = -float(valueNinee) / GRAPH_SCALE;
          float valueTen = -float(valueTenn) / GRAPH_SCALE;
    
        //This draws the circles  - Aislinn Smyth
          fill(0, 150, 100);
          ellipse(xpos-670, ypos + valueOne, radius, radius);
          ellipse(xpos-560, ypos + valueTwo, radius, radius);
          ellipse(xpos-450, ypos + valueThree, radius, radius);
          ellipse(xpos-340, ypos + valueFour, radius, radius);
          ellipse(xpos-230, ypos + valueFive, radius, radius);
          ellipse(xpos-120, ypos + valueSix, radius, radius);
          ellipse(xpos-10, ypos + valueSeven, radius, radius);
          ellipse(xpos+120, ypos + valueEight, radius, radius);
          ellipse(xpos+230, ypos + valueNine, radius, radius);
          ellipse(xpos+330, ypos + valueTen, radius, radius);
          
          //These values are printed in accordance the first value goes to the 10th percentile and so on and the last value in the line goes to the 100th percentile - Aislinn Smyth & Oluwatumininu Ogunbadejo
          //Only for demeonstration of which value goes where to be commented out once plot is drawn.
          text(valueOnee, xpos-685, ypos+345);
          text(valueTwoo, xpos-575, ypos+345);
          text(valueThreee, xpos-465, ypos+345);
          text(valueFourr, xpos-355, ypos+345);
          text(valueFivee, xpos-245, ypos+345);
          text(valueSixx, xpos-135, ypos+345);
          text(valueSevenn, xpos-25, ypos+345);
          text(valueEightt, xpos+85, ypos+345);
          text(valueNinee, xpos+195, ypos+345);
          text(valueTenn, xpos+305, ypos+345);
        }
        
        if(dataType.equals("Open Price"))
        {
          
          //Scaling for each data type to fit the graph size - Aislinn Smyth
          float maxOP;
          if (stockList.get(position1).open_price > stockList.get(position2).open_price)
            maxOP = stockList.get(position1).open_price;
          else
            maxOP = stockList.get(position2).open_price;
          if (stockList.get(position3).open_price > maxOP)
            maxOP = stockList.get(position3).open_price;
          if (stockList.get(position4).open_price > maxOP)
            maxOP = stockList.get(position4).open_price;
          if (stockList.get(position5).open_price > maxOP)
            maxOP = stockList.get(position5).open_price;
          if (stockList.get(position6).open_price > maxOP)
            maxOP = stockList.get(position6).open_price;
          if (stockList.get(position7).open_price > maxOP)
             maxOP = stockList.get(position7).open_price;
          if (stockList.get(position8).open_price > maxOP)
              maxOP = stockList.get(position8).open_price;
          if (stockList.get(position9).open_price > maxOP)
              maxOP = stockList.get(position9).open_price;
          if (stockList.get(position10).open_price > maxOP)
              maxOP = stockList.get(position10).open_price;

          float open1 = (-stockList.get(position1).open_price) / maxOP * GRAPH_HEIGHT;
          float open2 = (-stockList.get(position2).open_price) / maxOP * GRAPH_HEIGHT;
          float open3 = (-stockList.get(position3).open_price) / maxOP * GRAPH_HEIGHT;
          float open4 = (-stockList.get(position4).open_price) / maxOP * GRAPH_HEIGHT;
          float open5 = (-stockList.get(position5).open_price) / maxOP * GRAPH_HEIGHT;
          float open6 = (-stockList.get(position6).open_price) / maxOP * GRAPH_HEIGHT;
          float open7 = (-stockList.get(position7).open_price) / maxOP * GRAPH_HEIGHT;
          float open8 = (-stockList.get(position8).open_price) / maxOP * GRAPH_HEIGHT;
          float open9 = (-stockList.get(position9).open_price) / maxOP * GRAPH_HEIGHT;
          float open10 = (-stockList.get(position10).open_price) / maxOP * GRAPH_HEIGHT;
          
          fill(0, 150, 100);
          
          //drawing the circles for each percentile 

        ellipse(xpos-670, ypos + open1, radius, radius);
        ellipse(xpos-560, ypos + open2, radius, radius);
        ellipse(xpos-450, ypos + open3, radius, radius);
        ellipse(xpos-340, ypos + open4, radius, radius);
        ellipse(xpos-230, ypos + open5, radius, radius);
        ellipse(xpos-120, ypos + open6, radius, radius);
        ellipse(xpos-10, ypos + open7, radius, radius);
        ellipse(xpos+120, ypos + open8, radius, radius);
        ellipse(xpos+230, ypos + open9, radius, radius);
        ellipse(xpos+330, ypos + open10, radius, radius);
          
        //text written underneath the graph to display the value reached for the points in the scatter plot
        text(stockList.get(position1).open_price, xpos-685, ypos+345);
        text(stockList.get(position2).open_price, xpos-575, ypos+345);
        text(stockList.get(position3).open_price, xpos-465, ypos+345);
        text(stockList.get(position4).open_price, xpos-355, ypos+345);
        text(stockList.get(position5).open_price, xpos-245, ypos+345);
        text(stockList.get(position6).open_price, xpos-135, ypos+345);
        text(stockList.get(position7).open_price, xpos-25, ypos+345);
        text(stockList.get(position8).open_price, xpos+85, ypos+345);
        text(stockList.get(position9).open_price, xpos+195, ypos+345);
        text(stockList.get(position10).open_price, xpos+305, ypos+345);
          
        }
        
        if(dataType.equals("Closing Price"))
        {
          
           float maxCP;
        if (stockList.get(position1).close_price > stockList.get(position2).close_price)
          maxCP = stockList.get(position1).close_price;
        else
          maxCP = stockList.get(position2).close_price;
        if (stockList.get(position3).close_price > maxCP)
          maxCP = stockList.get(position3).close_price;
        if (stockList.get(position4).close_price > maxCP)
          maxCP = stockList.get(position4).close_price;
        if (stockList.get(position5).close_price > maxCP)
          maxCP = stockList.get(position5).close_price;
        if (stockList.get(position6).close_price > maxCP)
          maxCP = stockList.get(position6).close_price;
        if (stockList.get(position7).close_price > maxCP)
          maxCP = stockList.get(position7).close_price;
        if (stockList.get(position8).close_price > maxCP)
          maxCP = stockList.get(position8).close_price;
        if (stockList.get(position9).close_price > maxCP)
          maxCP = stockList.get(position9).close_price;
        if (stockList.get(position10).close_price > maxCP)
          maxCP = stockList.get(position10).close_price;
          
          float close1 = (-stockList.get(position1).close_price) / maxCP * GRAPH_HEIGHT; 
          float close2 = (-stockList.get(position2).close_price) / maxCP * GRAPH_HEIGHT; 
          float close3 = (-stockList.get(position3).close_price) / maxCP * GRAPH_HEIGHT; 
          float close4 = (-stockList.get(position4).close_price) / maxCP * GRAPH_HEIGHT; 
          float close5 = (-stockList.get(position5).close_price) / maxCP * GRAPH_HEIGHT; 
          float close6 = (-stockList.get(position6).close_price) / maxCP * GRAPH_HEIGHT;
          float close7 = (-stockList.get(position7).close_price) / maxCP * GRAPH_HEIGHT; 
          float close8 = (-stockList.get(position8).close_price) / maxCP * GRAPH_HEIGHT; 
          float close9 = (-stockList.get(position9).close_price) / maxCP * GRAPH_HEIGHT;
          float close10 = (-stockList.get(position10).close_price) / maxCP * GRAPH_HEIGHT;
          
        fill(0, 150, 100);
        ellipse(xpos-670, ypos + close1, radius, radius);
        ellipse(xpos-560, ypos + close2, radius, radius);
        ellipse(xpos-450, ypos + close3, radius, radius);
        ellipse(xpos-340, ypos + close4, radius, radius);
        ellipse(xpos-230, ypos + close5, radius, radius);
        ellipse(xpos-120, ypos + close6, radius, radius);
        ellipse(xpos-10, ypos + close7, radius, radius);
        ellipse(xpos+120, ypos + close8, radius, radius);
        ellipse(xpos+230, ypos + close9, radius, radius);
        ellipse(xpos+330, ypos + close10, radius, radius);
          
        text(stockList.get(position1).close_price, xpos-685, ypos+345);
        text(stockList.get(position2).close_price, xpos-575, ypos+345);
        text(stockList.get(position3).close_price, xpos-465, ypos+345);
        text(stockList.get(position4).close_price, xpos-355, ypos+345);
        text(stockList.get(position5).close_price, xpos-245, ypos+345);
        text(stockList.get(position6).close_price, xpos-135, ypos+345);
        text(stockList.get(position7).close_price, xpos-25, ypos+345);
        text(stockList.get(position8).close_price, xpos+85, ypos+345);
        text(stockList.get(position9).close_price, xpos+195, ypos+345);
        text(stockList.get(position10).close_price, xpos+305, ypos+345);
      }  

      if(dataType.equals("Adjusted Close"))
      {
        
        float maxAC;
        if (stockList.get(position1).adjusted_close > stockList.get(position2).adjusted_close)
          maxAC =stockList.get(position1).adjusted_close;
        else
          maxAC = stockList.get(position2).adjusted_close;
        if (stockList.get(position3).adjusted_close > maxAC)
          maxAC = stockList.get(position3).adjusted_close;
        if (stockList.get(position4).adjusted_close > maxAC)
          maxAC = stockList.get(position4).adjusted_close;
        if (stockList.get(position5).adjusted_close > maxAC)
          maxAC = stockList.get(position5).adjusted_close;
        if (stockList.get(position6).adjusted_close > maxAC)
          maxAC = stockList.get(position6).adjusted_close;
        if (stockList.get(position7).adjusted_close > maxAC)
          maxAC = stockList.get(position7).adjusted_close;
        if (stockList.get(position8).adjusted_close > maxAC)
          maxAC = stockList.get(position8).adjusted_close;
        if (stockList.get(position9).adjusted_close > maxAC)
          maxAC = stockList.get(position9).adjusted_close;
        if (stockList.get(position10).adjusted_close > maxAC)
          maxAC = stockList.get(position10).adjusted_close;
          
          
        float adjustedClose1 = (-stockList.get(position1).adjusted_close) / maxAC * GRAPH_HEIGHT;
        float adjustedClose2 = (-stockList.get(position2).adjusted_close) /  maxAC * GRAPH_HEIGHT;
        float adjustedClose3 = (-stockList.get(position3).adjusted_close) /  maxAC * GRAPH_HEIGHT;
        float adjustedClose4 = (-stockList.get(position4).adjusted_close) /  maxAC * GRAPH_HEIGHT;
        float adjustedClose5 = (-stockList.get(position5).adjusted_close) /  maxAC * GRAPH_HEIGHT;
        float adjustedClose6 = (-stockList.get(position6).adjusted_close) /  maxAC * GRAPH_HEIGHT;
        float adjustedClose7 = (-stockList.get(position7).adjusted_close) /  maxAC * GRAPH_HEIGHT;
        float adjustedClose8 = (-stockList.get(position8).adjusted_close) /  maxAC * GRAPH_HEIGHT;
        float adjustedClose9 = (-stockList.get(position9).adjusted_close) / maxAC * GRAPH_HEIGHT;
        float adjustedClose10 = (-stockList.get(position10).adjusted_close) /  maxAC * GRAPH_HEIGHT;
        
        fill(0, 150, 100);
        ellipse(xpos-670, ypos + adjustedClose1, radius, radius);
        ellipse(xpos-560, ypos + adjustedClose2, radius, radius);
        ellipse(xpos-450, ypos + adjustedClose3, radius, radius);
        ellipse(xpos-340, ypos + adjustedClose4, radius, radius);
        ellipse(xpos-230, ypos + adjustedClose5, radius, radius);
        ellipse(xpos-120, ypos + adjustedClose6, radius, radius);
        ellipse(xpos-10, ypos + adjustedClose7, radius, radius);
        ellipse(xpos+120, ypos + adjustedClose8, radius, radius);
        ellipse(xpos+230, ypos + adjustedClose9, radius, radius);
        ellipse(xpos+330, ypos + adjustedClose10, radius, radius);
        
        text(stockList.get(position1).adjusted_close, xpos-685, ypos+345);
        text(stockList.get(position2).adjusted_close, xpos-575, ypos+345);
        text(stockList.get(position3).adjusted_close, xpos-465, ypos+345);
        text(stockList.get(position4).adjusted_close, xpos-355, ypos+345);
        text(stockList.get(position5).adjusted_close, xpos-245, ypos+345);
        text(stockList.get(position6).adjusted_close, xpos-135, ypos+345);
        text(stockList.get(position7).adjusted_close, xpos-25, ypos+345);
        text(stockList.get(position8).adjusted_close, xpos+85, ypos+345);
        text(stockList.get(position9).adjusted_close, xpos+195, ypos+345);
        text(stockList.get(position10).adjusted_close, xpos+305, ypos+345);
      }

      if(dataType.equals("Low")) 
      {
        float maxLow;
        if (stockList.get(position1).low > stockList.get(position2).low)
          maxLow = stockList.get(position1).low;
        else
          maxLow = stockList.get(position2).low;
        if (stockList.get(position3).low > maxLow)
          maxLow = stockList.get(position3).low;
        if (stockList.get(position4).low > maxLow)
          maxLow = stockList.get(position4).low;
        if (stockList.get(position5).low > maxLow)
          maxLow = stockList.get(position5).low;
        if (stockList.get(position6).low > maxLow)
          maxLow = stockList.get(position6).low;
        if (stockList.get(position7).low > maxLow)
          maxLow = stockList.get(position7).low;
        if (stockList.get(position8).low > maxLow)
          maxLow = stockList.get(position8).low;
        if (stockList.get(position9).low > maxLow)
          maxLow = stockList.get(position9).low;          
         if (stockList.get(position10).low > maxLow)
          maxLow = stockList.get(position10).low;         
          
          
        float low1 = (-stockList.get(position1).low) / maxLow * GRAPH_HEIGHT;
        float low2 = (-stockList.get(position2).low) /  maxLow * GRAPH_HEIGHT;
        float low3 = (-stockList.get(position3).low) /  maxLow * GRAPH_HEIGHT;
        float low4 = (-stockList.get(position4).low) /  maxLow * GRAPH_HEIGHT;
        float low5 = (-stockList.get(position5).low) /  maxLow *GRAPH_HEIGHT;
        float low6 = (-stockList.get(position6).low) /  maxLow * GRAPH_HEIGHT;
        float low7 = (-stockList.get(position7).low) /  maxLow * GRAPH_HEIGHT;
        float low8 = (-stockList.get(position8).low) / maxLow * GRAPH_HEIGHT;
        float low9 = (-stockList.get(position9).low) /  maxLow * GRAPH_HEIGHT;
        float low10 = (-stockList.get(position10).low) / maxLow * GRAPH_HEIGHT;
        
         fill(0, 150, 100);
        ellipse(xpos-670, ypos + low1, radius, radius);
        ellipse(xpos-560, ypos + low2, radius, radius);
        ellipse(xpos-450, ypos + low3, radius, radius);
        ellipse(xpos-340, ypos + low4, radius, radius);
        ellipse(xpos-230, ypos + low5, radius, radius);
        ellipse(xpos-120, ypos + low6, radius, radius);
        ellipse(xpos-10, ypos + low7, radius, radius);
        ellipse(xpos+120, ypos + low8, radius, radius);
        ellipse(xpos+230, ypos + low9, radius, radius);
        ellipse(xpos+330, ypos +low10, radius, radius);
        
        text(stockList.get(position1).low, xpos-685, ypos+345);
        text(stockList.get(position2).low, xpos-575, ypos+345);
        text(stockList.get(position3).low, xpos-465, ypos+345);
        text(stockList.get(position4).low, xpos-355, ypos+345);
        text(stockList.get(position5).low, xpos-245, ypos+345);
        text(stockList.get(position6).low, xpos-135, ypos+345);
        text(stockList.get(position7).low, xpos-25, ypos+345);
        text(stockList.get(position8).low, xpos+85, ypos+345);
        text(stockList.get(position9).low, xpos+195, ypos+345);
        text(stockList.get(position10).low, xpos+305, ypos+345);
        
      }

      if(dataType.equals("High"))
      {
        
        float maxHigh;
        if (stockList.get(position1).high > stockList.get(position2).high)
          maxHigh = stockList.get(position1).high;
        else
          maxHigh = stockList.get(position2).high;
        if (stockList.get(position3).high > maxHigh)
          maxHigh = stockList.get(position3).high;
        if (stockList.get(position4).high > maxHigh)
          maxHigh = stockList.get(position4).high;
        if (stockList.get(position5).high > maxHigh)
          maxHigh = stockList.get(position5).high;
        if (stockList.get(position6).high > maxHigh)
          maxHigh = stockList.get(position6).high;   
        if (stockList.get(position7).high > maxHigh)
          maxHigh = stockList.get(position7).high;
        if (stockList.get(position8).high > maxHigh)
          maxHigh = stockList.get(position8).high;
        if (stockList.get(position9).high > maxHigh)
          maxHigh = stockList.get(position9).high;
        if (stockList.get(position10).high > maxHigh)
          maxHigh = stockList.get(position10).high;
          
          
          
          
        float high1 = (-stockList.get(position1).high) / maxHigh * GRAPH_HEIGHT;
        float high2 = (-stockList.get(position2).high) / maxHigh * GRAPH_HEIGHT;
        float high3 = (-stockList.get(position3).high) / maxHigh * GRAPH_HEIGHT;
        float high4 = (-stockList.get(position4).high) / maxHigh * GRAPH_HEIGHT;
        float high5 = (-stockList.get(position5).high) / maxHigh * GRAPH_HEIGHT;
        float high6 = (-stockList.get(position6).high) / maxHigh * GRAPH_HEIGHT;
        float high7 = (-stockList.get(position7).high) / maxHigh * GRAPH_HEIGHT;
        float high8 = (-stockList.get(position8).high) / maxHigh * GRAPH_HEIGHT;
        float high9 = (-stockList.get(position9).high) / maxHigh * GRAPH_HEIGHT;
        float high10 = (-stockList.get(position10).high) / maxHigh * GRAPH_HEIGHT;
        
        fill(0, 150, 100);
        ellipse(xpos-670, ypos + high1, radius, radius);
        ellipse(xpos-560, ypos + high2, radius, radius);
        ellipse(xpos-450, ypos + high3, radius, radius);
        ellipse(xpos-340, ypos + high4, radius, radius);
        ellipse(xpos-230, ypos + high5, radius, radius);
        ellipse(xpos-120, ypos + high6, radius, radius);
        ellipse(xpos-10, ypos + high7, radius, radius);
        ellipse(xpos+120, ypos + high8, radius, radius);
        ellipse(xpos+230, ypos + high9, radius, radius);
        ellipse(xpos+330, ypos +high10, radius, radius);

        text(stockList.get(position1).high, xpos-685, ypos+345);
        text(stockList.get(position2).high, xpos-575, ypos+345);
        text(stockList.get(position3).high, xpos-465, ypos+345);
        text(stockList.get(position4).high, xpos-355, ypos+345);
        text(stockList.get(position5).high, xpos-245, ypos+345);
        text(stockList.get(position6).high, xpos-135, ypos+345);
        text(stockList.get(position7).high, xpos-25, ypos+345);
        text(stockList.get(position8).high, xpos+85, ypos+345);
        text(stockList.get(position9).high, xpos+195, ypos+345);
        text(stockList.get(position10).high, xpos+305, ypos+345);

        }
      }
    }
  }
  
  // Not implemented so returns an error value
  int mouseOverVertical()
  {
    return -1;
  }
  //Returns the x postion
  int getX()
  {
    return xpos;
  }
  //Returns the y postion
  int getY()
  {
    return ypos;
  }
  //Sets the x postion
  void setX(int xpos)
  {
    this.xpos = xpos;
  }
  //Returns the y postion
  void setY(int ypos)
  {
    this.ypos = ypos;
  }
  //Returns the Max Value postion
  int getMaxValue()
  {
    return maxValue;
  }
  //Returns the Length
 int getLength()
  {
    return dataArray.length;
  }
  //Returns the height
  int getHeight()
  {
    return height;
  }
  //Returns the width
  int getWidth()
  {
    return width;
  }
}
        
 
//  class PiChart
//{
//  ArrayList<Integer> colorList = new ArrayList();
//  private int[] dataArray = null;
//  private int diameter; 
//  private float xpos;
//  private float ypos;
//  private int totalSum;
//  private int remainderChecker = 360; 
//  private boolean sliding = false;
//  private float slideValue;
//  private boolean spaceBackground = false;
//  private float spaceX = 0;
//   float defaultX;
//   float defaultY;


//  float spin; 
//  int velocity; 
//  int walkies;
//  PiChart(int[] array, int diameter, int xpos, int ypos)
//  {
//    this.diameter = diameter;
//    dataArray = array;
//    this.ypos = ypos;
//    this.xpos = xpos;
//    defaultX = xpos;
//    defaultY = ypos;
//    for (int i =0; i < dataArray.length; i++)
//    {
//      totalSum+= dataArray[i];
//      //System.out.println(dataArray[i]);
//    }
//    //System.out.println(totalSum);
//    for (int i =0; i < dataArray.length; i++)
//    {
//      dataArray[i]= int (((float) dataArray[i] / (float) totalSum)*360);
//      //System.out.println(dataArray[i]);
//      remainderChecker -= dataArray[i];
//    }
//    for (int i = 0; i < dataArray.length; i++)
//    {
//      colorList.add(i * (360/dataArray.length));
//    }
//    if (remainderChecker != 0)
//    {
//      dataArray[0] +=remainderChecker;
//    }
//  }

//// There is no set up required that is planned. PiGraph fully initiliases in the constructor
//  void  setup()
//  {

//  }

//  // Takes in int dimensions and float co-ordinates
//  PiChart(int[] array, int diameter, float xpos, float ypos)
//  {
//    this.diameter = diameter;
//    dataArray = array;
//    this.ypos =   ypos;
//    this.xpos =  xpos;
//    defaultX = xpos;
//    defaultY = ypos;
//    for (int i =0; i < dataArray.length; i++)
//    {
//      totalSum+= dataArray[i];
//      //System.out.println(dataArray[i]);
//    }
//    // System.out.println(totalSum);
//    for (int i =0; i < dataArray.length; i++)
//    {
//      dataArray[i]= int (((float) dataArray[i] / (float) totalSum)*360);
//      // System.out.println(dataArray[i]);
//      remainderChecker -= dataArray[i];
//    }
//    for (int i = 0; i < dataArray.length; i++)
//    {
//      colorList.add(i * (360/dataArray.length));
//    }
//    if (remainderChecker != 0)
//    {
//      dataArray[0] +=remainderChecker;
//    }
//  }
 
