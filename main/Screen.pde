// Written on 18/03/2020 by Michael Makarenko
// Basic Screen Class
public class Screen
{
  //Screen owns its own list of widgets which it handles by proxy methods
  ArrayList<Widget> widgetList = new ArrayList<Widget>();
  color backgroundColour;
  int height = 50;
  PFont font;
  //constructor
  Screen(color backgroundColour, PFont font)
  {
    this.font = font;
    this.backgroundColour = backgroundColour;
    textFont(this.font);
  }
  //add a button widget to the screen, proxy method creates the widget and adds it to the screens' ArrayList
  void addButtonWidget(int x, int y, int width, String text, color colour, int event)
  {
    ButtonWidget theWidget =
      new ButtonWidget(x, y, width, height, text, colour, font, event);
    widgetList.add(theWidget);
  }
  // add a text widget to the screen, proxy method creates the widget and adds it to the screens' ArrayList
  void addTextWidget(int x, int y, int width, String text, color colour, int event, int maxlen)
  {
    TextWidget theWidget = 
      new TextWidget(x, y, width, height, text, colour, font, event, maxlen);
    widgetList.add(theWidget);
  }
  // proxy method to check if any widget owned by the screen have been clicked
  int getEvent()
  {
    int event;
    for(int i = 0; i < widgetList.size(); i++)
    {
      Widget theWidget = widgetList.get(i);
      event = theWidget.getEvent(mouseX,mouseY);
      if (event != NULL_EVENT)
        return event;
    }
    return NULL_EVENT;
  }
  // screen draws itself and its own widgets
  void draw()
  {
    background(backgroundColour);
    // draw widgets
    for(int i = 0; i < widgetList.size(); i++)
    {
      Widget theWidget = widgetList.get(i);
      theWidget.draw();
    }
  }
}
