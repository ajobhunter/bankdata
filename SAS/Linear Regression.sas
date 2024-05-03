/*---------------------------------------
Topic: Linear Regression using SAS
-------------------------------------------*/

data htwt;
 input sex $ age :3.1 height weight @@;
 datalines;
 f 143 56.3  85.0 f 155 62.3 105.0 f 153 63.3 108.0 f 161 59.0  92.0
 f 191 62.5 112.5 f 171 62.5 112.0 f 185 59.0 104.0 f 142 56.5  69.0
 f 160 62.0  94.5 f 140 53.8  68.5 f 139 61.5 104.0 f 178 61.5 103.5
 f 157 64.5 123.5 f 149 58.3  93.0 f 143 51.3  50.5 f 145 58.8  89.0
 

   
  m 164 66.5 112.0 m 189 650 114.0 m 164 61.5 140.0 m 167 62.0 107.5
  m 151 59.3 87.0
  ;
  
 /*--------EDA---------*/
proc contents data=htwt;
run;

proc means data=htwt;
run;

proc freq data=htwt;
table sex;
run;

proc means data=htwt nmiss;
run;

 /*--------Estimation---------*/
proc reg data=htwt;
model Weight=Height Age;
run;

proc reg data=htwt outset=modelstat;
model Weight=Height Age;
run;

proc reg data=htwt;
by sex;
eq1: model Weight=Height Age;
eq2: model Weight=Height;
run;

ods graphics on;
proc reg data=htwt outset=modelstat;
model Weight=Height Age;
run;
ods graphics off;


/*0:37:39-1:29:39*/
