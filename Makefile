CC = gcc
CFLAGS = -c -Wall -g -Os -Iinclude -DENAGLO -DENAQZS -DENACMP -DNFREQ=3
LD = $(CC)

LDFLAGS = -lm -lpthread 

TARGET = rtkrcv

OBJECTS = $(patsubst %.c, %.o, $(wildcard src/*.c))

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LD) -o $@ $^ $(LDFLAGS)

# You don't even need to be explicit here,
# compiling C files is handled automagically by Make.
%.o: %.c
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm $(TARGET) $(OBJECTS)