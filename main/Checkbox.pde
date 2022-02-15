// Written by Michael makarenko on 18/02/2020
// Circe-in-Square type Checkbox class
public class Checkbox
{
  //instance variables
  boolean checked = true;
  int x;
  int y;
  int width;
  color borderColour = 0;
  color boxColour = 255;
  color checkedColour;
  float checkmarkRadius;
  int event;
  //constructor
  Checkbox(int x, int y, int width, color checkedColour, int event)
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.checkedColour = checkedColour;
    this.event = event;
    checkmarkRadius = width*0.4;
  }
  //returns event when pressed (if mouse co-ordinates are over the button)
  int getEvent(int mX, int mY)
  {
    if((mX > x) && (mX < x+width) && (mY > y) && (mY < y+width))
    {
      return event;
    }
    return NULL_EVENT;
  }
  
  void draw()
  {
    stroke(borderColour);
    fill(boxColour);
    rect(x, y, width, width);
    if (checked)
    {
      noStroke();
      fill(checkedColour);
      ellipse(x+width/2, y+width/2, checkmarkRadius, checkmarkRadius);
    }
  }
}

  // Event handling for checkbox
  //int event = checkbox.getEvent(mouseX, mouseY);
  //if (event == CHECKBOX_EVENT && !checkbox.checked)
  //{
  //  checkbox.checked = true;
  //  println("checked");
  //}
  //else if (event == CHECKBOX_EVENT && checkbox.checked)
  //{
  //  checkbox.checked = false;
  //  println("unchecked");
  //}
