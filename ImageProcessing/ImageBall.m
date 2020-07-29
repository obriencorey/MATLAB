% Activity 6.1.2: An MATLAB Activity.
% File: HW4_Prob1_script_obrie187.m
% Date: 7 March 2020
% By: Corey O'Brien
% obrie187
% Section: 3
% Team: 42
% 
% ELECTRONIC SIGNATURE
% Corey James O'Brien
% 
% The electronic signature above indicates that the program
% submitted for evaluation is my individual work. I have
% a general understanding of all aspects of its development
% and execution.
% 
% A BRIEF DESCRIPTION OF WHAT THE PROGRAM OR FUNCTION DOES
% This function takes an image of a ball and isolates the ball 
% in the image output
%
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
fileName = input('Please enter the file name for the image: ','s');

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
pic_orig = imread(fileName);
pic = rgb2gray(pic_orig);
phi = zeros(size(pic));
maximum = max(max(pic));
minimum = min(min(pic));
mid = (maximum - minimum) / 2 + minimum -50;
phi(pic > mid) = 1;
se = strel('disk', 5);
phi = imerode(phi, se);
phi = imcomplement(phi);
phi = imfill(phi, 'holes');
phi = imcomplement(phi);
phi = imcomplement(phi);

% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------
figure
imshow(phi)