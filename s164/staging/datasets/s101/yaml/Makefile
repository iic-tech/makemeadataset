#
# Makefile for S-101 test datasets.
#
CAT=S-101_FC_1.1.0.xml
CC=8cc
CCFLAGS=-v y -c $(CAT)
SRC=.
OBJ=000
CELLS=production/
SRC_FILES := $(wildcard $(SRC)/*.yaml)
OBJ_FILES := $(patsubst $(SRC)/%.yaml,$(OBJ)/%.000,$(SRC_FILES))

production: $(OBJ_FILES) $(SRC_FILES)
	cp $(OBJ_FILES) $@

$(OBJ)/%.000: $(SRC)/%.yaml
	$(CC) $(CCFLAGS) -d $(OBJ) -f $<


