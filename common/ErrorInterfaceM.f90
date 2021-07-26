MODULE ErrorInterface
!
      IMPLICIT NONE

      INTERFACE
         SUBROUTINE error(errorType, message, compIndex, details, calledBy)
            CHARACTER(LEN=*), INTENT(IN) :: message
            CHARACTER(LEN=*), INTENT(IN), OPTIONAL :: calledBy
            CHARACTER(LEN=*), INTENT(IN), OPTIONAL :: details(:)
            INTEGER, INTENT(IN) :: errorType
            INTEGER, INTENT(IN), OPTIONAL :: compIndex
         END SUBROUTINE error
      END INTERFACE

END MODULE
