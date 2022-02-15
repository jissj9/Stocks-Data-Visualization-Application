// Basic Widget superclass
public class Widget
{
  //instance variables
  int x;
  int y;
  int width;
  int height;
  int event;
  String label;
  color widgetColour;
  color labelColour;
  PFont widgetFont;
  color borderColour = 0;
  
  //constructor
  Widget(int x,int y, int width, int height, String label, color widgetColour,
          PFont widgetFont, int event)
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.label = label;
    this.event = event;
    this.widgetColour = widgetColour;
    this.widgetFont = widgetFont;
    labelColour = color(0);
  }
  
  void draw()
  {
    stroke(borderColour);
    fill(widgetColour);
    rect(x, y, width, height);
    fill(labelColour);
    text(label, x+10, y+height/1.5);
  }
  //returns event when clicked (given that mouse co-ordinates are over the widget)
  int getEvent(int mX, int mY)
  {
    if((mX > x) && (mX < x+width) && (mY > y) && (mY < y+height))
    {
      return event;
    }
    return NULL_EVENT;
  }
  //void drawSearchpage() {
   
  //  for (int i = 0; i<screenWidgets.size(); i++) {
  //    Widget aWidget = (Widget)screenWidgets.get(i);
  //    aWidget.draw();
  //  }
  //}
}
