THE XM7 CCFPT WEEKLY TRADE MONITOR EXPERT ADVISOR
----------------------------------------

The ccfp_weekly_trade_monitor Expert Advisor (EA) is a tool that was developed to support the basket approach idea provided by Forexpinbar (forexfactory thread: https://www.forexfactory.com/showthread.php?t=635569).  The project started back on January 2017 and finally after more than 52 iterations (I say more cause there were subversions) we have arrived to what I consider the final versions(two platforms MT4 and MT5).

These versions are stable, as far as the "CORE" functions are concerned. A group of us (see the last pages of forexfactory thread) have been running the EA under live accounts with success for the last year and a half.   I do not plan to make anymore upgrades, at least not to the functionality or approach the code has.  I may add additional help functions as time permits.

The ccfp_trade_monitor EA is a glorified monitor.   It does not determine in of itself, what trades to initiate.  The EA takes a list of SUGGESTED trade operations from an indicator (currently CCFP-Diff or CMSM), and given certain requirements, creates a basket of trades.   The EA then monitors the overall profit of the basket of trades and applies money management to control risk.  So without an indicator the EA monitor cannot do anything.

UPDATES:
----------------------------------------
Update(202.04.12): As of a couple of weeks ago I have decide to undergo a clean up effort of the EAs.  This effort involves going over all of the code and implementing leaner and better code.  In addition all of the development code that was left over is removed.  To date we are making great progress in that signifcant improvements on speed, reliability, etc... are being seen.  , the EAs load up faster, As a consequence major improvements. Many operation were revisted and improved upon.  This video illustrates these improvements.
I attempt to stress test the latest version to show the EAs operation improvements.

https://youtu.be/S59-nCc7bjI


VIDEOS:
----------------------------------------

Basket Trail Stop Operation example:
The video explains how the TrailStop section has changed and demonstrates the EA executing a trail stop on a basket.
https://www.youtube.com/watch?v=eysEx_x7l7I

How to use in EA strat Tester (update to come soon that will allow the buttons to operate):
https://www.youtube.com/watch?v=yqiu9Eq0HeU

Still there is not up to daye setup\installation available. I've left a folder that contains quick guide PDFs. Again, these guides are outdated but they do convey the basic information that can help the user setup the EA/Indicators. In addition I have provided the templates I use for live trading.  IF the user is familiar with the metatrader setup, they should in no time have this EA up and running.  As time permits I will create more up to date video instructions that pertain to installation\setup.

Yohec, Negative Trigger Setup (if using this feature, pls see this video, it explains setup and how it works)
https://www.youtube.com/watch?v=cqX2R40D1Qo
https://www.youtube.com/watch?v=XneGX7JeuF4 (alot more details on setup of 2 basket mode)

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
