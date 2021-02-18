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
                tmp_string(idx_cell) = {['\bf' tmp_string{idx_cell}]};
                                
            case 'italic'
                tmp_string(idx_cell) = {['\it' tmp_string{idx_cell}]};

            case 'star'
                tmp_string(idx_cell) = {[tmp_string{idx_cell} '*']};
                
            otherwise
                % non-standard functionality, append string with type
                tmp_string(idx_cell) = {[tmp_string{idx_cell} type]};
                
        end
        
        % set handle with updated string
        set(h_text(iel),'String',tmp_string,'Interpreter','tex')
    end
end
