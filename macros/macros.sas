%macro import_data(filepath, dataset);
    proc import datafile="&filepath"
        out=&dataset
        dbms=csv
        replace;
        getnames=yes;
    run;
%mend import_data;

%macro summarize_statistics(data, var, out);
    proc means data=&data n mean median std min max;
        var &var;
        output out=&out mean=Mean median=Median std=StdDev min=Min max=Max;
    run;
%mend summarize_statistics;

%macro generate_plot(data, var, plot_name);
    proc sgplot data=&data;
        histogram &var;
        density &var;
        title "Distribution of &var";
        ods graphics / reset imagename="&plot_name" imagefmt=png;
    run;
%mend generate_plot;
