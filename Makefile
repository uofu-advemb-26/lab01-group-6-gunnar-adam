PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/15_2_Rel1
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld
SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

.PHONY: all
all: firmware.elf

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) -S $<


%.o: %.s
	$(AS) $< -o $@


hello.txt:
	echo "hello, world!" > hello.txt

.PHONY: clean
clean:
	rm -f *.i *.s *.o hello.txt
