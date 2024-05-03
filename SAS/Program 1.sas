Data preg;
INPUT Name $ age edu_level $ high_bp;
CARDS;
peter  40 high_school 160
adrian 50 high_school 160
join   55 college     119
run;
PROC FREQ DATA=preg;
RUN;
PROC MEANS DATA=preg;
RUN;