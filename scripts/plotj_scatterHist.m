function h = plotj_scatterHist(data, fSet, varargin)
% plots scatterplot with histogram along axes
% [h] = plots_scatterHist(data, varargin)
%
% Parameters
% ----------
% data : array
%     array of size (n x 2)
% fSet : struct
%     structure with figure settings, from _plotj_initFig
% varargin : cell array with options
% 
%    - dataIndex:    Index to subdivide data, e.g. to give different markers to each subject
%    - nbins:        number of bins to use for histograms. integer (n=1) or vector (n = 2)
%    - markerSize:   size of markers (default 8)
%    - markerLinew:  linewidth of markers
%    - markerStyle:  style of markers used, cell array for number of different markers used for indices
%    - histscale:    Scale the histogram relative to axis size (default 0.25)
%    - histoffset:   Offset the histogram relative to axis size (default 0.01)
%
% 
% Returns
% -------
% h : axis handle
%
% 
% *Dependencies*
% 
% - histo_to_bar.m
%
% 
% Jochem van Kempen

% get varargin
plotj_getVarargin

if ~exist('dataIndex', 'var')
    dataIndex = ones(size(data,1), 1);
end
nIndex = length(unique(dataIndex));

if ~exist('nbins', 'var')
    nbins = [15 15];
end
if length(nbins)==1
    nbins = [nbins nbins];
end
if ~exist('MarkerSize','var')
    MarkerSize = 8;
end
if ~exist('MarkerLinew','var')
    MarkerLinew = 1.5;
end
if ~exist('MarkerStyle','var')
    MarkerStyle = {'v','o','d','^'};
end
if ~exist('histscale','var')
    histscale = 0.25;
end
if ~exist('histoffset','var')
    histoffset = 0.01;
end


%%% get axis position
parent = ancestor(gca, 'axes');
pos = plotboxpos(parent);

%%% get histograms
[n,bins] = hist(data(:,1),nbins(1));
[ bins_datax, hist_datax] = histo_to_bar(bins, n);

[n,bins] = hist(data(:,2),nbins(2));
[ bins_datay, hist_datay] = histo_to_bar(bins, n);

%%% plot scatter
for idx = 1:nIndex
    
    %             plot(parent, data(subidx,2), data(subidx,3), subMarker{iSubject_rf}, 'MarkerSize', fSet.MarkerSize/2, 'Color', [0.5 0.5 0.5], 'linew', 1)
    plot(parent, data(dataIndex==idx,1), data(dataIndex==idx,2), MarkerStyle{idx}, 'MarkerSize', MarkerSize, 'Color', 'k', 'linew', MarkerLinew)
end

YLIM = get(gca, 'ylim');
XLIM = get(gca, 'xlim');

ylim([YLIM(1)-0.05*YLIM(2) YLIM(2)])
xlim([XLIM(1)-0.05*XLIM(2) XLIM(2)])

% scale histograms
hist_datax = ((hist_datax / max(hist_datax)) * diff(YLIM)) * histscale;
hist_datay = ((hist_datay / max(hist_datay)) * diff(XLIM)) * histscale;


% create separate axis for histogram x
axhist1 = axes('Position',pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none',...
    'XColor','none','YColor','none','XTickLabel',[]);

%         axhist1.XLim = [XLIM];
%         axhist1.YLim = [YLIM];
%         linkaxes([parent axhist1],'x');
plotj_initAx(fSet);

%         axhist1.Position = axhist1.Position + [0 (axhist1.Position(4) + histoffset) 0 0];
axhist1.Position(2) = axhist1.Position(2) + (pos(4) + histoffset);

hold on
plot(axhist1, bins_datax, hist_datax  , 'Color', [0.5 0.5 0.5], 'linew', 1.5)
xlim(XLIM)
ylim(YLIM)
axis off
axis square

% create separate axis for histogram y
axhist2 = axes('Position',get(parent,'Position'),...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none',...
    'XColor','none','YColor','none','YTickLabel',[],'XTickLabel',[]);

%         axhist2.YLim = [YLIM];
%         axhist2.XLim = [XLIM];
% linkaxes([parent axhist2],'y');
plotj_initAx(fSet);

%         axhist2.Position = axhist2.Position + [(axhist2.Position(3) + histoffset) 0 0 0];
%         axhist2.Position = axhist2.Position + [(axhist2.Position(3) - histoffset) 0 0 0];
axhist2.Position(1) = parent.Position(1) + (pos(3) + histoffset);

plot(axhist2, hist_datay, bins_datay, 'Color', [0.5 0.5 0.5], 'linew', 1.5)
xlim(XLIM)
ylim(YLIM)
axis off
axis square



