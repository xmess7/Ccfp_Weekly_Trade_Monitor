THE XM7 CCFPT WEEKLY TRADE MONITOR EXPERT ADVISOR

The ccfp_weekly_trade_monitor Expert Advisor (EA) is a tool that was developed to support the basket approach idea provided by Forexpinbar (forexfactory thread: https://www.forexfactory.com/showthread.php?t=635569).  The project started back on January 2017 and finally after more than 52 iterations (I say more cause there were subversions) we have arrived to what I consider the final versions(two platforms MT4 and MT5).

These versions are stable, as far as the "CORE" functions are concerned. A group of us (see the last pages of forexfactory thread) have been running the EA under live accounts with success for the last year and a half.   I do not plan to make anymore upgrades, at least not to the functionality or approach the code has.  I may add additional help functions as time permits.

The ccfp_trade_monitor EA is a glorified monitor.   It does not determine in of itself, what trades to initiate.  The EA takes a list of SUGGESTED trade operations from an indicator (currently CCFP-Diff or CMSM), and given certain requirements, creates a basket of trades.   The EA then monitors the overall profit of the basket of trades and applies money management to control risk.  So without an indicator the EA monitor cannot do anything.

VIDEOS:

The following video provides information on the latest updates and how to use the EA in the strategy tester. 
Video on final version: 
https://www.youtube.com/watch?v=yqiu9Eq0HeU

The video however does not cover the setup\installation of the EA and indicators. A folder is provided that contains quick guide PDFs.  The guides provide quick installation/setup instructions.  The guides are outdated but thye do convey the basic information that can help the user setup the EA/Indicators. In addition I have provided the templates I use for live trading.  IF the user is familiar with the metatrader setup, they should in no time have this EA up and running.  As time permits I will create more up to date video instructions that pertain to installation\setup.

TEMPLATES:

Under the MT Folders you will find ready to go templates.  These are the templates I was using on my live accounts.
template 1701_EA.tpl was used Monday's and Wednesday's
template 1901_EA.tpl was used Tuesday's and Thursday's
No trading on Friday's.



YOhEC:
----------------------------------------
Negative Trigger Approach: 

Details of Approach (2019.05.08):

https://www.forexfactory.com/showthread.php?p=12261916#post12261916

----------------------------------------
2Basket Approach 

Details of Approach (2018.05.18):

https://www.forexfactory.com/showthread.php?p=11075093#post11075093

Indicator/EA setup. Images Included (2018.05.18):

https://www.forexfactory.com/showthread.php?p=11074598#post11074598

Last update (2019.02.13):

https://www.forexfactory.com/showthread.php?p=11995302#post11995302


=============================

MRDFX:

EA Preset (2019.02.20):

https://www.forexfactory.com/showthread.php?p=12025485#post12025485


INSTALLATION:

Install the Experts and Indicators in their respective folders.  Install the Template in the corresponding folder.
Open up a chart in MetaTrader and apply the template.  That will load the EA and all of the indicator and presets, and you are ready to go.

On some occasions user would experience issues of not enough history.  This is due to the requirement that the currency indicators (CMSM or CCfp-Diff) may requir.  I have included a Script that will populate all of the symbols with the required history. See the Scripts folder (NOTE: this script is only for MT4, don't recall what we did with MT5, see the thread :)  ).  

FONTS:

Sometimes systems do not have the EA fonts. See the EA FONTS folder for in case you are seeing oversized fonts or wierd symbols on the charts.

There is alot more to cover but for now I urge you to go to the FFX thread:
 
 https://www.forexfactory.com/showthread.php?t=635569
 
 And discover what has been done with the EA.  Page 1 contains some links to other approaches (negative trigger etc).
 Check it out.

More videos to come soon to explain more of how to use this EA.

Xmess7
