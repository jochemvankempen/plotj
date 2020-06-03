function h = plotj_brokenVector(xData, yData, idx, varargin)
% h = plotBrokenVector(xData, yData, idx, plSettings)
%
% function to plot parts of a vector, e.g. for significance values in a time plot.
%
% Parameters
% ----------
% xData : array
%     data on x-axis, e.g. time values
% yData : array
%     data on y-axis
% idx : array
%     vector of booleans of same length as x and y. Where idx is 1, it will plot yData 
% varargin : cell
%     cell array with options: 'color', 'linewidth'
%
% Returns
% -------
% h : handle to line
% 

if sum(idx)==0 % if there are no ones, do not plot anything
    h=NaN;
    return
end
idx = logical(idx);

%%% find colors
[found, val, varargin] = parseparam(varargin, 'color');
if found
    colors = val;
else
    colors = [0 0 0];
end

%%% linewidth
[found, val, varargin] = parseparam(varargin, 'linewidth');
if found
    linewidths = val;
else
    linewidths = 1;
end

idx = idx(:);

Y = NaN(length(xData),1);
if length(yData)>1
    Y(idx) = yData(idx);
else
    Y(idx) = yData;
end
% if exist
h = plot(xData,Y,'lineWidth',linewidths,'color',colors);


%--------------------
% Parse optional 
% parameters
%--------------------

function [found, val, vars] = parseparam(vars, param)

isvar = cellfun(@(x) ischar(x) && strcmpi(x, param), vars);

if sum(isvar) > 1
    error('Parameters can only be passed once');
end

if any(isvar)
    found = true;
    idx = find(isvar);
    val = vars{idx+1};
    vars([idx idx+1]) = [];
else
    found = false;
    val = [];
end
