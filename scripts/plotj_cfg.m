function cfg = plotj_cfg(cfg)
% set default settings for plots

% default settings
try cfg.figureType;     catch, cfg.figureType = 'Manuscript'; end % set type, ops are Manuscript/Poster
try cfg.journal;        catch, cfg.journal = 'Nature'; end % set journal
try cfg.units;          catch, cfg.units = 'centimeters'; end % set units
try cfg.paperType;      catch, cfg.paperType = 'a4letter'; end % set papertype
try cfg.transparency;   catch, cfg.transparency = 0.3; end % set transparency
try cfg.subplotGap;     catch, cfg.subplotGap = [0.1 0.1]; end % subplotGap, argument passed to function subtightplot, defines gap between subplots
try cfg.subplotMargin;   catch, cfg.subplotMargin = [0.1 0.1]; end % subplotMargin, argument passed to function subtightplot, defines gap between subplots

% plot settings
switch cfg.figureType
    case 'Manuscript'
        
        %%% axes
        cfg.LineWidth_ax     = 1;
%         
%         %%% font
%         cfg.Fontsize_ax      = 11; % ticks
%         cfg.Fontsize_ax_in   = 6; % ticks inset
%         cfg.Fontsize_text    = 12; % labels/legends
%         cfg.Fontsize_text_in = 10; % inside plot text
%         cfg.Fontsize_title   = 13; % labels/legends
%         cfg.Fontsize_panel   = 16; % panel label, e.g. Figure 1 panel A
%         cfg.Fontsize_sigStar = 16; % significance stars

        %%% font
        cfg.Fontsize_ax      = 7; % ticks
        cfg.Fontsize_ax_in   = 5; % ticks inset
        cfg.Fontsize_text    = 8; % labels/legends
        cfg.Fontsize_text_in = 7; % inside plot text
        cfg.Fontsize_title   = 9; % labels/legends
        cfg.Fontsize_panel   = 12; % panel label, e.g. Figure 1 panel A
        cfg.Fontsize_sigStar = 12; % significance stars

        %%% plots
        cfg.LineWidth        = 1.5;% main plots
        cfg.LineWidth_in     = 1;% insets
        cfg.MarkerSize       = 4;
        
    case 'Poster'

        %%% axes
        cfg.LineWidth_ax     = 2;
        
        %%% font
        cfg.Fontsize_ax      = 14; % ticks
        cfg.Fontsize_ax_in   = 10; % ticks inset
        cfg.Fontsize_text    = 16; % labels/legends
        cfg.Fontsize_text_in = 12; % inside plot text
        cfg.Fontsize_title   = 18; % labels/legends
        cfg.Fontsize_panel   = 22; % panel label, e.g. Figure 1 panel A
        cfg.Fontsize_sigStar = 20; % significance stars

        %%% plots
        cfg.LineWidth        = 3;% main plots
        cfg.LineWidth_in     = 2;% insets
        cfg.MarkerSize       = 10;

end

% panel label
switch cfg.journal
    case {'Nature','NatureNeuro'}
        cfg.panelLabel.case = 'lower';
        cfg.panelLabel.typeface = 'Bold';
    case 'Neuron'
        cfg.panelLabel.case = 'upper';
        cfg.panelLabel.typeface = 'normal';
    case 'Science'
        cfg.panelLabel.case = 'upper';
        cfg.panelLabel.typeface = 'Bold';
    otherwise
        cfg.panelLabel.case = 'lower';
        cfg.panelLabel.typeface = 'Bold';
end
    
% in plot font 
cfg.FontName = 'Helvetica';
        
        
 
