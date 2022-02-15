// Written by Michael Makarenko on 18/03/2020
// Same as DataPoint class, but works specifically for stocks.csv
public class CompanyData
{
  //instance variables
  String line;
  String ticker;
  String exchange;
  String name;
  String sector;
  String industry;
  String[] splitLine;
  //default constructor
  CompanyData()
  {
    this.line = null;
  }
  
  // Same as DataPoint, but for stocks.csv
  CompanyData(String line)
  {
    this.line = line;
    splitLine = split(this.line, ",");
    if (splitLine.length == 6)
    {
      ticker = splitLine[0];
      exchange = splitLine[1];
      name = splitLine[2] + splitLine[3];
      sector = splitLine[4];
      industry = splitLine[5];
    }
    else
    {
      ticker = splitLine[0];
      exchange = splitLine[1];
      name = splitLine[2];
      sector = splitLine[3];
      industry = splitLine[4];
    }
  }
}
