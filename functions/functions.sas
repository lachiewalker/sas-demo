proc fcmp outlib=work.functions.utility;
    /* Function to categorize age groups */
    function categorize_age(age);
        if age < 25 then return('Youth');
        else if 25 <= age < 60 then return('Adult');
        else return('Senior');
    endsub;

    /* Function to adjust income based on region */
    function adjust_income(income, region $);
        if region = 'Urban' then return(income * 1.05);
        else if region = 'Suburban' then return(income * 1.03);
        else return(income * 1.02);
    endsub;
run;

options cmplib=work.functions;
