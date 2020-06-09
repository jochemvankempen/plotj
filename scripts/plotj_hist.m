function h = plotj_hist(indata, varargin)
% plots histogram, with line for each column
% [h] = plotj_hist(data, varargin)
%
% Parameters
% ----------
% indata : array
%     array of size (n x nColumns), or cell array
% varargin, cell with options :
% 
%    - histStyle:    string with style of histogram: 'stairs' (default) or 'bar'
%    - nbins:        number of bins to use for histograms. integer (n==1, same nBins used for all nColumns) or vector (n==nColumns)
%    - plotMean:     boolean (default 1). Plot mean of histogram as a triangle over the histogram. Scales Y-axis according to ylim_scale
%    - ylim_scale:   vector [ymin ymax] that is used to scale ylim
%    - histscale:    Scale the histogram
%    - Color:        Color (rows) for each column of data
%    - LineWidth     (default 1)
%    - Marker        (default 'v')
%    - MarkerSize    (default 6)
%
% 
% Returns
% h : axis handle
%
% Dependencies:
%   - histo_to_bar.m
%
% Jochem van Kempen


% get varargin
plotj_getVarargin

% plot settings

% get data
if ~iscell(indata)
    [~, nCol] = size(indata);
    data = cell(nCol, 1);
    for icol = 1:nCol
        data{icol} = indata(:,icol);
    end
    
else
    nCol = length(indata);
    data = indata;
end


if ~exist('nbins', 'var') && ~exist('bins','var')
    nbins = 15;
elseif ~exist('nbins', 'var') && exist('bins','var')
    nbins = length(BinEdges);
end
if length(nbins)==1
    nbins = repmat(nbins, 1, nCol);
end

if ~exist('plotMean', 'var')
    plotMean = 1;
end

if ~exist('xlimit','var')
    xlimit = [];
end
if ~exist('ylimit','var')
    ylimit = [];
end

if ~exist('ylim_scale','var')
    if plotMean
        ylim_scale = [1 1.2];
    else
        ylim_scale = [1 1];
    end
end


if ~exist('histscale', 'var')
    histscale = 1;
end
if ~exist('histoffset', 'var')
    histoffset = 0;
end
if ~exist('histStyle', 'var')
    histStyle = 'line';
end


if ~exist('LineWidth', 'var')
    LineWidth = 1;
end

if ~exist('Marker', 'var')
    Marker = 'v';
end

if ~exist('MarkerSize', 'var')
    MarkerSize = 8;
end

if ~exist('Color', 'var')
    Color = get(gca,'ColorOrder');%
else
    if size(Color,1) < nCol
        error('specify at least the same amount of colors as there are columns in data')
    end
end

hold on
%%% get/plot histograms
h = zeros(nCol,1);
allBins = cell(nCol,1);
allHist = cell(nCol,1);
hold on

% concatenate across different columns to find the right binEdges and binWidths
try
    h_tmp = histogram( vertcat(data{:}), nbins(1));
catch
    h_tmp = histogram( horzcat(data{:}), nbins(1));
end
BinEdges = get( h_tmp, 'BinEdges' );
BinWidth = get( h_tmp, 'BinWidth' );
delete(h_tmp) % delete this temporary plot
    
for icol = 1:nCol
    switch histStyle
        case 'line'
            if exist('bins','var')
                [n,BinEdges] = hist(data{icol}, BinEdges);
            else
                [n,BinEdges] = hist(data{icol}, nbins(icol));
            end
            [ allBins{icol}, allHist{icol}] = histo_to_bar(BinEdges, n);
            h(icol) = plot(allBins{icol}, (allHist{icol}*histscale) + histoffset, 'LineWidth', LineWidth, 'Color', Color(icol,:));
            
        case 'stairs'
            h(icol) = histogram(data{icol}, nbins(icol), ...
                'BinEdges',BinEdges,...
                'DisplayStyle', histStyle);
            set( h(icol), 'LineWidth', LineWidth, 'EdgeColor', Color(icol,:) );

            
        case 'bar'
            h(icol) = histogram(data{icol}, nbins(icol), ...
                'BinEdges',BinEdges,...
                'DisplayStyle', histStyle);
            set( h(icol), 'FaceColor', Color(icol,:) );


    end
end

YLIM = get(gca, 'ylim');
XLIM = get(gca, 'xlim');

if plotMean
    if isempty(ylimit)
        ylim(YLIM .* ylim_scale)
    else
        ylim(ylimit)
    end
    YLIM = get(gca, 'ylim');
        
    for icol = 1:nCol
        meanHist = nanmean(data{icol});
        
        if plotMean==1
            plot(meanHist, YLIM(2) * 0.95 * histscale, Marker, 'MarkerSize', MarkerSize, 'MarkerEdgeColor', Color(icol,:), 'MarkerFaceColor', Color(icol,:));
        elseif plotMean==2
            plot([meanHist meanHist], YLIM, 'Color', Color(icol,:), 'LineWidth', LineWidth);
        end
    end
end

if ~isempty(xlimit)
    xlim(xlimit)
end
