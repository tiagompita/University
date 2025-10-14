# Makefile for pipe lesson
CXX = g++

CXFLAGS = -Wall -ggdb

progs := redirect pipe1 pipe2 sender receiver

p_objs := $(progs:%:%.o)

all:	$(progs)

$(progs):	%:	%.o process.o utils.o
	$(CXX) -o $@ $^ 

$(p_objs):	%.o:	%.cpp
	$(CXX) -c $(CXFLAGS) -o $@ $<

utils.o process.o:	%.o:	%.h dbc.h utils.h

clean:
	rm -f *~ *.o

cleanall: clean
	rm -f $(progs) my.fifo my.file
