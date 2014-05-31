PROJECT 		=	main

DEBUG			?= 	0
OPTIMIZE		?= 	1

# Toolchain
TOOL_PREFIX		=	""
CC				=	$(TOOL_PREFIX)gcc
CPP				=	$(TOOL_PREFIX)g++
LD				=	$(TOOL_PREFIX)gcc
AS				=	$(TOOL_PREFIX)as
OBJCOPY			=	$(TOOL_PREFIX)objcopy
OD 				=	$(TOOL_PREFIX)objdump
SIZE 			=	$(TOOL_PREFIX)size

# Locations
OUTDIR			=	build
PRODUCT_BASE	=	$(OUTDIR)/$(PROJECT)
EXE 			=	$(PRODUCT_BASE)

# Platform
PLATFORM_INC	=	-Iplatform/include
PLATFORM_SRC	:=	$(shell find platform/src -name '*.c')

# Project
PROJECT_INC		=	-Iinclude
PROJECT_SRC		:=	$(shell find src -name '*.c')

# Combined
SRC 			=	$(PLATFORM_SRC) $(PROJECT_SRC)
INC 			= 	$(PLATFORM_INC) $(PROJECT_INC)
OBJ 			=	$(SRC:.c=.o)

# Common flags
FLAGS			=	""

# C compilation
CFLAGS 			=	$(FLAGS) $(INC)
CFLAGS			+=	-std=gnu99 -Wall
CFLAGS			+=	-O$(OPTIMIZE)

# Linker
LDFLAGS			=	$(FLAGS)

.PHONY: all clean
.PRECIOUS: $(OBJ)

%.o: %.c
	@echo "[CC   ]" $@
	@$(CC) $(CFLAGS) -c -o $@ $<

all: $(EXE)

clean:
	find . -name '*.o' -delete
	rm -rf $(OUTDIR)

$(OUTDIR):
	@echo "[MKDIR]" $@
	@mkdir -p $(OUTDIR)

$(EXE): $(OUTDIR) $(OBJ)
	@echo "[LINK ]" $@
	@$(LD) $(LDFLAGS) -o $@ $(OBJ)
