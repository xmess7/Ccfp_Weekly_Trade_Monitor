THE XM7 CCFPT WEEKLY TRADE MONITOR EXPERT ADVISOR
----------------------------------------

The ccfp_weekly_trade_monitor Expert Advisor (EA) is a program that was developed to support the basket approach idea provided by Forexpinbar (forexfactory thread: https://www.forexfactory.com/showthread.php?t=635569).  The project started back on January 2017 and finally after 99.92 updates a fully functional EA has emerged, LOL.  This is a fully functioning final version.  Please note that no update was made for the MT5.  If times allows and there is interest  I will update the MT5 version with the MT4 fixes. 

Get the MT4 version at: https://github.com/xmess7/Ccfp_Weekly_Trade_Monitor/tree/master/MT4/Experts
Get the MT5 version at: https://github.com/xmess7/Ccfp_Weekly_Trade_Monitor/tree/master/MT5/Expert

(2023.06.02)  comments:
The plan for now is to create version 100.  It will just be a version that contains alot less inputs.  Same functionalilty with a more simpler and clearer input list.
As mentioned before this is a fully functioning EA.  It was forward tested for many months.  It was also tested in a prop firm trail challenge (FTMO). and it passed.  So this EA is ready and able to pass prop firm challenges.  See Challenge results here: https://github.com/xmess7/Ccfp_Weekly_Trade_Monitor/blob/master/PDF_Guides/ccfp_ftmo.pdf


The ccfp_trade_monitor EA is a glorified monitor.   It does not determine in of itself, what trades to initiate.  The EA takes a list of SUGGESTED trade operations from an indicator (currently CCFP-Diff or CMSM), and given certain requirements, creates a basket of trades.   The EA then monitors the overall profit of the basket of trades and applies money management to control risk.  So without an indicator the EA monitor cannot do anything.

UPDATES:
----------------------------------------
Update(2020.04.12): As of a couple of weeks ago I have decide to undergo a clean up effort of the EAs.  This effort involves going over all of the code and implementing leaner and better code.  In addition all of the development code that was left over is removed.  To date we are making great progress in that signifcant improvements on speed, reliability, etc... are being seen.  , the EAs load up faster, As a consequence major improvements. Many operation were revisted and improved upon.  This video illustrates these improvements.
I attempt to stress test the latest version to show the EAs operation improvements.


Update(2023.06.02): The following are the updates that were added to version 99.92:
- updated the Monitor Trail function
- Added and updated the CandleColor Code from v96.1.  Fixed the issue that the filter partially works.  It would randonly allow valid filter conditions.

- Fixed "Add new Trade Suggestions on realBasket" to operate correctly and add trades when conditions were met.  

- Updated basket BE,TrailStop names and added a second target lock. 
     basketBETrigger, move basketStop to BE
     basketBELock, basket lock Level afte/when BETrigger reached
     basket2ndTrigger, move basketstop to 2nd target
     basket2ndLock, 2nd basket lock level after/when 2ndTrigger is reached
     StepDelta, delta basket move for trail to be moved
     TrailStop, fixed trail stop
               
- Added MinTradesAllowed 


VIDEOS:
----------------------------------------

(2023.06.0).  Stay tuned I will be creating new vidoes wih installation and usage information

INSTALLATION:
----------------------------------------

Install the Experts and Indicators in their respective folders(MQL4(5)/Experts, MQL4(5)/Indicators.  Install the Template in the corresponding folder(MQL4(5)/templates. 
Open up a chart in MetaTrader, make sure chart symbol has prefix you need to trade the fx pairs, and apply the template.  That will load the EA and all of the indicator and presets, and you are ready to go.

On some occasions user would experience issues of not enough history.  This is due to the data requirement that CMSM or CCfp-Diff may need.  I have included a Script that will populate all of the symbols with the required history. See the Scripts folder 
(NOTE: this script is only for MT4, will look into developing an MT5 version, but so far this issue has not happened on that platform ).  

FONTS:
----------------------------------------

There are two conditions that may affect the font sizes you see for the EA display on chart:

1. Sometimes systems do not have the EA fonts. See the EA FONTS folder for in case you are seeing oversized fonts or wierd symbols on the charts.

2. The screen resolution on some systems affects the size of the fonts.  It makes fonts either look extremely small or big.  In that case the code has to be updated to handle this.  At this moment there is not definite way of programatically detecting this and thereby making the code adjust itself.  I added a fontType input so that the user can select a different fontTyp.  This has proven to help somewhat in controlling how the EA fonts are seen in system with these hi screen resolutions. 


TEMPLATES:
----------------------------------------

XM7
----------------------------------------

Under the MT Folders you will find ready to go templates.  These are the templates I was using on my live accounts.
template 1701_EA.tpl was used Monday's and Wednesday's
template 1901_EA.tpl was used Tuesday's and Thursday's
No trading on Friday's.

----------------------------------------

YOhEC:
----------------------------------------
Negative Trigger Approach: 

Details of Approach (2019.05.08):

https://www.forexfactory.com/showthread.php?p=12261916#post12261916
https://www.youtube.com/watch?v=cqX2R40D1Qo  (basic info, this is when the feature was released on that version)
https://www.youtube.com/watch?v=XneGX7JeuF4 (more detailed on setup of 2 basket mode)

----------------------------------------
2Basket Approach 

Details of Approach (2018.05.18):

https://www.forexfactory.com/showthread.php?p=11075093#post11075093

Indicator/EA setup. Images Included (2018.05.18):

https://www.forexfactory.com/showthread.php?p=11074598#post11074598

Last update (2019.02.13):

https://www.forexfactory.com/showthread.php?p=11995302#post11995302

----------------------------------------

MRDFX:
----------------------------------------
EA Preset (2019.02.20):

https://www.forexfactory.com/showthread.php?p=12025485#post12025485

----------------------------------------


Custom Indicator:
-------------------------------------
Check out this video on how to build your own indicator with your own rules.

https://www.youtube.com/watch?v=iAXwdilGqwM

The source code for this is in the folder CUSTOMER INDICATOR/

----------------------------------------

There is alot more to cover but for now I urge you to go to the FFX thread:
 
 https://www.forexfactory.com/showthread.php?t=635569
 
 And discover what has been done with the EA. More videos to come soon to explain more of how to use this EA.

Jess

And as always.....
The material presented here is for educational purposes.  The author makes no claim as to the profitability of subject programs.  Trading involves risk, please consult a professional for guidance on these matters. 
