CXX = g++
CXXFLAGS = -Wall

PROGS = atexit cmd-args-env fork0 fork1 fork2 fork3 fork4a fork4
PROGS += mem mem-fork 

LDFLAGS = -pthread

.PHONY: all cleanall

all:	$(PROGS)

cleanall:
	rm -f $(PROGS)
