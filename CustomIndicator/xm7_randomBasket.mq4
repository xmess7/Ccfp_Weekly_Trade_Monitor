//+------------------------------------------------------------------+
//|                                                  randomPairs.mq4 |
//|                                              Copyright 2017, xm7 |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, xm7 version 0"
#property strict
#property indicator_chart_window

extern int IDnumber = 1; // The id of the indicator
extern int Xpos=10;
extern int Ypos=50;

string sfx,prfx;
string keyTitle,keyTrade;

string objPrefix="xm7_random";

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   GetPrefixSuffix(Symbol(),prfx,sfx);
   RemoveObjects(objPrefix);
   
   keyTitle="_Signals_TITLE_";
   keyTrade="_Signals_TRADE_";
   
   generateBasket();
   
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

void generateBasket() {
  string result[],obj,objTitle,operation,localsymbol;
   int y, dy=10;
   
   if(IsNewBar()) {
      RemoveObjects(objPrefix);
      getRandomSignals(result);
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
      
      localsymbol=prfx+result[x]+sfx;
       
      obj = (IDnumber<10?"0"+(string)IDnumber:(string)IDnumber)+objPrefix+keyTrade+localsymbol;
      
      operation=(MathAbs(randomInteger(1,100))<50?"BUY":"SELL");
      //operation=MA(localsymbol); //sample EMA approach
      //if(operation=="") continue;
      
      if (ObjectFind(obj) == -1) ObjectCreate(ChartID(),obj,OBJ_LABEL,0,0,0,0);
      ObjectSet(obj, OBJPROP_CORNER, 0);
      ObjectSet(obj, OBJPROP_XDISTANCE, Xpos);
      ObjectSet(obj, OBJPROP_YDISTANCE,y);
      ObjectSetText(obj,"   "+localsymbol+"  =>  "+operation, 13, "Verdana", (operation=="BUY"?clrGreen:clrRed));

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

void getRandomSignals(string& _result[]) {
        string symbols[] = { "EURUSD","GBPUSD","USDCHF","USDJPY","AUDUSD","USDCAD","EURAUD","EURCHF","EURGBP",
                             "EURJPY","GBPCHF","GBPJPY","AUDCAD","AUDCHF","AUDJPY","AUDNZD","CADCHF","CADJPY",
                             "CHFJPY","EURCAD","EURNZD","NZDCAD","NZDCHF","NZDJPY","NZDUSD","GBPAUD","GBPCAD",
                             "GBPNZD" } ;
                               
         //get random number of symbols to trade
         int number=MathAbs(randomInteger(7,20))+7;
         if(number<7) number=7; // min 5
         if(number>13) number=13; // max 8 
           
         //randomize the symbols to trade
         int cnt=0;
         for(int x=0; x<number-1; x++) {
            ArrayResize(_result,x+1);
            _result[x]=symbols[MathAbs(randomInteger(0,ArraySize(symbols)))];
            if(x==0) continue;
            
            bool repeat=true;
            while(repeat) {
               for(int y=0; y<x; y++){
                  repeat=false;
                  if(_result[x]==_result[y]) {
                     _result[x]=symbols[MathAbs(randomInteger(0,ArraySize(symbols)))];
                     repeat=true;
                     break; // break for loo[
                  }
               }
               if(!repeat) break; //get out of while loop
            }
          }  
}

int randomInteger(int begin, int end) {
  double randvalue,RAND_MAX=32767.0;
  begin = MathAbs(begin);
  end = MathAbs(end);
  
  randvalue=MathRand()/((RAND_MAX)+1);//generates a psuedo-random double between 0.0 and 0.999..
  
  if(begin>end) return((int)(0+begin*randvalue));
  return((int)(begin + (begin-end)*randvalue)); 
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

bool IsNewBar() {
   static datetime lasttime=0;
   if(lasttime!=Time[0]) {
      lasttime=Time[0];
      return(true);
   }
   return(false);   
}

string MA(string _symbol) {

      double ema= iMA(_symbol,PERIOD_CURRENT,14,0,MODE_EMA,PRICE_CLOSE,1);
      
      if(MarketInfo(_symbol,MODE_BID)>ema) return("BUY");
      
      if(MarketInfo(_symbol,MODE_BID)<ema) return("SELL");
      
      return("");
   
}