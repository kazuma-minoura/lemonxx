CFLAGS = -g -std=c89

ifdef HOMEBREW_TEMPLATE_PATH
CFLAGS += -DHOMEBREW_TEMPLATE_PATH=\"$(HOMEBREW_TEMPLATE_PATH)\"
endif

all : lemon lemon++ lemon--
clean:
	$(RM) lemon lemon++ lemon--

lemon++ : lemon.c
	$(CC) $(CFLAGS) -DLEMONPLUSPLUS=1 -DTEMPLATE_EXTENSION=\".cxx\" $< -o $@

lemon-- : lemon.c
	$(CC) $(CFLAGS) -DLEMONPLUSPLUS=1 $< -o $@

lemon : lemon.c
	$(CC) $(CFLAGS) $< -o $@
