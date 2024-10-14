/* Include Configuration, Functions, and Macros */
%include '../config/config.sas';
%include '../functions/functions.sas';
%include '../macros/macros.sas';

/* Create Summary Report */
proc report data=results.income_summary nowd;
    columns Mean Median StdDev Min Max;
    define Mean / 'Average Income';
    define Median / 'Median Income';
    define StdDev / 'Income Std Dev';
    define Min / 'Minimum Income';
    define Max / 'Maximum Income';
    title "Income Summary Statistics";
run;

/* Compile All Plots into a PDF Report */
ods pdf file="../reports/Annual_Survey_Report.pdf";

proc print data=results.income_summary;
    title "Income Summary Statistics";
run;

proc sgplot data=clean.survey_transformed;
    histogram income_adjusted;
    density income_adjusted;
    title "Distribution of Adjusted Income";
run;

proc sgplot data=clean.survey_transformed;
    histogram bmi;
    density bmi;
    title "Distribution of BMI";
run;

ods pdf close;
