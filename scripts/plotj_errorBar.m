function [hbar, herror] = plotj_errorBar(data, varargin)
% plot barplot with errorbar
%
% Parameters
% ---------- 
% data : array
%     array of size (n x columns) 
% varargin : cell, with options
% 
%     - x2plot: limit columns to specified range
%     - plotscatter: boolean (default false). If true, plots scatter of
%     individual subjects across barplot. 
% 
%
% Returns
% -------
% hbar : bar handle
% herror : error handle
% 

% get varargin
plotj_getVarargin

if ~exist('plotscatter','var')
    plotscatter = 0;
end
if ~exist('FaceColor','var')
    FaceColor = [0    0.4470    0.7410];
end
if ~exist('Color','var')
    Color = [0    0.4470    0.7410];
end
if ~exist('NA_action','var')
    NA_action = [];
end



% remove NA 
if ~isempty(NA_action)
    switch NA_action
        case 'omit'
            idx = isnan(data);
            [y,~] = find(idx);
            data(unique(y),:) = [];
    end
end

% do some checks
if ndims(data) ~= 2
    error('number of dimensions is %d, should be 2', ndims(data))
end
[y,x] = size(data);

if ~exist('x2plot','var') || isempty(x2plot)
    x2plot = 1:x;
end


% plot
hold on

hbar = bar(x2plot(1:x), mean(data));
hbar.FaceColor = FaceColor;

meany = mean(data);
stdy = std(data);
for ix = 1:x
    herror(ix) = plot([x2plot(ix) x2plot(ix)], meany(ix) + ([-stdy(ix) stdy(ix)])/sqrt(y), 'linew', 2, 'color', 'k');

    if plotscatter
        jitterinterval = [-0.1 0.1];
        jitterx = jitterinterval(1) + (diff(jitterinterval)).*rand(y,1);
        hscatter = plot( repmat(x2plot(ix), y, 1) + jitterx, data(:,ix), '.', 'Color', Color);
        
    end
end




