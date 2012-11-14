EXECUTABLES = \
	mpi-bandwidth mpi-bi-bandwidth mpi-latency \
	numa-test threads-vs-cache lock-contention \
	transpose-soln

all: $(EXECUTABLES)

numa-test: numa-test.c
	gcc -O3 -std=gnu99 -fopenmp $(DEBUG_FLAGS) -lrt -lnuma -o$@ $^

threads-vs-cache: threads-vs-cache.c
	gcc -O0 -std=gnu99 -fopenmp $(DEBUG_FLAGS) -lrt -o$@ $^

lock-contention: lock-contention.c
	gcc -O0 -std=gnu99 -fopenmp $(DEBUG_FLAGS) -lrt -lm -o$@ $^

transpose-soln: transpose-soln.c cl-helper.o
	gcc -std=gnu99 -lrt -lOpenCL -o$@ $^

%.o : %.c %.h
	gcc -c -std=gnu99 $<

mpi%: mpi%.c
	mpicc -std=gnu99 $(DEBUG_FLAGS) -lrt -o$@ $^

clean:
	rm -f $(EXECUTABLES) *.o mpe-*
