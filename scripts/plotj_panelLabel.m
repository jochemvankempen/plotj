function plotj_panelLabel(axHandle, label, cfg, varargin)
% Plot label for figure panel, e.g. Figure 1A. Called in plotj_initAx
%
% Dependencies:
% - plotboxpos
%
%

plotj_getVarargin

if ~exist('labelCase','var')
    labelCase = 'lower';
end

if isfield(axHandle,'OuterPosition')
    % in case you change the axis position from default (e.g. using 'axis
    % square'), the position of the label is changed accordingly.
    % needs work
    
%     pos = (axHandle.Position - axHandle.OuterPosition);
%     pos = axHandle.OuterPosition;
%     pos = axHandle.Position;
    pos = plotboxpos(axHandle);
else
    pos = axHandle.Position;
end

if ~exist('axlabelDisplacement','var') || isempty(axlabelDisplacement)
    axlabelDisplacement = [0.07 0.05];
    axlabelDisplacement = [0.05 0.05];
end


if isnumeric(label)
    Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    switch cfg.panelLabel.case
        case 'upper'
            label = Alphabet(label);
        case 'lower'
            label = lower(Alphabet(label));
    end
end

dim = [pos(1)-axlabelDisplacement(1), pos(2)+pos(4)-axlabelDisplacement(2),0.1,0.1];
h = annotation('textbox',dim, 'String', label);
h.FontSize = cfg.Fontsize_panel;
h.FontName = cfg.FontName;
if ~strcmpi(cfg.panelLabel.typeface,'normal')
    h.FontWeight = cfg.panelLabel.typeface;
end
h.EdgeColor = 'None';
% keyboard
% 
