# Astrolog (Version 7.20) File: Makefile (Unix version)
#
# IMPORTANT NOTICE: Astrolog and all chart display routines and anything
# not enumerated elsewhere in this program are Copyright (C) 1991-2020 by
# Walter D. Pullen (Astara@msn.com, http://www.astrolog.org/astrolog.htm).
# Permission is granted to freely use, modify, and distribute these
# routines provided these credits and notices remain unmodified with any
# altered or distributed versions of the program.
#
# First created 11/21/1991.
#
# This Makefile is included only for convenience. One could easily compile
# Astrolog on most Unix systems by hand with the command:
# % cc -c -O *.cpp; cc -o astrolog *.o -lm -lX11
# Generally, all that needs to be done to compile once astrolog.h has been
# edited, is compile each source file, and link them together with the math
# library, and if applicable, the main X library.
#
NAME = astrolog
SRCS = astrolog.cpp atlas.cpp calc.cpp charts0.cpp charts1.cpp charts2.cpp charts3.cpp\
 data.cpp express.cpp general.cpp intrpret.cpp io.cpp matrix.cpp placalc.cpp placalc2.cpp\
 xdata.cpp xgeneral.cpp xdevice.cpp xcharts0.cpp xcharts1.cpp xcharts2.cpp xscreen.cpp\
 swecl.cpp swedate.cpp swehouse.cpp swejpl.cpp swemmoon.cpp swemplan.cpp sweph.cpp\
 swephlib.cpp

OBJS = $(SRCS:.cpp=.o)

# If you don't have X windows, delete the "-lX11" part from the line below:
# If not compiling with GNUC, delete the "-ldl" part from the line below:
CXX = g++ 


# Prod
CPPFLAGS = -O -Wno-write-strings -Werror # -Wno-narrowing -Wno-comment
LIBS = -lm -lX11 -ldl

# Debug
#CPPFLAGS = -g3 -Wno-write-strings -Werror
#LIBS = -g -lm -lX11 -ldl

all: $(NAME)

$(NAME): $(OBJS)
	$(CXX) -o $@ $^ $(LIBS)

%.0: %.cpp
	$(CXX) -c $<

clean:
	-rm -f *.o *~

realclean: clean
	-rm -f $(NAME)

dist: $(NAME)
	strip $(NAME)

