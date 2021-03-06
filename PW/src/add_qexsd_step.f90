!
! Copyright (C) 2013 Quantum ESPRESSO group
! This file is distributed under the terms of the
! GNU General Public License. See the file `License'
! in the root directory of the present distribution,
! or http://www.gnu.org/copyleft/gpl.txt .
!
! This routine just calls the routint qexsd_step_addstep which adds a new xml
! element to to the list of step run by pw. In this way the addstep routine in
! the qexsd_step_addstep routine does not depend on global variables. 
!  P.  Delugas April 2016
 
!----------------------------------------------------------------
SUBROUTINE add_qexsd_step(i_step)
!-----------------------------------------------------------------
!
!------------------------------------------------------------------------
!       START_GLOBAL_VARIABLES ( INTENT (IN) ) 
!--------------------------------------------------------------------------
USE ions_base,    ONLY: tau, nat, nsp, atm, ityp
USE cell_base,    ONLY: alat, at
USE ener,         ONLY: etot, eband, ehart, etxc, vtxc, ewld, demet
USE klist,        ONLY: degauss
USE force_mod,    ONLY: force, sigma
USE control_flags,ONLY: nstep, n_scf_steps, scf_error
!-----------------------------------------------------------------------------
!   END_GLOBAL_VARIABLES
!----------------------------------------------------------------------------- 
!
!-------------------------------------------------------------------------------
!   SUBROUTINES FROM MODULES
!-------------------------------------------------------------------------------
#ifdef __XSD
USE qexsd_module, ONLY: qexsd_step_addstep
#endif
!-------------------------------------------------------------------------------
!------------------------------------------------------------------------------
IMPLICIT NONE
! 
!-------------------------------------------------------------------------------
!                     START_INPUT_VARIABLES
!-------------------------------------------------------------------------------
INTEGER,INTENT(IN)        ::   i_step
!-------------------------------------------------------------------------------
!                    END_INPUT_VARIABLES
!-------------------------------------------------------------------------------- 
!            
#ifdef __XSD 
CALL qexsd_step_addstep ( i_step, nstep, nsp, atm, ityp, nat, tau, alat, at(:,1),   &
                          at(:,2), at(:,3), etot, eband, ehart, vtxc, etxc, &
                          ewld, degauss, demet, force, sigma, n_scf_steps, &
                          scf_error) 
#endif    
END SUBROUTINE  add_qexsd_step
