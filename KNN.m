## Copyright (C) 2023 Henning Richter <mote3d@quantentunnel.de>
##
## Implementation of a basic Machine Learning example based on the non-parametric 
## k-nearest neighbours algorithm.
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
## 
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
## 
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.

close all;
clear all;
clc;

## Read dataset from file: 
data = dlmread("dataset.txt", ",");

## Choose the number of nearest neighbours k:
k = 3

## Initialize a query point to be classified:
point = [randi([1,9]),0]

## Compute the Euclidian distance between the query point and each data point of the sample:
dxdy = repmat(point, size(data)(1), 1) - data
dist = sqrt(sum(dxdy.*dxdy), 2)

## Add indices to the resulting matrix of distance:
indexdist = [transpose(1:size(data)(1)),dist];

## Sort the matrix by distances in ascending order and pick first k nearest data points:
k_nearestdist = sortrows(indexdist, 2)(1:k,:)
k_nearestdata = data(k_nearestdist(:,1),:)


