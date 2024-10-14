/* Include Configuration, Functions, and Macros */
%include '../config/config.sas';
%include '../functions/functions.sas';
%include '../macros/macros.sas';

/* Summarize Employment Statistics */
%summarize_statistics(data=clean.survey_transformed, var=income_adjusted, out=results.income_summary);

/* Perform Logistic Regression to Predict Employment Status */
proc logistic data=clean.survey_transformed;
    model employed(event='1') = age income_adjusted bmi education_level region;
    title "Logistic Regression of Employment Status";
run;

/* Generate Plots */
%generate_plot(data=clean.survey_transformed, var=income_adjusted, plot_name=Income_Distribution);
%generate_plot(data=clean.survey_transformed, var=bmi, plot_name=BMI_Distribution);
