function [figHandle, figSet] = plotj_initFig( varargin )
% [figHandle, figSet] = plotj_initFig(varargin);
% 
% initialises figure
%
% Parameters
% ----------
% varargin : cell with options
% 
%     - figNum:      number the figure will have (default is 1)
%     - figureType:  'Manuscript' (default), 'Poster' (will lead to different font sizes and line width, etc.)
%     - width:       width of figure (default 25), in centimeters.
%     - height:      see width (default 20)
%     - margin:      margin of page that is kept clear
%     - axlabel:     axis label, either string or numeric (integer indicating place in alphabet (e.g. 3 = c)
%     - axlabelDisplacement: displacement (x/y position away from axis)
%
% 
% Returns
% -------
% fighandle : figure handle
%     handle to figure with all settings defined in plotj_cfg
% figSet : struct
%     struct with settings, e.g. linewidth, fontsize, etc
%
% Example
% -------
% ::
% 
%     [figHandle, figSet] = plotj_initFig('height', 25, 'width', 25)
%
% 
% Jochem van Kempen, 2017

% get arguments in varargin
plotj_getVarargin

% define default cfg
cfg=[];
if exist('figureType','var')
    cfg.figureType = figureType;
end
if exist('journal','var')
    cfg.journal = journal;
end
if exist('subplotGap','var')
    cfg.subplotGap = subplotGap;
end
if exist('subplotMargin','var')
    cfg.subplotMargin = subplotMargin;
end
figSet = plotj_cfg( cfg );

% set default param
if ~exist('figNum','var')
    figNum = 1;
end
if ~exist('width','var')
    width = 25;
end
if ~exist('height','var')
    height = 20;
end


figHandle = figure(figNum);clf
set(figHandle, 'Units', figSet.units);

% Select the preferred unit like inches, centimeters,
% or pixels
pos = get(figHandle, 'Position');
pos(1) = 5;
pos(2) = 5;
pos(3) = width; % Select the width of the figure in [cm]
pos(4) = height; % Select the height of the figure in [cm]
set(figHandle, 'Position', pos);
set(figHandle, 'PaperType', figSet.paperType);

set(figHandle,'PaperPositionMode','auto')

% Select the default font and font size
% Note: Matlab does internally round the font size
% to decimal pt values
set(figHandle, 'DefaultTextFontSize', figSet.Fontsize_text); % [pt]
set(figHandle, 'DefaultAxesFontSize', figSet.Fontsize_ax); % [pt]
set(figHandle, 'DefaultAxesFontName', figSet.FontName);
set(figHandle, 'DefaultTextFontName', figSet.FontName);


figSet.colors = get(gca,'ColorOrder');%





