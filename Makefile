# -*- Makefile -*-
SHELL=/bin/sh
# compiler flags
FC=gfortran
OPT=-O3 -ffast-math -fomit-frame-pointer
FFLAGS=-Wall -g -std=f95 $(OPT)
PARALLEL=-fopenmp
# list of source files
SRC=ljmd.f90
############################################
# derived makefile variables
OBJ_SERIAL=$(SRC:src/%.f90=Obj-serial/%.o)
OBJ_PARALLEL=$(SRC:src/%.f90=Obj-parallel/%.o)
############################################

default: serial parallel

serial parallel:
	$(MAKE) $(MFLAGS) -C Obj-$@

clean:
	$(MAKE) $(MFLAGS) -C Obj-serial clean
	$(MAKE) $(MFLAGS) -C Obj-parallel clean

