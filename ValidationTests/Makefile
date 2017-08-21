CC=clang++ -std=c++14
CFLAGS=-c -Wall -pedantic -I/usr/local/include
LDFLAGS= -L/usr/local/lib
LIBS= -lgsl -lgslcblas
SOURCES=gsl_tests.c gsl_matrix_tests.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLES=$(SOURCES:.c=)

all: $(SOURCES) gsl_tests gsl_matrix_tests

gsl_tests: gsl_tests.o
	$(CC) $(LDFLAGS) gsl_tests.o $(LIBS) -o $@

gsl_matrix_tests: gsl_matrix_tests.o
	$(CC) $(LDFLAGS) gsl_matrix_tests.o $(LIBS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm $(OBJECTS) $(EXECUTABLES)
