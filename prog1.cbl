      ******************************************************************
      * Author: Ali Jamil
      * Date: September 22nd, 2022
      * Purpose: Introduction to COBOL
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ABCUNI.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARTIST-FILE
               ASSIGN TO FILEIN.
           SELECT ARTIST-REPORT
               ASSIGN TO FILEOUT.
       DATA DIVISION.
       FILE SECTION.
       FD ARTIST-FILE
           RECORDING MODE IS F.
       01 ARTIST-RECORD       PIC X(41).
       FD ARTIST-REPORT
           RECORDING MODE IS F.
          01 ARTIST-LIST       PIC X(93).
          WORKING-STORAGE SECTION.
          01 WS-SWITCHES.
              05  WS-EOF-SWITCH
          01 AR-ARTIST-RECORD.
              05  AR-RECO-ID       PIC X(6).
              05  AR-ARTST-NAME    PIC X(14).
              05  AR-GENRE         PIC X(2).
              05  AR-RECO-STATUS   PIC X(1).
              05  AR-STU-HRS       PIC 9(6).
              05  AR-HRLY-RATE     PIC 9(3).
              05  AR-PROJ-COMPL    PIC 9(8).
          01 AL-ARTIST-LIST.
              05                   PIC X(3) VALUE SPACES.
              05  AL-RECO-ID       PIC X(9).
              05                   PIC X(2) VALUE SPACES.
              05  AL-ARTST-NAME    PIC X(15).
              05                   PIC X(3) VALUE SPACES.
              05  AL-GENRE         PIC X(10).
              05                   PIC X(3) VALUE SPACES.
              05  AL-RECO-STATUS   PIC X(3).
              05                   PIC X(3) VALUE SPACES.
              05  AL-STU-HRS       PIC X(3).
              05                   PIC X(3) VALUE SPACES.
              05  AL-HRLY-RATE     PIC 9(3).
              05                   PIC X(3) VALUE SPACES.
              05  AL-PROJ-COMPL    PIC 9(8).
           PROCEDURE DIVISION.
           100-MAINLINE.
               OPEN INPUT ARTIST-FILE
                    OUTPUT ARTIST-REPORT
               MOVE 'NO' TO WS-EOF-SWITCH
               PERFORM UNTIL WS-EOF-SWITCH = 'YES'
                   READ ARTIST-FILE INTO AR-ARTIST-RECORD
                        AT END
                           MOVE 'YES' TO WS-EOF-SWITCH
                        NOT AT END
                           PERFORM 200-PROCESS
                   END-READ
               END-PERFORM
               CLOSE ARTIST-FILE
                     ARTIST-REPORT
               STOP RUN.
           200-PROCESS.
                MOVE AR-RECO-ID TO AL-RECO-ID
                MOVE AR-ARTST-NAME TO AL-ARTST-NAME
                MOVE AR-GENRE TO AL-GENRE
                MOVE AR-RECO-STATUS TO AL-RECO-STATUS
                MOVE AR-STU-HRS TO AL-STU-HRS
                MOVE AR-HRLY-RATE TO AL-HRLY-RATE
                MOVE AR-PROJ-COMPL TO AL-PROJ-COMPL
                MOVE AL-ARTIST-LIST TO ARTIST-LIST
                WRITE ARTIST-LIST
                      AFTER ADVANCING 2 LINES.
