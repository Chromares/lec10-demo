EXECUTABLES = branch-mispredict

all: $(EXECUTABLES)

branch-mispredict: branch-mispredict.cpp
	g++ -g -lrt -o$@ $^

clean:
	rm -f $(EXECUTABLES) *.o mpe-*
