BMP images crash:
https://github.com/CruiserOne/Astrolog/issues/5

X-windows builds are currently crashing when loading the 'earth.bmp'

Program received signal SIGSEGV, Segmentation fault.
0x00005555555e3621 in _SetRGB (pb=0x381 <error: Cannot access memory at address 0x381>, r=10, g=10, b=51) at xdevice.cpp:76
76        { *pb = b; *(pb+1) = g; *(pb+2) = r; }

According to the thread in CruiserOne's github:

appending -XG  requires appending either ":Xbn" or ":Xbb",  i.e.:

    $ astrolog -Xi -Xn -XG :Xbn

This allows the 24bit color bitmap to be drawn in the correct mode under X11

This change has been added to astrolog.as as ":Xbn" (xwindows)

----
Crash on startup:
https://groups.io/g/Astrolog/topic/moon_true_apogee_black_moon/82304658

The crash if the '*.as' files were not located in the default paths has been corrected in io.cpp

----
Aspect list chart displays incorrectly
https://groups.io/g/Astrolog/topic/fyi_about_astrolog_7_2/82046890

-aO aspect   bugs  have also been corrected, though ordering may still be incorrect; this requires further work

