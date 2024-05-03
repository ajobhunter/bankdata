/* Generated Code (IMPORT) */
/* Source File: CARS.csv */
/* Source Path: /home/u63468980/sasuser.v94 */
/* Code generated on: 03/05/2024 11:16 */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u63468980/sasuser.v94/CARS.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);

proc means data=WORK.IMPORT;
VAR Length;
run;

proc means data=WORK.IMPORT;
VAR Length WEIGHT EngineSize;
run;

proc means data=WORK.IMPORT max min mean std;
VAR Length;
run;

proc means data=WORK.IMPORT nmiss;
VAR length WEIGHT EngineSize;
run;

/**variable exploration with proc freq***/
proc freq data=Work.Import;
table make;
run;

proc freq data=work.import;
table origin*type;
run;

/**ploting variables**/;
ods graphics on;
proc gplot data=work.import;
plot length*weight;
run;
quit;

/**variable exploration with univariate**/;
proc univariate data=work.import;
var length;
run;
quit;

ods graphics on;
proc univariate data=work.import;
histogram length;
run;
quit;
