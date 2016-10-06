data assignment;
infile 'C:\Users\OODOOE\Downloads\Video\Second Year\First Semester\Foundation\foundation_assignment2\Data\CH06PR15.txt' firstobs=2;
input Y X1 X2 X3;
label Y='Patients Satisfaction'
	  X1='Patients Age'
	  X2='severity of illness'
	  X3='anxiety level';
run;

*Question 1;
proc reg data=assignment;
model Y = X1 X2 X3;
test1: test X2 = 0, X3=0;
test2: test X1 = -1, X2 = 0;
run;
data assignment;
set assignment;
ynew = Y + X1;
run;
proc reg data=assignment;
model ynew = X3;
run;

*Question 2;
proc reg data=assignment;
model Y = X1 X2 X3 / ss1 ss2;
model Y = X1;
model Y = X2;
model Y = X3;
model Y = X1 X3 /ss1;
model Y = X2 X3 /ss1;
model Y = X3 X2 /ss1;
model Y = X3 X1 /ss1;
run;
*Question 3;
proc corr data=assignment plots=matrix(histogram);
var Y X1 X2 X3;
run;


data example;
input x1 x2 y;
cards;
4 2 42
4 2 39
4 3 48
4 3 51
6 2 49
6 2 53
6 3 61
6 3 60
;
run;

proc corr
