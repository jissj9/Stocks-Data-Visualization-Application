import java.util.Arrays;
import java.io.FileReader;
import java.util.Collections;
import java.util.Comparator;
/*
 Written by Michael Makarenko on 12/03/2020
 Added to by Michael Makarenko on 12/03/2020
 Added to by Aislinn Smyth on 18/03/2020
 Added to by Jiss Joseph on 19/03/2020 
 Added to by Michael Makarenko on 22/03/2020
 Added to by Aislinn Smyth on 22/03/2020
 Added to by Michael Makarenko on 25/03/2020
 Added to by Jiss Joseph on 25/03/2020
 Added to by Michael Makarenko on 26/03/2020
 Added to by Oluwatumininu Ogunbadejo 29/03/2020
 Added to by Aislinn Smyth 30/03/2020
 Added to by Michael Makarenko 30/03/2020
 Added to by Michael Makarenko 31/03/2020
 Added to by Jiss Joseph on 02/03/2020
 Added to by Jiss Joseph on 09/04/2020
 added to by Aislinn Smyth on 12/04/2020
 Added to by Michael Makarenko on 13/04/2020
 Added to by Jiss Joseph on 16/04/2020
 Added to by Oluwatumininu Ogunbadejo 20/04/2020
 Added to by Jiss Joseph on 21/04/2020
 Added to by Jiss Joseph on 22/04/2020
 Added to by Michael Makarenko on 22/04/2020
 Added to by Michael Makarenko on 23/04/2020
*/

// Initialise objects and variables - Michael Makarenko and Jiss Joseph
public static int pageNumber, pageType;
public static Table table;
PImage search, title, stockTitle, backOfTitle;
float percentFinished = 0.0;
boolean finishedLoading = false;
float number = 0;
float colour = 4;
ArrayList<DataPoint> DataPoints = new ArrayList<DataPoint>();
ArrayList<CompanyData> CompanyDatas = new ArrayList<CompanyData>();
//int dy = 1;
//int counter = 0;
Screen screen1; 
Screen screen2;
Screen currentScreen;
Graph currentGraph;
TextualSummary theTextualSummary;
LineChart currentLineChart;
ScatterPlot currentScatterPlot;
PFont font;
TextWidget focus = null;
ArrayList<DataPoint> stockList;
ArrayList<DataPoint> dateList;
ArrayList<CompanyData> exchangeList;
ArrayList<TextualSummary> texts;
DataPoint NA;
Checkbox darkmode;
boolean displayExtra = false;
int[] highs;
int[] lows;
int[] opens;
int[] closes;
int[] adjcloses;
int[] volumes;
PrintWriter output;
BufferedReader reader;
String line;
int count = 0;
char letterSearch;

// fullscreen display - Jiss Joseph
void settings()
{
  fullScreen();
}

void initialize()
{
  //when program starts the loading boolean is set to false - Jiss Joseph
  finishedLoading = false;
  
  ellipseMode(RADIUS); //all ellipses and circles will be drawn based on radius, not diameter - Michael Makarenko

  //general setup - Michael Makarenko, Jiss Joseph, Aislinn Smyth and Oluwatumininu Ogunbadejo
  font = loadFont("ArialMT-20.vlw");
  screen1 = new Screen(DARKMODE, font);
  screen2 = new Screen(DARKMODE, font);
  screen1.addButtonWidget(254, 160, 200, "Highs", color(0, 200, 0), HIGHS_BUTTON_EVENT);
  screen1.addButtonWidget(456, 160, 200, "Lows", color(200, 0, 0), LOWS_BUTTON_EVENT);
  screen1.addButtonWidget(1466, 160, 200, "CLEAR", color(255), CLEAR_BUTTON_EVENT);
  screen1.addTextWidget(810, 99, 300, "Search", color(25, 217, 255), SEARCH_BOX_EVENT, 21);
  screen1.addButtonWidget(658, 160, 200, "Open Price", color(179, 255, 25), OPEN_BUTTON_EVENT);
  screen1.addButtonWidget(860, 160, 200, "Close Price", color(255, 102, 25), CLOSE_BUTTON_EVENT);
  screen1.addButtonWidget(1062, 160, 200, "Volumes", color(77, 106, 255), VOLUMES_BUTTON_EVENT);
  screen1.addButtonWidget(1264, 160, 200, "Adjusted Close", color(230, 191, 0), ADJCLOSE_BUTTON_EVENT);
  screen1.addButtonWidget(1716, 99, 200, "NEXT >", color(255), NEXT_BUTTON_EVENT);
  screen1.addButtonWidget(4, 99, 200, "Largest Changes", color(180, 80, 0), LARGDIFF_BUTTON_EVENT);
  screen2.addButtonWidget(4, 99, 200, "< BACK", color(255), BACK_BUTTON_EVENT);
  currentScreen = screen1;
  currentGraph = new Graph();
  theTextualSummary = new TextualSummary();
  currentLineChart = new LineChart();
  currentScatterPlot = new ScatterPlot();
  texts = new ArrayList<TextualSummary>();
  NA = new DataPoint("N/A,0,0,0,0,0,0,0000-00-00"); //default null datapoint
  darkmode = new Checkbox(1860, 1020, 60, color(250, 100, 20), DARKMODE_EVENT);
  //data attribute arrays for storing up to 5 indexes of relevant stock entries
  highs = new int[] {0,0,0,0,0};
  lows = new int[] {0,0,0,0,0};
  opens = new int[] {0,0,0,0,0};
  closes = new int[] {0,0,0,0,0};
  adjcloses = new int[] {0,0,0,0,0};
  volumes = new int[] {0,0,0,0,0};

  // rendering the data and adding it into an array List - Jiss Joseph
  try
  {
    // load each line from the csv into a DataPoint object in an ArrayList - Michael Makarenko
    reader = createReader("daily_prices100k.csv");
    while ((line = reader.readLine()) != null)
    {
      DataPoint temp = new DataPoint(line);
      DataPoints.add(temp);
    }
    reader.close();
    // load each line from the csv into a CompanyData object in an ArrayList - Michael Makarenko
    reader = createReader("stocks.csv");
    while ((line = reader.readLine()) != null)
    {
      CompanyData temp = new CompanyData(line);
      CompanyDatas.add(temp);
    }
    reader.close();
  }
  catch
    (IOException e) {println(e);}
  
  DataPoints.add(0, NA);
  
  // print one instance of each data type in console - Michael Makarenko
  //println(DataPoints.get(0).line);
  //println(DataPoints.get(0).ticker);
  //println(DataPoints.get(0).open_price);
  //println(DataPoints.get(0).close_price);
  //println(DataPoints.get(0).adjusted_close);
  //println(DataPoints.get(0).low);
  //println(DataPoints.get(0).high);
  //println(DataPoints.get(0).volume);
  //println(DataPoints.get(0).date);

  // print all instances in console - Michael Makarenko
  //for (int i = 0; i < DataPoints.size(); i++)
  //{
  //  println(DataPoints.get(i).line);
  //}
  
  //loading images into the variable names - Jiss Joseph
  title = loadImage("Title.gif");
  stockTitle = loadImage("stockTitle.png");
  //resizing images - Jiss Joseph
  stockTitle.resize(250,120);
  backOfTitle = loadImage("backOfTitle.jpg");
  backOfTitle.resize(1950,95);
  //when program starts the loading boolean is set to false - Jiss Joseph
  finishedLoading = true;
}
void setup()
{
  background(155);
  //initialize();
  thread("initialize"); // The function 'initialize' is run in a separate thread to the rest of the program. - Jiss Joseph
}

//Method to create ArrayList of DataPoints with the passed in ticker symbol (e.g "AAPL")
//from the passed in ArrayList of DataPoints, and also makes a csv file
//with the contents of the resulting stockList- Michael Makarenko
void makeStockList(ArrayList<DataPoint> Datas, String stockTicker)
{
  //make stockList
  stockList = new ArrayList<DataPoint>();
  output = createWriter("stockList.csv");
  for (int i = 0; i < Datas.size(); i++)
  {
    if (Datas.get(i).ticker.equals(stockTicker))
    {
      stockList.add(Datas.get(i));
    }
  }
  //sort stockList by date
  Collections.sort(stockList, new Comparator<DataPoint>()
  {
    @Override
    public int compare(DataPoint o1, DataPoint o2)
    {
        return Double.compare(o1.date, o2.date);
    }
  });
  //write stockList.csv
  for (int i = 0; i < stockList.size(); i++)
  {
    output.println(stockList.get(i).line);
  }
  output.flush();
  output.close();
  //Add the selected stock's most extreme data attributes to data attribute arrays
  // containing indexes for the relevant attributes
  if (dateList != null)
  {
    // add first open
    for (int i = 0; i < opens.length; i++)
    {
      if (opens[i] == 0)
      {
        for (int j = 1; j < dateList.size(); j++)
        {
          if (dateList.get(j).ticker.equals(stockTicker))
          {
            opens[i] = j;
          }
        }
        break;
      }
    }
    // add last close and last adjclose
    for (int i = 0; i < closes.length; i++)
    {
      if (closes[i] == 0)
      {
        for (int j = dateList.size()-1; j > 0; j--)
        {
          if (dateList.get(j).ticker.equals(stockTicker))
          {
            closes[i] = j;
            adjcloses[i] = j;
          }
        }
        break;
      }
    }
    // add highest high
    for (int i = 0; i < highs.length; i++)
    {
      if (highs[i] == 0)
      {
        float maxHigh = 0;
        for (int j = 0; j < dateList.size(); j++)
        {
          if (dateList.get(j).ticker.equals(stockTicker))
          {
            if (dateList.get(j).high > maxHigh)
            {
              maxHigh = dateList.get(j).high;
              highs[i] = j;
            }
          }
        }
        break;
      }
    }
    // add lowest low
    for (int i = 0; i < lows.length; i++)
    {
      if (lows[i] == 0)
      {
        float minLow = 999999;
        for (int j = 0; j < dateList.size(); j++)
        {
          if (dateList.get(j).ticker.equals(stockTicker))
          {
            if (dateList.get(j).low < minLow)
            {
              minLow = dateList.get(j).low;
              lows[i] = j;
            }
          }
        }
        break;
      }
    }
    // add largest volume
    for (int i = 0; i < volumes.length; i++)
    {
      if (volumes[i] == 0)
      {
        float maxVol = 0;
        for (int j = 0; j < dateList.size(); j++)
        {
          if (dateList.get(j).ticker.equals(stockTicker))
          {
            if (dateList.get(j).volume > maxVol)
            {
              maxVol = dateList.get(j).volume;
              volumes[i] = j;
            }
          }
        }
        break;
      }
    }
  }
  else
  {
    // add first open
    for (int i = 0; i < opens.length; i++)
    {
      if (opens[i] == 0)
      {
        for (int j = 1; j < DataPoints.size(); j++)
        {
          if (DataPoints.get(j).ticker.equals(stockTicker))
          {
            opens[i] = j;
          }
        }
        break;
      }
    }
    // add last close and last adjclose
    for (int i = 0; i < closes.length; i++)
    {
      if (closes[i] == 0)
      {
        for (int j = DataPoints.size()-1; j > 0; j--)
        {
          if (DataPoints.get(j).ticker.equals(stockTicker))
          {
            closes[i] = j;
            adjcloses[i] = j;
          }
        }
        break;
      }
    }
    // add highest high
    for (int i = 0; i < highs.length; i++)
    {
      if (highs[i] == 0)
      {
        float maxHigh = 0;
        for (int j = 0; j < DataPoints.size(); j++)
        {
          if (DataPoints.get(j).ticker.equals(stockTicker))
          {
            if (DataPoints.get(j).high > maxHigh)
            {
              maxHigh = DataPoints.get(j).high;
              highs[i] = j;
            }
          }
        }
        break;
      }
    }
    // add lowest low
    for (int i = 0; i < lows.length; i++)
    {
      if (lows[i] == 0)
      {
        float minLow = 999999;
        for (int j = 0; j < DataPoints.size(); j++)
        {
          if (DataPoints.get(j).ticker.equals(stockTicker))
          {
            if (DataPoints.get(j).low < minLow)
            {
              minLow = DataPoints.get(j).low;
              lows[i] = j;
            }
          }
        }
        break;
      }
    }
    // add largest volume
    for (int i = 0; i < volumes.length; i++)
    {
      if (volumes[i] == 0)
      {
        float maxVol = 0;
        for (int j = 0; j < DataPoints.size(); j++)
        {
          if (DataPoints.get(j).ticker.equals(stockTicker))
          {
            if (DataPoints.get(j).volume > maxVol)
            {
              maxVol = DataPoints.get(j).volume;
              volumes[i] = j;
            }
          }
        }
        break;
      }
    }
  }
}

//Method to create ArrayList of DataPoints with the passed in date
//from the passed in ArrayList of DataPoints, also clears data attribute
//pointer arrays to prepare for next Ticker search
// dateList is sorted by date - Michael Makarenko
void makeDateList(ArrayList<DataPoint> Datas, int[] dateInput)
{
  dateList = new ArrayList<DataPoint>(); //<>//
  //if single date entered
  if (dateInput.length == 1)
  {
    for (int i = 0; i < Datas.size(); i++)
    {
      if (Datas.get(i).date == dateInput[0])
      {
        dateList.add(Datas.get(i));
      }
    }
  }
  //if date range entered
  else
  {
    int maxDate, minDate;
    if (dateInput[0] > dateInput[1])
    {
      maxDate = dateInput[0];
      minDate = dateInput[1];
    }
    else
    {
      maxDate = dateInput[1]; //<>//
      minDate = dateInput[0];
    }
    for (int i = 0; i < Datas.size(); i++)
    {
      if (Datas.get(i).date <= maxDate && Datas.get(i).date >= minDate)
      {
        //make dateList
        dateList.add(Datas.get(i));
      }
    }
    //sort dateList by date
    Collections.sort(dateList, new Comparator<DataPoint>()
    {
      @Override
      public int compare(DataPoint o1, DataPoint o2)
      {
          return Double.compare(o1.date, o2.date);
      }
    });
  }
  dateList.add(0, NA);
  // clear data attribute arrays so that they are added to from next makeStockList() call
  highs = new int[] {0,0,0,0,0};
  lows = new int[] {0,0,0,0,0};
  opens = new int[] {0,0,0,0,0};
  closes = new int[] {0,0,0,0,0};
  adjcloses = new int[] {0,0,0,0,0};
  volumes = new int[] {0,0,0,0,0};
  
}

// make an ArrayList of CompanyData objects based on the stock exchange name
// passed into the method - Michael Makarenko
void makeExchangeList(ArrayList<CompanyData> Datas, String exchange)
{
  exchangeList = new ArrayList<CompanyData>();
  for (int i = 1; i < Datas.size(); i++)
  {
    if (Datas.get(i).exchange.equals(exchange))
    {
      exchangeList.add(Datas.get(i));
    }
  }
}

void draw()
{
  if (!finishedLoading)
  {
    // Loading bar by Jiss Joseph
    // Drawing a loading bar and an inner bar that loads according to how 
    // much data is being loaded
    stroke(0);
    noFill();
    rect(SCREENX/2 - 150, SCREENY/2, LOADING_BAR_LENGTH, 10);
    fill(95, 155, 252);
    float loadingBar = map(percentFinished, 0, 1, 0, LOADING_BAR_LENGTH);
    rect(SCREENX/2 - 150, SCREENY/2, loadingBar, 10);
    textSize(20);
    //textAlign(CENTER);
    fill(0);
    text("Loading...", SCREENX / 2 - 30, SCREENY / 2 + 40);
    
    //Spiral Pattern - Jiss Joseph
    //Pattern resets if n becomes graeter than 50
    //Creating three different spirals x and y (used with cos and sin)
    float pattern = number * 140.5;
    float spiral = colour * sqrt(number);
    float x = spiral * cos(pattern) + SCREENX / 2;
    float y = spiral * sin(pattern) + SCREENY / 2.315;
    //Changing the colour of the circle within the pattern
    fill(pattern%256, spiral%256, spiral%256);
    noStroke();
    ellipse(x, y, 4, 4);
    number += 1.5;
    percentFinished = percentFinished +0.0124;
    if (number == 50) {
      background(0);
      number = 0;
    }
   }
 
  if(finishedLoading)
  {
    //User interface design - Jiss Joseph
    //draw background, visuals and widgets - Michael Makarenko, Jiss Joseph, Aislinn Smyth and Oluwatumininu Ogunbadejo
    currentScreen.draw();
    currentGraph.draw();
    theTextualSummary.draw();
    currentLineChart.draw();
    currentScatterPlot.draw();
    for (int i = 0; i < texts.size(); i++)
      texts.get(i).draw();
    fill(color(250, 100, 20));
    image(backOfTitle, 0, 0);
    image(stockTitle, 1130, -25);
    image(title, 695, 0);
    //Drawing the storyboard to contain the graphs and queries- Jiss Joseph
    noFill();
    stroke(211, 6, 6);
    strokeWeight(3);
    rect(1, 96, 1918, 980);
    
    text("DARKMODE", 1740, 1060, color(250, 100, 20));
    darkmode.draw();
    
    //list statuses
    if (darkmode.checked)
      fill(LIGHTMODE);
    else
      fill(DARKMODE);
    if (stockList != null && stockList.size() > 0)
      text("Stock: " + stockList.get(0).ticker, 50, 193);
    if (currentScreen == screen1)
    {
      if (dateList != null && dateList.size() > 1)
        text("Date: " + dateList.get(1).splitLine[7] + "_" + dateList.get(dateList.size()-1).splitLine[7], 260, 135);
      if (exchangeList != null && exchangeList.size() > 0)
        text("Exchange: " + exchangeList.get(0).exchange, 600, 135);
    }
  }

  /*
    print as text to screen
   max. lines that can be dispalyed on 1920x1080: 54
   - Michael Makarenko
   */
  //if (counter < DataPoints.size())
  //{
  //  textFont(font);
  //  text(DataPoints.get(counter).line, 10, dy*20); //<>//
  //  dy++;
  //  counter++;
  //}
}

void mousePressed()
{
  int event; //<>//
  // Event handling for darkmode checkbox - Michael Makarenko
  event = darkmode.getEvent(mouseX, mouseY);
  if (event == DARKMODE_EVENT && !darkmode.checked)
  {
    darkmode.checked = true;
    println("checked");
    screen1.backgroundColour = DARKMODE;
    screen2.backgroundColour = DARKMODE;
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
  } else if (event == DARKMODE_EVENT && darkmode.checked)
  {
    darkmode.checked = false;
    println("unchecked");
    screen1.backgroundColour = LIGHTMODE;
    screen2.backgroundColour = LIGHTMODE;
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
  }
  // Event handling for widgets - Michael Makarenko, Aislinn Smyth and Oluwatumininu Ogunbadejo
  event = currentScreen.getEvent();
  switch (event)
  {
  // when a button is pressed, search bar loses focus and resets its label, all visual info unrelated to the button is cleared, and
  // relevant information based on the button is displayed in the form of a line chart, bar chart and textual summary - Michael Makarenko
  case HIGHS_BUTTON_EVENT:
    println("Highs button pressed!");
    currentGraph = new Graph(1100, 600, highs[0], highs[1], highs[2], highs[3], highs[4], "High", color(100, 150, 200), color(0, 255, 0), color(0, 255, 0));  //output from results in graph class - Aislinn Smyth
    currentLineChart = new LineChart(350, 600, highs[0], highs[1], highs[2], highs[3], highs[4], "High", color(100, 150, 200), color(0, 255, 0), 5);    // output from results in LineChart class - Aislinn Smyth
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    theTextualSummary = new TextualSummary(currentGraph.xpos+50, currentGraph.ypos+100, highs[0], highs[1], highs[2], highs[3], highs[4], "High", color(204, 103, 150));
    texts.clear();
    break;
  case LOWS_BUTTON_EVENT:
    println("Lows button pressed!");
    currentGraph = new Graph(1100, 600, lows[0], lows[1], lows[2], lows[3], lows[4], "Low", color(100, 150, 200), color(255, 0, 0), color(255, 0, 0));
    currentLineChart = new LineChart(350, 600, lows[0], lows[1], lows[2], lows[3], lows[4], "Low", color(100, 150, 200), color(255, 0, 0), 5);
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    theTextualSummary = new TextualSummary(currentGraph.xpos+50, currentGraph.ypos+100, lows[0], lows[1], lows[2], lows[3], lows[4], "Low", color(204, 103, 150));
    texts.clear();
    break;
  // clears visual contents of the screen and also data attribute arrays, clearing the data being displayed on the graphs. - Michael Makarenko
  case CLEAR_BUTTON_EVENT:
    println("Clear button pressed!");
    currentGraph = new Graph();
    currentLineChart = new LineChart();
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    theTextualSummary = new TextualSummary();
    texts.clear();
    highs = new int[] {0,0,0,0,0};
    lows = new int[] {0,0,0,0,0};
    opens = new int[] {0,0,0,0,0};
    closes = new int[] {0,0,0,0,0};
    adjcloses = new int[] {0,0,0,0,0};
    volumes = new int[] {0,0,0,0,0};
    stockList = null;
    dateList = null;
    exchangeList = null;
    break;
  // focuses on search bar, can now edit the label
  case SEARCH_BOX_EVENT:
    println("Search box pressed!");
    focus = (TextWidget) screen1.widgetList.get(3);
    focus.label = "";
    break;
  case OPEN_BUTTON_EVENT:
    println("Open button pressed!");
    currentGraph = new Graph(1100, 600, opens[0], opens[1], opens[2], opens[3], opens[4], "Open Price", color(100, 150, 200), color(179, 255, 25), color(179, 255, 25));
    currentLineChart = new LineChart(350, 600, opens[0], opens[1], opens[2], opens[3], opens[4], "Open Price", color(100, 150, 200), color(179, 255, 25), 5);
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    theTextualSummary = new TextualSummary(currentGraph.xpos+50, currentGraph.ypos+100, opens[0], opens[1], opens[2], opens[3], opens[4], "Open Price", color(204, 103, 150));
    texts.clear();
    break;
  case CLOSE_BUTTON_EVENT:
    println("Close button pressed!");
    currentGraph = new Graph(1100, 600, closes[0], closes[1], closes[2], closes[3], closes[4], "Closing Price", color(100, 150, 200), color(255, 102, 25), color(255, 102, 25));
    currentLineChart = new LineChart(350, 600, closes[0], closes[1], closes[2], closes[3], closes[4], "Closing Price", color(100, 150, 200), color(255, 102, 25), 5);
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    theTextualSummary = new TextualSummary(currentGraph.xpos+50, currentGraph.ypos+100, closes[0], closes[1], closes[2], closes[3], closes[4], "Closing Price", color(204, 103, 150));
    texts.clear();
    break;
  case VOLUMES_BUTTON_EVENT:
    println("Volumes button pressed!");
    currentGraph = new Graph(1100, 600, volumes[0], volumes[1], volumes[2], volumes[3], volumes[4], "Volume", color(100, 150, 200), color(77, 106, 255), color(77, 106, 255));
    currentLineChart = new LineChart(350, 600, volumes[0], volumes[1], volumes[2], volumes[3], volumes[4], "Volume", color(100, 150, 200), color(77, 106, 255), 5);
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    theTextualSummary = new TextualSummary(currentGraph.xpos+50, currentGraph.ypos+100, volumes[0], volumes[1], volumes[2], volumes[3], volumes[4], "Volume", color(204, 103, 150));
    texts.clear();
    break;
  case ADJCLOSE_BUTTON_EVENT:
    println("Adjusted Close button pressed!");
    currentGraph = new Graph(1100, 600, adjcloses[0], adjcloses[1], adjcloses[2], adjcloses[3], adjcloses[4], "Adjusted Close", color(100, 150, 200), color(230, 191, 0), color(230, 191, 0)); 
    currentLineChart = new LineChart(350, 600, adjcloses[0], adjcloses[1], adjcloses[2], adjcloses[3], adjcloses[4], "Adjusted Close", color(100, 150, 200), color(230, 191, 0), 5);
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    theTextualSummary = new TextualSummary(currentGraph.xpos+50, currentGraph.ypos+100, adjcloses[0], adjcloses[1], adjcloses[2], adjcloses[3], adjcloses[4], "Adjusted Close", color(204, 103, 150));
    texts.clear();
    break;
  // when Next is pressed, it sees if it needs to display any additional information
  // and if it does, it displays only the extra info. screen2 displays
  // additional entries, writing all entries to a csv file if there are more entries 
  // than can be displayed.
  // It also clears the visual contents of screen1 (not data) - Michael Makarenko
  case NEXT_BUTTON_EVENT:
    println("Next button pressed!");
    currentScatterPlot = new ScatterPlot();
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    //if dates
    if (dateList != null)
    {
      if (theTextualSummary.text.equals("...And " + (dateList.size()-29) + " more entries, press NEXT> for more"))
      {
        currentScreen = screen2;
        currentGraph = new Graph();
        currentLineChart = new LineChart();
        texts.clear();
        theTextualSummary = new TextualSummary();
        int x = 300, y = 114;
        for (int i = 29; i < 62 && i < dateList.size(); i++)
        {
          TextualSummary temp = new TextualSummary(x, y, dateList.get(i).line, color(204, 103, 150));
          texts.add(temp);
          y += 29;
        }
        if (dateList.size() > 62)
        {
          theTextualSummary = new TextualSummary(x, y, "...And " + (dateList.size()-62) + " more entries, too many to display; see dateList.csv", color(204, 153, 0));
          output = createWriter("dateList.csv");
          for (int i = 1; i < dateList.size(); i++)
          {
            output.println(dateList.get(i).line);
          }
          output.flush();
          output.close();
        }
        displayExtra = true;
      }
    }
    // if tickers
    if (theTextualSummary.text.equals("Press NEXT> for more results"))
    {
      currentScreen = screen2;
      currentGraph = new Graph();
      currentLineChart = new LineChart();
      texts.clear();
      theTextualSummary = new TextualSummary();
      int x = 220, y = 120;
      int row = 0, column = 0;
      for (int i = 336; i < CompanyDatas.size(); i++)
      {
        if (CompanyDatas.get(i).ticker.charAt(0) == letterSearch && column < 13)
        {
          TextualSummary temp = new TextualSummary(x, y, CompanyDatas.get(i).ticker, color(204, 103, 150));
          texts.add(temp);
          row++;
          if (row < 32)
            y += 30;
          else
          {
            x += 120;
            y = 120;
            row = 0;
            column++;
          }
        }
      }
      if (column > 12)
      {
        theTextualSummary = new TextualSummary(20, y+360, "See tickerList.csv\nfor complete\nlist of results", color(204, 153, 0));
        output = createWriter("tickerList.csv");
        for (int i = 0; i < CompanyDatas.size(); i++)
        {
          if (CompanyDatas.get(i).ticker.charAt(0) == letterSearch)
            output.println(CompanyDatas.get(i).ticker);
        }
        output.flush();
        output.close();
      }
      displayExtra = true;
    }
    // if exchanges
    if (exchangeList != null)
    {
      if (theTextualSummary.text.equals("...And " + (exchangeList.size()-28) + " more entries, press NEXT> for more"))
      {
        currentScreen = screen2;
        currentGraph = new Graph();
        currentLineChart = new LineChart();
        texts.clear();
        theTextualSummary = new TextualSummary();
        int x = 300, y = 114;
        for (int i = 29; i < 62 && i < exchangeList.size(); i++)
        {
          TextualSummary temp = new TextualSummary(x, y, exchangeList.get(i).line, color(204, 103, 150));
          texts.add(temp);
          y += 29;
        }
        if (exchangeList.size() > 62)
        {
          theTextualSummary = new TextualSummary(x, y, "...And " + (exchangeList.size()-61) + " more entries, too many to display; see exchangeList.csv", color(204, 153, 0));
          output = createWriter("exchangeList.csv");
          for (int i = 0; i < exchangeList.size(); i++) //<>//
          {
            output.println(exchangeList.get(i).line);
          }
          output.flush();
          output.close();
        }
        displayExtra = true;
      }
    }
    // if stockList scatterplot
    if (stockList != null && !displayExtra)
    {
      currentScreen = screen2;
      texts.clear();
      theTextualSummary = new TextualSummary();
      currentScatterPlot = new ScatterPlot(1100, 600, color(150, 200, 0), color(150, 200, 0), 5, currentGraph.dataType);
      currentGraph = new Graph();
      currentLineChart = new LineChart();
      displayExtra = true;
    }
    if (!displayExtra)
    {
      currentScreen = screen2;
      currentGraph = new Graph();
      currentLineChart = new LineChart();
      texts.clear();
      theTextualSummary = new TextualSummary();
    }
    displayExtra = false;
    break;
  // clears screen2 and switches to screen1 - Michael Makarenko
  case BACK_BUTTON_EVENT:
    println("Back button pressed!");
    currentGraph = new Graph();
    currentLineChart = new LineChart();
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    theTextualSummary = new TextualSummary();
    texts.clear();
    currentScatterPlot = new ScatterPlot();
    currentScreen = screen1;
    break;
  // event for Largest Changes button - Michael Makarenko
  case LARGDIFF_BUTTON_EVENT:
    println("Largest Changes button pressed!");
    texts.clear();
    theTextualSummary = new TextualSummary();
    currentGraph = new Graph();
    currentLineChart = new LineChart();
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
    //largest changes for date range
    if (dateList != null)
    {
      // sort by change
      Collections.sort(dateList, new Comparator<DataPoint>()
      {
        @Override
        public int compare(DataPoint o1, DataPoint o2)
        {
            return Double.compare(abs(o1.change), abs(o2.change));
        }
      });
      // list top 30 changes
      int x = 300, y = 230;
      String info;
      for (int i = dateList.size()-1; i > 0 && i > dateList.size()-30; i--)
      {
        info = dateList.get(i).ticker + " Change over " + dateList.get(i).splitLine[7] + ": " + dateList.get(i).change;
        TextualSummary temp = new TextualSummary(x, y, info, color(204, 103, 150));
        texts.add(temp);
        y += 30;
      }
      // re-sort by date as it was before
      Collections.sort(dateList, new Comparator<DataPoint>()
      {
        @Override
        public int compare(DataPoint o1, DataPoint o2)
        {
            return Double.compare(o1.date, o2.date);
        }
      });
    }
    //largest changes for a stock
    else if (stockList != null)
    {
      // sort by change
      Collections.sort(stockList, new Comparator<DataPoint>()
      {
        @Override
        public int compare(DataPoint o1, DataPoint o2)
        {
            return Double.compare(abs(o1.change), abs(o2.change));
        }
      });
      // list top 30 changes
      int x = 300, y = 230;
      String info;
      for (int i = stockList.size()-1; i >= 0 && i > stockList.size()-30; i--)
      {
        info = stockList.get(i).ticker + " Change over " + stockList.get(i).splitLine[7] + ": " + stockList.get(i).change;
        TextualSummary temp = new TextualSummary(x, y, info, color(204, 103, 150));
        texts.add(temp);
        y += 30;
      }
      // re-sort by date as it was before
      Collections.sort(stockList, new Comparator<DataPoint>()
      {
        @Override
        public int compare(DataPoint o1, DataPoint o2)
        {
            return Double.compare(o1.date, o2.date);
        }
      });
    }
    //largest changes for all datapoints
    if (dateList == null && stockList == null)
    {
      //sort by change
      Collections.sort(DataPoints, new Comparator<DataPoint>()
      {
        @Override
        public int compare(DataPoint o1, DataPoint o2)
        {
            return Double.compare(abs(o1.change), abs(o2.change));
        }
      });
      // list top 30 changes
      int x = 300, y = 230;
      String info;
      for (int i = DataPoints.size()-1; i >= 0 && i > DataPoints.size()-30; i--)
      {
        info = DataPoints.get(i).ticker + " Change over " + DataPoints.get(i).splitLine[7] + ": " + DataPoints.get(i).change;
        TextualSummary temp = new TextualSummary(x, y, info, color(204, 103, 150));
        texts.add(temp);
        y += 30;
      }
    }
    break;
  // when clicking a non-button, search bar loses focus and label resets, same as clicking a button - Michael Makarenko
  default:
    if (focus != null)
    {
      focus.label = "Search";
      focus = null;
    }
  }
}

void mouseMoved()
{
  //highlight widgets when moused over - Michael Makarenko
  Widget widget;
  int event;
  event = currentScreen.getEvent();
  for (int i = 0; i < currentScreen.widgetList.size(); i++)
  {
    widget = (Widget) currentScreen.widgetList.get(i);
    widget.borderColour = 0;
  }
  switch(event)
  {
  case HIGHS_BUTTON_EVENT:
    widget = (ButtonWidget) screen1.widgetList.get(0);
    widget.borderColour = 255;
    break;
  case LOWS_BUTTON_EVENT:
    widget = (ButtonWidget) screen1.widgetList.get(1);
    widget.borderColour = 255;
    break;
  case CLEAR_BUTTON_EVENT:
    widget = (ButtonWidget) screen1.widgetList.get(2);
    widget.borderColour = 255;
    break;
  case SEARCH_BOX_EVENT:
    widget = (TextWidget) screen1.widgetList.get(3);
    widget.borderColour = 255;
    break;
  case OPEN_BUTTON_EVENT:
    widget = (ButtonWidget) screen1.widgetList.get(4);
    widget.borderColour = 255;
    break;
  case CLOSE_BUTTON_EVENT:
    widget = (ButtonWidget) screen1.widgetList.get(5);
    widget.borderColour = 255;
    break;
  case VOLUMES_BUTTON_EVENT:
    widget = (ButtonWidget) screen1.widgetList.get(6);
    widget.borderColour = 255;
    break;
  case ADJCLOSE_BUTTON_EVENT:
    widget = (ButtonWidget) screen1.widgetList.get(7);
    widget.borderColour = 255;
    break;
  case NEXT_BUTTON_EVENT:
    widget = (ButtonWidget) screen1.widgetList.get(8);
    widget.borderColour = 255;
    break;
  case BACK_BUTTON_EVENT:
    widget = (ButtonWidget) screen2.widgetList.get(0);
    widget.borderColour = 255;
    break;
  case LARGDIFF_BUTTON_EVENT:
    widget = (ButtonWidget) screen1.widgetList.get(9);
    widget.borderColour = 255;
    break;
  }
}

//contains 99% of search box funstionality - Michael Makarenko
void keyPressed()
{
  //Type into search box, ASCII keys only - Michael Makarenko
  if (focus != null && key != CODED && key != '\n')
    focus.append(key);
  //When you press enter, make stockList of the current label ticker symbol
  //and display that company's information - Michael Makarenko
  if (focus != null && key == '\n' && focus.label != "")
  {
    //clear screen
    texts.clear();
    theTextualSummary = new TextualSummary();
    currentGraph = new Graph();
    currentLineChart = new LineChart();
    //if letter(s) is entered
    if (Character.isLetter(focus.label.charAt(0)))
    {
      //if more than one letter entered
      if (focus.label.toCharArray().length > 1)
      {
        //if exchange entered, list stocks with that exchange
        if (focus.label.equals("NASDAQ") || focus.label.equals("NYSE"))
        {
          makeExchangeList(CompanyDatas, focus.label);
          int x = 300, y = 230;
          for (int i = 1; i < exchangeList.size() && i < 29; i++)
          {
            TextualSummary temp = new TextualSummary(x, y, exchangeList.get(i).line, color(204, 103, 150));
            texts.add(temp);
            y += 30;
            if (exchangeList.size() > 28)
            {
              theTextualSummary = new TextualSummary(x, y, "...And " + (exchangeList.size()-28) + " more entries, press NEXT> for more", color(204, 153, 0));
            }
          }
        }
        //otherwise, treat entry as ticker symbol and search for matching ticker
        else
        {
          int correctIndex = 0;
          makeStockList(DataPoints, focus.label);
          if (stockList.size() > 0)
          {
            for (int i = 1; i < CompanyDatas.size() && correctIndex == 0; i++)
            {
              if (CompanyDatas.get(i).ticker.equals(focus.label))
                correctIndex = i;
            }
          }
          theTextualSummary = new TextualSummary(650, 500, CompanyDatas.get(correctIndex), color(204, 103, 150));
        }
      }
      //if entry is one letter, display all tickers beginning with that letter
      else if (focus.label.toCharArray().length == 1)
      {
        int x = 300, y = 240;
        int row = 0, column = 0;
        for (int i = 0; i < CompanyDatas.size(); i++)
        {
          letterSearch = focus.label.charAt(0);
          if (CompanyDatas.get(i).ticker.charAt(0) == letterSearch && column < 12)
          {
            TextualSummary temp = new TextualSummary(x, y, CompanyDatas.get(i).ticker, color(204, 103, 150));
            texts.add(temp);
            row++;
            if (row < 28)
              y += 30;
            else
            {
              x += 120;
              y = 240;
              row = 0;
              column++;
            }
          }
        }
        if (column > 11)
        {
          theTextualSummary = new TextualSummary(10, y+360, "Press NEXT> for more results", color(204, 153, 0));
        }
      }
    }
    //When you press enter, make dateList of the current label date or date range
    //and display those company's stock entries - Michael Makarenko
    else if (Character.isDigit(focus.label.charAt(0)))
    {
      String[] allDatesString = split(focus.label, "-");
      int[] Dates = new int[allDatesString.length];
      for (int i = 0; i < allDatesString.length; i++)
      {
        String[] dateString = split(allDatesString[i], "/");
        if (dateString.length == 3 && int(dateString[0]) < 9999 && int(dateString[1]) < 13 && int(dateString[2]) < 32)
        {
          int year = int(dateString[0])*10000;
          int month = int(dateString[1])*100;
          int day = int(dateString[2]);
          if (year > 0 && month > 0 && day > 0)
            Dates[i] = year + month + day;
        }
        else if (Dates.length > 1)
        {
          for (int j = 0; j < Dates.length; j++)
            Dates[j] = Dates[0];
        }
      }
      makeDateList(DataPoints, Dates);
      int x = 300, y = 230;
      for (int i = 1; i < 29 && i < dateList.size(); i++)
      {
        TextualSummary temp = new TextualSummary(x, y, dateList.get(i).line, color(204, 103, 150));
        texts.add(temp);
        y += 30;
      }
      if (dateList.size() > 29)
      {
        theTextualSummary = new TextualSummary(x, y, "...And " + (dateList.size()-29) + " more entries, press NEXT> for more", color(204, 153, 0));
      }
    }
  }
}
