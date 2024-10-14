/* Include Configuration, Functions, and Macros */
%include './config/config.sas';
%include './functions/functions.sas';
%include './macros/macros.sas';

/* Transform Data for Analysis */
data clean.survey_transformed;
    set clean.survey_cleaned;
    /* Create dummy variables for employment status */
    if employment_status = 'Employed' then employed = 1;
    else employed = 0;
    
    if employment_status = 'Unemployed' then unemployed = 1;
    else unemployed = 0;
    
    /* Calculate BMI */
    bmi = weight / (height**2);
run;
