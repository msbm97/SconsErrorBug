MODULE Crunch
!
!     BEGIN MODULE USE
!

      USE ErrorInterface, ONLY : error
!
      IMPLICIT NONE

!
CONTAINS
!
!###########################################################
      SUBROUTINE getdata( )


            CALL error(4, ' *GETData* Index error.')

!
         RETURN
      END SUBROUTINE getdata
!
END MODULE Crunch
