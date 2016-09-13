#=======================================
# WANNIER90 	
#=======================================

F90=mpif90
FCOPTS=$(FFLAGS) -nomodule -qopenmp 
LDOPTS=-static-intel  -qopenmp

LIBS =    -lmkl_intel_lp64  -lmkl_intel_thread -lmkl_core 
