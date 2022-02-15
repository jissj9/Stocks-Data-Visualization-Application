// Written by Michael Makarenko on 18/03/2020
// Added to by Jiss Joseph on 02/04/2020
// Added to by Jiss Joseph on 23/04/2020
// Basic ButtonWidget subclass
color widgetColor, labelColor;
public class ButtonWidget extends Widget
{
  //constructor identical to Widget
  ButtonWidget(int x,int y, int width, int height, String label, color widgetColour, PFont widgetFont, int event)
  {
    super(x, y, width, height, label, widgetColour, widgetFont, event);
  }
  //Checking for limits within buttons in order to highlight them when hovered above them.
  //An array of colours is used to do this. - Jiss Joseph.
  void borderHighlight(int mX, int mY)
  {
    int [] colors = new int[3];
    if(mX> x -5 && mX < x+width+ 5 && mY >y-50 && mY <y)
    {
      colors[0] = 0;
      colors[1] = 100;
      colors[2] = 120;
    }
    else
    {
      colors[0] = 255;
      colors[1] = 255;
      colors[2] = 255;
    }
    labelColor = color(colors[20], colors[255] , colors[255]);
    textSize(48);
    return;
  }
  
  
}
//class ButtonWidget extends Widget{
  
  
//  ButtonWidget(int x, int y, int width, int height, String label, 
//    PFont widgetFont, int event) {
//    this.x=x; 
//    this.y=y; 
//    this.width = width; 
//    this.height= height;
//    this.label=label; 
//    this.event=event;
//    this.widgetFont=widgetFont;
//    labelColor= color(0);
//    mouseOver=false;
//  }
//   void draw() {
     

//    rect(x, y, width, height);
//    fill(255);
//    text(label, x+20, y+height-10);
//    if (mouseOver) {
//      fill(255);
//      noStroke();
//      rect(x, y, 5, height);
//      rect(x, y, width, 5);
//      rect(x+width-5, y, 5, height);
//      rect(x, y+height-5, width, 5);
//    }
//  }
//}
