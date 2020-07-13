TARGET = bin/ZGloom
LIBS =  -lSDL2_mixer  -lSDL2  -L/usr/local/include -noixemul -lc -lm   -lxmp
CCX = g++
STRIP = strip
CXXFLAGS = -I/usr/local/include -noixemul -O2 -Wall -fpermissive
#-fpermissive

.PHONY: default all clean

default: $(TARGET)
all: default

HEADERS = $(wildcard *.h)
OBJS = $(patsubst %.cpp, %.o, $(wildcard *.cpp))

%.o: %.c $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJS)

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) $(LIBS) -o $@
	$(STRIP) --strip-all $(TARGET) -o $(TARGET)
	
clean:
	rm -f *.o
	rm -f $(TARGET)
