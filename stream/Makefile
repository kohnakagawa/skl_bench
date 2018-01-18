TARGET = stream_com.out stream_com.asm stream_core.out stream_core.asm

OPT_FLAGS_COM = -xCOMMON-AVX512 -O3
OPT_FLAGS_CORE = -xCORE-AVX512 -O3

all: $(TARGET)

stream_com.out: stream.cpp
	icpc -std=c++11 $(OPT_FLAGS_COM) $< -o $@

stream_com.asm: stream_com.out
	objdump -D -M intel $< | c++filt > $@

stream_core.out: stream.cpp
	icpc -std=c++11 $(OPT_FLAGS_CORE) $< -o $@

stream_core.asm: stream_core.out
	objdump -D -M intel $< | c++filt > $@

clean:
	rm -f *~ $(TARGET)
