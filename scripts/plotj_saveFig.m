function plotj_saveFig(figName, figFiletype, figHandle)
% plotj_saveFig(figName, figFiletype, figHandle)
% 
% Saves figure

% Parameters
% ----------
% figName : string
%     string with full file name
% figFiletype : cell
%     cell with strings indicating extention of file
% figHandle : figure handle (optional)
%    
% Example
% -------
% ::
% 
%     figSave(figName, {'png', 'svg'})
%

[FILEPATH,NAME,~] = fileparts(figName);
if ~exist(FILEPATH,'dir')
    mkdir(FILEPATH)
end

% check input
if ~iscell(figFiletype)
    figFiletype = {figFiletype};
end
if nargin<3
    figHandle = gcf;
end

set(figHandle,'Units','pixels');   % All data in the svg-file is saved in pixels

for ifiletype = 1:length(figFiletype)
    
    savefilename = [figName '.' figFiletype{ifiletype}];

    switch figFiletype{ifiletype}
        case 'svg'
            set(figHandle,'renderer','painters') % make sure all elements are saved as independent paths
            
            
%             export_fig([ figName '.pdf']) % is easily opened in Inkscape and sets text paths correctly
            
            %             plot2svg([ figName '.svg'], figHandle)
            saveas(figHandle, [figName '.svg'], 'svg');
            print(figHandle,['-dpdf' ], [figName '.pdf'])

        case {'epsc', 'eps'}
            set(figHandle,'renderer','painters') % make sure all elements are saved as independent paths
            
            saveas(figHandle, [figName '.eps'], 'epsc');
            
%             print(figHandle,['-d' 'epsc' ],[figName '.eps'])

%             export_fig(savefilename, '-depsc')
%             export_fig([figName '.eps'], '-depsc')

        case 'png'
%             export_fig([figName '.png']) % is easily opened in Inkscape and sets text paths correctly

            print(figHandle,['-d' figFiletype{ifiletype} ], savefilename, '-r500')
%             print(f,[dest_dir 'WidthANOVA_' str],'-dpng', '-r500')
        case 'pdf'
%             print(figHandle,['-dpdf' ], [ figName '.pdf'])

            export_fig(savefilename)
        otherwise
            saveas(figHandle, savefilename);
    end
end
