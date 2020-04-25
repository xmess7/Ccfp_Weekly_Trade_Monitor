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

string sfx,prfx;
string keyTitle,keyTrade;

string objPrefix="xm7_Manual_Basket";

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
  
   GetPrefixSuffix(Symbol(),prfx,sfx);
     
   keyTitle="_Signals_TITLE_";
   keyTrade="_Signals_TRADE_";
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
   
   if(ArraySize(result)!=ArraySize(result2)) {
      MessageBox("Pairs and Operations inputs must have\nsame number of elements",objPrefix);
      return;
    }  
   
  objTitle = (IDnumber<10?"0"+(string)IDnumber:(string)IDnumber)+"_"+objPrefix+keyTitle;
   if (ObjectFind(objTitle) == -1) ObjectCreate(ChartID(),objTitle,OBJ_LABEL,0,0,0,0);
   ObjectSet(objTitle, OBJPROP_CORNER, 0);
   ObjectSet(objTitle, OBJPROP_XDISTANCE, Xpos);
   ObjectSet(objTitle, OBJPROP_YDISTANCE,Ypos);
   ObjectSetText(objTitle, "== "+(IDnumber<10?"0"+(string)IDnumber:(string)IDnumber)+" xm7 Signals ==", 13, "Verdana", White);   
   
   y=Ypos+10;
   
   for (int x=0; x<ArraySize(result); x++) {
   
      y=y+10;
      
      string localsymbol=prfx+result[x]+sfx;
       
      obj = (IDnumber<10?"0"+(string)IDnumber:(string)IDnumber)+objPrefix+keyTrade+localsymbol;
      
      // operation=(MathAbs(randomInteger(1,100))<50?"BUY":"SELL");
      StringToUpper(result2[x]);
      
      if (ObjectFind(obj) == -1) ObjectCreate(ChartID(),obj,OBJ_LABEL,0,0,0,0);
      ObjectSet(obj, OBJPROP_CORNER, 0);
      ObjectSet(obj, OBJPROP_XDISTANCE, Xpos);
      ObjectSet(obj, OBJPROP_YDISTANCE,y);
      ObjectSetText(obj,"   "+localsymbol+"  =>  "+result2[x], 13, "Verdana", (result2[x]=="BUY"?clrGreen:clrRed));

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

void GetPrefixSuffix(string symbol, string& prefx, string& suffx){
     string base=BaseSymbolName(symbol);
     if(base=="") return;
            
     prefx="";  suffx="";
     if(StringLen(base)==StringLen(symbol)) return;
     
     int startSymbol=StringFind(symbol,base); 
     suffx=StringSubstr(symbol,startSymbol+6,StringLen(symbol)-(startSymbol+6));
            
     if(startSymbol==0) return; // no prefix
     prefx=StringSubstr(symbol,0,startSymbol);
   
}

string BaseSymbolName(string item){
   string list1[] = { "EURUSD","GBPUSD","USDCHF","USDJPY","AUDUSD","USDCAD","EURAUD","EURCHF","EURGBP",
                      "EURJPY","GBPCHF","GBPJPY","AUDCAD","AUDCHF","AUDJPY","AUDNZD","CADCHF","CADJPY",
                      "CHFJPY","EURCAD","EURNZD","NZDCAD","NZDCHF","NZDJPY","NZDUSD","GBPAUD","GBPCAD",
                      "GBPNZD","USDDKK" } ;

    for(int x=0; x<ArraySize(list1); x++)  {
         if(StringFind(item,list1[x])>-1) return(list1[x]);
    }
    return("");
}
    
