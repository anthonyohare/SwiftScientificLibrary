CC=clang++ -std=c++14
CFLAGS=-c -Wall -pedantic -I/usr/local/include
LDFLAGS= -L/usr/local/lib
LIBS= -lgsl -lgslcblas
SOURCES=gsl_tests.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=gsl_tests

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) $(LIBS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm $(OBJECTS) $(EXECUTABLE)
