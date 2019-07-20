Sometimes the systems do not have the same fonts that the EA uses to display information on the chart.
When this happens user's experience oversized fonts.  In order to correct this, the user must place
the EA fonts in their corresponding system fonts folder.

Unzip the ea_fonts.zip file and place the contents where your system fonts are located.
The zip already contains a folder called fonts.  So just unzip that folder intro the same location
where your machine's fonts folder is located.  For windows that would be C:\windows\fonts

For Wine users (linux/mac) Look for your windows folder using your give file explorer.
See example image of Wine_on_Mac_WindowsDir.png.  Place the unzipped fonts folder in that same.

All you are doing is added additional fonts (located in the unzipped fonts folder) into the FONTS
folder of your system.  So you should not see any messages requesting that you copy over existing fonts, since
you do not have them in the first place.
