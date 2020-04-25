//+------------------------------------------------------------------+
//|                                                  manualPairs.mq4 |
//|                                              Copyright 2017, xm7 |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, xm7 version 0"
#property strict
#property indicator_chart_window

extern int IDnumber = 1; // The id of the indicator
extern string Pairs="EURUSD,GBPUSD,GBPJPY";
extern string Operations="Buy,Buy,Buy";
extern int Xpos=10;
extern int Ypos=50;

string objPrefix="xm7_Manual_Basket";

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   setBasket();
//---
   return(INIT_SUCCEEDED);
  }
  
void OnDeinit(const int reason){
   RemoveObjects(objPrefix);
}  

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }

void setBasket() {

   string result[],result2[],obj,obj2,objTitle,operation;
   int y, dy=10;
   
   if(StringFind(Pairs,",")>-1) {   
      StringToArray(Pairs,",",result);
   } else {
      ArrayResize(result,1);
      result[0]=Pairs;
   }   
   if(StringFind(Operations,",")>-1) {
      StringToArray(Operations,",",result2);
   } else {
      ArrayResize(result2,1);
      result2[0]=Operations;   
   }   
   
   objTitle = objPrefix+"_title_"+(string)IDnumber;
   if (ObjectFind(objTitle) == -1) ObjectCreate(ChartID(),objTitle,OBJ_LABEL,0,0,0,0);
   ObjectSet(objTitle, OBJPROP_CORNER, 0);
   ObjectSet(objTitle, OBJPROP_XDISTANCE, Xpos);
   ObjectSet(objTitle, OBJPROP_YDISTANCE,Ypos);
   ObjectSetText(objTitle, "== "+objPrefix+" ID "+(string)IDnumber+" ==", 8, "Verdana", White);   
   
   y=Ypos+15;
   
   for (int x=0; x<ArraySize(result); x++) {
      obj = objPrefix+"_"+(string)IDnumber+"CCF_diff"+result[x];
      obj2 = objPrefix+"_"+(string)IDnumber+"CCF_diff"+result[x]+"suggest";

      if (ObjectFind(obj) == -1) ObjectCreate(ChartID(),obj,OBJ_LABEL,0,0,0,0);
      ObjectSet(obj, OBJPROP_CORNER, 0);
      ObjectSet(obj, OBJPROP_XDISTANCE, Xpos);
      ObjectSet(obj, OBJPROP_YDISTANCE,y);
      ObjectSetText(obj, result[x]+" ===> ", 8, "Verdana", White);

      if (ObjectFind(obj2) == -1) ObjectCreate(ChartID(),obj2,OBJ_LABEL,0,0,0,0);
      ObjectSet(obj2, OBJPROP_CORNER, 0);
      ObjectSet(obj2, OBJPROP_XDISTANCE, Xpos+100);
      ObjectSet(obj2, OBJPROP_YDISTANCE,y);
      operation=StringChangeFirstToUpperCase(result2[x]);
      ObjectSetText(obj2, operation, 8, "Verdana", White);

      y+=dy;
  }


}

void StringToArray(string str, string separator, string& arryResult[]) {
   ushort u_sep;
   u_sep=StringGetCharacter(separator,0);
   StringSplit(str,u_sep,arryResult);
}

void RemoveObjects(string sz8) {  
   int t1=ObjectsTotal();
   while(t1>=0) {  
      if (StringFind(ObjectName(t1),sz8,0)>-1) ObjectDelete(ObjectName(t1)); 
      t1--;
    }
}

 
string StringChangeFirstToUpperCase(string sText) {
  // Example: StringChangeFirstToUpperCase("oNe mAn"); // One Man
  int iLen=StringLen(sText), i, iChar, iLast=32;
  for(i=0; i < iLen; i++) {
    iChar=StringGetChar(sText, i);
    if(iLast==32 && iChar >= 97 && iChar <= 122) sText=StringSetChar(sText, i, iChar-32);
    else if(iLast!=32 && iChar >= 65 && iChar <= 90) sText=StringSetChar(sText, i, iChar+32);
    iLast=iChar;
  }
  return(sText);
}    
