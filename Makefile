#
#MAIN_SRCがC++ならCファイルはextern "C"{}しろよ!!
#

#gcc関係
CC = gcc $(CFLAGS)
CFLAGS = -g
CLIBS = -lm

#g++関係
CXX = g++ $(CFLAGS)
CPPFLAGS = -g
CPPLIBS = -lm

#メインソース
MAIN_SRC = main.cpp
MAIN_OBJ = $(MAIN_SRC:%$(suffix $(MAIN_SRC))=%.o)
TARGET = $(MAIN_SRC:%$(suffix $(MAIN_SRC))=%)

#Cソース
C_SRC = test_c.c
C_OBJ = $(C_SRC:%$(suffix $(C_SRC))=%.o)

#C++ソース
CPP_SRC = test_cpp.cpp
CPP_OBJ = $(CPP_SRC:%$(suffix $(CPP_SRC))=%.o)

%.o:	%.c
	$(CC) -c $< $(CLIBS)

%.o:	%.cpp
	$(CXX) -c $< $(CPPLIBS)

all:	$(TARGET)

$(TARGET) :	$(MAIN_OBJ) $(C_OBJ) $(CPP_OBJ)
	$(CXX) -o $@ $^ $(CPPLIBS)

clean:
	-rm $(MAIN_OBJ) $(TARGET) $(C_OBJ) $(CPP_OBJ) 
