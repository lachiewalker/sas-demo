/* Include Configuration, Functions, and Macros */
%include './config/config.sas';
%include './functions/functions.sas';
%include './macros/macros.sas';

/* Import Raw Data using a Macro */
%import_data(filepath='./data/raw/survey_data.csv', dataset=clean.survey_clean);

/* Data Cleaning Steps */
data clean.survey_cleaned;
    set clean.survey_clean;
    /* Apply custom function to categorize age */
    age_group = categorize_age(age);
    
    /* Adjust income based on region */
    income_adjusted = adjust_income(income, region);
    
    /* Handle missing values */
    if employment_status = '' then employment_status = 'Unemployed';
run;

