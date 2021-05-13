function plotj_text_emphasise(h_text, index, type, idx_cell)
% plotj_text_emphasise(h_text, index, type, idx_cell)
%
% Emphasise text in plot
% 
% Parameters
% ----------
% h_text : array
%     array with text handles
% index : array of booleans
%     array indicating which indices of text to emphasise
% type : string
%     string indicating which emphasis to apply. Options are 'bold',
%     'italic', 'star'. If other option is given, the string is appended
%     with type
% idx_cell : int (optional)
%     int indicating which cell of the text handle should be emphasised.
%     Only used when text object consists of multiple cells.
%     

if nargin<4
    idx_cell = 1;
end
if islogical(idx_cell)
    idx_cell = find(idx_cell);
end

% check sizes
text_sizes = size(h_text);
index_sizes = size(index);

assert(all(text_sizes==index_sizes), 'h_text and index are not the same size')

% unpack into single column
h_text = h_text(:);
index = index(:);

% loop over text objects
for iel = 1:numel(h_text)
    
    if index(iel)
        
        % force cell variable
        tmp_string = get(h_text(iel), 'String');
        if ~iscell(tmp_string)
            tmp_string = {tmp_string};
        end
        
        % change font or string of relevant cell
        switch type
            case 'bold'
                for icell = 1:length(idx_cell)
                    tmp_string(idx_cell(icell)) = {['{\bf' tmp_string{idx_cell(icell)} '}']};
                end
            case 'italic'
                for icell = 1:length(idx_cell)                        
                    tmp_string(idx_cell(icell)) = {['{\it' tmp_string{idx_cell(icell)} '}']};
                end
            case 'star'
                for icell = 1:length(idx_cell)
                    tmp_string(idx_cell(icell)) = {[tmp_string{idx_cell(icell)} '*']};
                end
            otherwise
                % non-standard functionality, append string with type
                for icell = 1:length(idx_cell)
                    tmp_string(idx_cell(icell)) = {[tmp_string{idx_cell(icell)} type]};
                end
        end
        
        % set handle with updated string
        set(h_text(iel),'String',tmp_string,'Interpreter','tex')
    end
end
