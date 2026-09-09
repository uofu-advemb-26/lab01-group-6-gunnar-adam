PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/15_2_Rel1
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as

.PRECIOUS: %.i
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
