function h = plotj_scatter(data, varargin)
% [h] = plots_scatterHist(data, varargin)
%
% plots scatterplot 
%
% Parameters
% ----------
% data : array
%     array of size (n x columns) 
% varargin : cell, with options
% 
%     - dataIndex:        Index to subdivide data, e.g. to give different markers to each subject
%     - markerSize:       size of markers (default 8)
%     - markerLinew:      linewidth of markers
%     - markerStyle:      style of markers used, cell array for number of different markers used for indices
%     - unityLine:        boolean, if yes (default) plots unit line
%     - axislimit:        specify x and ylim. If empty, axis will not be equal
%     - MarkerEdgeColor:  Color of markers used, matrix with rows for indices(dataIndex)
%     - MarkerFaceColor:  Color of markers used, matrix with rows for indices(dataIndex)
%     - MarkerFaceAlpha
%
% 
% Returns
% -------
% h : axis handle
%
% 
% *Dependencies*
% 
% - plotboxpos.m (https://www.mathworks.com/matlabcentral/fileexchange/9615-plotboxpos)
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
%     MarkerStyle = {'v','o','d','^'};
    MarkerStyle = {'o','v','d','^'};
end

if ~exist('unityLine','var')
    unityLine = 1;
end
if ~exist('MarkerEdgeColor','var')
    MarkerEdgeColor = repmat([0 0 0],nIndex,1);
elseif size(MarkerEdgeColor,1)~=nIndex
    MarkerEdgeColor = repmat(MarkerEdgeColor,[nIndex,1]);
end
if ~exist('MarkerFaceColor','var')
    MarkerFaceColor = repmat('none',nIndex,1);
elseif size(MarkerFaceColor,1)~=nIndex
    MarkerFaceColor = repmat(MarkerFaceColor,[nIndex,1]);
end
if ~exist('MarkerEdgeAlpha','var')
    MarkerEdgeAlpha = zeros(nIndex,1);
elseif size(MarkerEdgeAlpha,1)~=nIndex
    MarkerEdgeAlpha = repmat(MarkerEdgeAlpha,[nIndex,1]);
end
if ~exist('MarkerFaceAlpha','var')
    MarkerFaceAlpha = zeros(nIndex,1);
elseif size(MarkerFaceAlpha,1)~=nIndex
    MarkerFaceAlpha = repmat(MarkerFaceAlpha,[nIndex,1]);
end


if ~exist('axislimit','var')
    axislimit2use = minmax(data(:)');
    axislimit=[1 1];
elseif isempty(axislimit)
    axislimit2use = minmax(data(:)');
    axislimit=[0 0];
else
    axislimit2use = axislimit;
    axislimit=[0 1];;
end




if axislimit(1)
    %%% get plot limits
    plotScale = 0.1;
    % axislimit = minmax(data(:)');
    idx = axislimit2use<0;
    if idx(1)
        axislimit2use(1) = axislimit2use(1) * (1 + plotScale);
    else
        axislimit2use(1) = axislimit2use(1) * (1 - plotScale);
    end
    if idx(2)
        axislimit2use(2) = axislimit2use(2) * (1 - plotScale);
    else
        axislimit2use(2) = axislimit2use(2) * (1 + plotScale);
    end
end

%%% plot unity
if unityLine
    plot(axislimit2use, axislimit2use, 'k', 'linew', 1)
end

%%% get axis position
parent = ancestor(gca, 'axes');
pos = plotboxpos(parent);

%%% plot scatter
for idx = 1:nIndex
    
    %             plot(parent, data(subidx,2), data(subidx,3), subMarker{iSubject_rf}, 'MarkerSize', fSet.MarkerSize/2, 'Color', [0.5 0.5 0.5], 'linew', 1)
    if MarkerFaceAlpha(idx)~=0    
        if all(MarkerEdgeColor(idx,:) == MarkerFaceColor(idx,:))
            h(idx) = scatter(parent, data(dataIndex==idx,1), data(dataIndex==idx,2), ...
                MarkerSize, MarkerStyle{idx}, ...
                'filled', 'MarkerFaceColor', MarkerFaceColor(idx,:), ...
                'linew', MarkerLinew);
        else
            h(idx) = scatter(parent, data(dataIndex==idx,1), data(dataIndex==idx,2), ...
                MarkerSize, MarkerStyle{idx}, ...
                'MarkerEdgeColor', MarkerEdgeColor(idx,:), 'MarkerFaceColor', MarkerFaceColor(idx,:), ...
                'linew', MarkerLinew);
        end
        h(idx).MarkerFaceAlpha = MarkerFaceAlpha(idx);
        h(idx).MarkerEdgeAlpha = MarkerEdgeAlpha(idx);
    else
        h(idx) = plot(parent, data(dataIndex==idx,1), data(dataIndex==idx,2), MarkerStyle{idx}, ...
            'MarkerSize', MarkerSize, 'MarkerEdgeColor', MarkerEdgeColor(idx,:), 'MarkerFaceColor', MarkerFaceColor(idx,:), 'linew', MarkerLinew);
    end
end

if axislimit(2)
    ylim(axislimit2use)
    xlim(axislimit2use)
end





