
// Basic TextWidget subclass
public class TextWidget extends Widget
{
  //additional instance variable
  int maxlen;
  //constructor adds maxlen, the maximum number of characters the label may contain
  TextWidget(int x,int y, int width, int height, String label, color widgetColour,
          PFont widgetFont, int event, int maxlen)
  {
    super(x, y, width, height, label, widgetColour, widgetFont, event);
    this.maxlen = maxlen;
  }
  
  //functionaliy to add or delete characters from label
  void append(char s)
  {
    if(s == BACKSPACE)
    {
      if(!label.equals(""))
        label = label.substring(0, label.length()-1);
    }
    else if (label.length() < maxlen)
      label = label + str(s);
  }
  int getEvent(int mX, int mY)
  {
     if (mX > x && mX < x + width  && mY > y-height && mY < y + height)
     {
       return event;
     }
     return NULL_EVENT;
  }
}
