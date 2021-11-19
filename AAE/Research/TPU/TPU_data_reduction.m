%{
===============================
AUTHOR: Corey O'Brien (obrie187@purdue.edu)
PURPOSE: Read data from NIDAQ file and StrainDAQ file and produce plots of 
         strain and resistance change vs time and strain vs resistance
         change. 


SPECIAL NOTES:
===============================
CHANGE HISTORY AND KNOWN BUGS:
10/28/21 - created file and began work on streamlining data analysis
==================================
%}

%clear all variables, plots, and console
clc, clear, close all

%change how many datasets we will analyze
num_datasets = 2;

%initialize matrix to hold the foldernames where each test will be stored
folders = strings(1,num_datasets);

%initialize matrix to hold all labview data and all strain data
all_labview_data = cell(1,num_datasets);
all_strain_data = cell(1,num_datasets);

for idx = 1:num_datasets
    folders(idx) = "test" + string(idx);
    
       
end

%=======================
%labview data processing
%=======================
%get file path string using folder name
labview_path_str = folders(1) + "/labviewdata";

%put all contents of the labview data into a struct
labview_directory = dir(labview_path_str);

%check all files in the labview directory
for file_num = 1:length(labview_directory)
    
    %if the file begins with experimental (i.e. compare first 11 chars)
    match_condition = strncmp(labview_directory(file_num).name,"Experimental",11);
    
    if(match_condition)
        
        %then this is where our electrical data is located
        labview_datafile = labview_directory(file_num).name;
        
        %concatenate the total filepath for where the electrical data is at
        elec_path_str = labview_path_str + "/" + labview_datafile;
        
        %open this file using the elec_path_str filepath
        elec_file_id = fopen(elec_path_str,'r');
        
        %get rid of header
        h_line = fgets(elec_file_id);
        
        %we are expecting rows to have two floats delimited by space
        labview_data = textscan(elec_file_id, '%f%f', 'Delimiter', ' ');
        fclose(elec_file_id);
        
        %store all data from this file in the labview data cell matrix
        all_labview_data{1} = labview_data;
        
    end
    
end

%=======================
%strain data processing
%=======================
%get file path string using folder name
strain_path_str = folders(1) + "/straindata";

%put all contents of the strain data into a struct
strain_directory = dir(strain_path_str);

%check all files in the strain directory
for strain_file_num = 1:length(strain_directory)
    
    %get current file name in directory
    current_filename = strain_directory(strain_file_num).name;
    
    %assume that file is not a match
    match_cond_1 = 0;
    match_cond_2 = 0;
    
    %if the filename is longer than 4
    match_cond_1 = length(current_filename) > 4; 
    
    if(match_cond_1)
        %and if file name ends with txt
        match_cond_2 = strcmp(current_filename(end-3:end),".txt");
    end
    
    if(match_cond_2)
        strain_datafile = strain_directory(strain_file_num).name;
        
        %concatenate the total filepath for where the electrical data is at
        strainfile_path_str = strain_path_str + "/" + strain_datafile;
        
        %open this file using the elec_path_str filepath
        strain_file_id = fopen(strainfile_path_str,'r');
        
        strain_wcommas = fileread(strain_file_id);
        strain_wcommas = strrep(strain_wcommas, ',', '');
        
        %strain_file_id = strrep(strain_file_id, ',', '');
        
%         %get rid of header
%         h_line = fgets(strain_file_id);
%         
%         %we are expecting rows to have two floats delimited by space
%         strain_data = textscan(strain_file_id, '%f%s%f%f', 'Delimiter', ' ');
%         fclose(strain_file_id);
%         
%         %store all data from this file in the labview data cell matrix
%         all_labview_data{1} = labview_data;
    end
    
end





