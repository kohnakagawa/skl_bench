TARGET = dgemm.out
MKL_LIB = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread

dgemm.out: dgemm.cpp
	icpc -qopenmp -O3 -xHOST -std=c++11 $< $(MKL_LIB) -o $@

clean:
	rm -f $(TARGET) *~
