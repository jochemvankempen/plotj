function [axHandle] = plotj_initAx(cfg, varargin)
% [axHandle] = plotj_initAx(cfg, varargin)
%
% initialises axis. 
%
% Parameters
% ----------
% cfg : struct
%     struct with settings for figure/axes, obtained in plotj_initFig 
% varargin : cell, with options:
%
%     - width:       width of figure (default 25), in centimeters. 
%     - height:      see width (default 20)
%     - margin:      margin of page that is kept clear 
%     - axlabel:     axis label, either string or numeric (integer indicating place in alphabet (e.g. 3 = c)
%     - axlabelDisplacement: displacement (x/y position away from axis)
%
% 
% Returns
% -------
% axHandle : axis handle
%
% 
% Dependencies:
% - plotj_panelLabel
%
% Jochem van Kempen, 2017
 
% get cfg
cond1 = (nargin==0);
cond2 = ~exist('cfg','var');
cond3 = isempty(cfg);
if cond1 || cond2 || cond3
    cfg = plotj_cfg;
end
    
% get arguments in varargin
plotj_getVarargin

if ~exist('axlabel','var')
    axlabel = [];
end
if ~exist('axlabelDisplacement','var')
    axlabelDisplacement = [];
end


%%% init axes
% set(gcf,'color','none')
set(gca,'linewidth',cfg.LineWidth_ax);
if ~exist('FontSize','var')
    set(gca,'FontSize',cfg.Fontsize_ax);
else
    set(gca,'FontSize',fontsize);
end
%         set(gca, 'DefaultTextFontSize', cfg.Fontsize_text); % [pt]
%         set(gca, 'DefaultAxesFontSize', cfg.Fontsize_ax); % [pt]

set(gca,'color','none');

if ~isempty(axlabel) & ~isnan(axlabel)
    
    plotj_panelLabel(gca, axlabel, cfg, 'axlabelDisplacement', axlabelDisplacement);
end
axHandle = get(gca);





