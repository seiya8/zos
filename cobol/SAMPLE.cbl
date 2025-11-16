       IDENTIFICATION DIVISION.
       PROGRAM-ID. SAMPLE.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO "IN01"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO "OT01"
               ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE
           RECORD CONTAINS 132 CHARACTERS.
       01  IN-RECORD            PIC X(132).
       FD  OUTPUT-FILE
           RECORD CONTAINS 132 CHARACTERS.
       01  OT-RECORD            PIC X(132).
       WORKING-STORAGE SECTION.
       01  WK-AREA.
         03  WK-EOF             PIC X(1).
       PROCEDURE DIVISION.
       000-CONTROL.
           PERFORM 100-INIT.
           PERFORM 200-MAIN UNTIL WK-EOF = "1".
           PERFORM 300-END.
           STOP RUN.
       
      *****************************************************************
      * INITIALIZATION PROCESS                                        *
      *****************************************************************
       100-INIT.
           OPEN INPUT INPUT-FILE.
           OPEN OUTPUT OUTPUT-FILE.
           MOVE "0" TO WK-EOF.
           READ INPUT-FILE
               AT END MOVE "1" TO WK-EOF
           END-READ.
       
      *****************************************************************
      * MAIN PROCESS                                                  *
      *****************************************************************
       200-MAIN.
           MOVE IN-RECORD TO OT-RECORD.
           WRITE OT-RECORD.
           READ INPUT-FILE
               AT END MOVE "1" TO WK-EOF
           END-READ.
       
      *****************************************************************
      * END PROCESS                                                   *
      *****************************************************************
       300-END.
           CLOSE INPUT-FILE.
           CLOSE OUTPUT-FILE.
