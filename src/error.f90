SUBROUTINE error(errorT, message, compIndex, details, calledBy)

      IMPLICIT NONE
!
!
!  Variable Declarations:
!
      INTEGER, INTENT(IN) :: errorT
      INTEGER, INTENT(IN), OPTIONAL :: compIndex

      CHARACTER(LEN=*), INTENT(IN) :: message
      CHARACTER(LEN=*), INTENT(IN), OPTIONAL :: calledBy
      CHARACTER(LEN=*), INTENT(IN), OPTIONAL :: details(:)

!
      print *, "Wow something bad happened"

END SUBROUTINE error
