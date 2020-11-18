%%% unpack varargin into separate variables
%

% get specific varargin
for iarg = 1:2:length(varargin)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% figure
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if strcmpi(varargin{iarg}, 'numFig') || strcmpi(varargin{iarg}, 'figNum')
        figNum = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'figureType')
        figureType = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'figureSettings')
        figureSettings = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'width')
        width = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'height')
        height = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'Color')
        Color = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'EdgeAlpha')
        EdgeAlpha = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'EdgeColor')
        EdgeColor = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'FaceAlpha')
        FaceAlpha = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'FaceColor')
        FaceColor = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'histStyle')
        histStyle = varargin{iarg+1}; 
        
    elseif strcmpi(varargin{iarg}, 'plotMean')
        plotMean = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'plotMedian')
        plotMedian = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'unityLine')
        unityLine = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'x2plot')
        x2plot = varargin{iarg+1}; 
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% Font
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif strcmpi(varargin{iarg}, 'boldface')
        boldface = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'FontSize')
        fontsize = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'italic')
        italic = varargin{iarg+1};
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% axes
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    elseif strcmpi(varargin{iarg}, 'axislimit')
        axislimit = varargin{iarg+1};
    
    elseif strcmpi(varargin{iarg}, 'axlabel')
        axlabel = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'axlabelDisplacement')
        axlabelDisplacement = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'labelCase')
        labelCase = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'subplotGap')
        subplotGap = varargin{iarg+1};
    
    elseif strcmpi(varargin{iarg}, 'subplotMargin')
        subplotMargin = varargin{iarg+1};

    elseif strcmpi(varargin{iarg}, 'xlimit')
        xlimit = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'ylimit')
        ylimit = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'ylim_scale')
        ylim_scale = varargin{iarg+1};

        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% elements: markers/lines/etc
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif strcmpi(varargin{iarg}, 'LineWidth')
        LineWidth = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'Marker')
        Marker = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'MarkerStyle')
        MarkerStyle = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'MarkerSize')
        MarkerSize = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'MarkerLinew')
        MarkerLinew = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'MarkerEdgeColor')
        MarkerEdgeColor = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'MarkerFaceColor')
        MarkerFaceColor = varargin{iarg+1};

    elseif strcmpi(varargin{iarg}, 'MarkerEdgeAlpha')
        MarkerEdgeAlpha = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'MarkerFaceAlpha')
        MarkerFaceAlpha = varargin{iarg+1};
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% data
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif strcmpi(varargin{iarg}, 'bins')
        bins = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'binEdges')
        binEdges = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'dataIndex')
        dataIndex = varargin{iarg+1};

    elseif strcmpi(varargin{iarg}, 'histscale')
        histscale = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'histoffset')
        histOffset = varargin{iarg+1};    
        
    elseif strcmpi(varargin{iarg}, 'histrotate')
        histRotate = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'nbins')
        nbins = varargin{iarg+1};
                
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% other
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif strcmpi(varargin{iarg}, 'journal')
        journal = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'factorstring')
        factorstring = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'NA_action')
        NA_action = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'rounded') || strcmpi(varargin{iarg}, 'round') 
        rounded = varargin{iarg+1};
        
    elseif strcmpi(varargin{iarg}, 'roundSet')
        roundSet = varargin{iarg+1};
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% otherwise
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        warning('Unknown parameter %s, varargin', varargin{iarg})
        if isnumeric(varargin{iarg+1}) % numeric
            eval([varargin{iarg} ' = [' num2str(varargin{iarg+1}) '];'])
        elseif ischar(varargin{iarg+1}) % strings
            eval([varargin{iarg} ' = ''' varargin{iarg+1} ''';'])
        elseif iscell(varargin{iarg+1}) % cell arrays, with strings
            nel = length(varargin{iarg+1});
            eval([varargin{iarg} ' = cell(1, ' num2str(nel) ') ;'])
            for iel = 1:nel
                eval([varargin{iarg} '{iel} = ''' varargin{iarg+1}{iel} ''';'])
            end
        else
            error('Cannot extract parameter, varargin')
        end
        
    end
    
    
    
end

