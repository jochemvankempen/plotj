function out = plotj_symbol(in, varargin)
% get character for input variable
%
%

plotj_getVarargin

if ~exist('italic', 'var')
    italic=0;
end
if ~exist('boldface', 'var')
    boldface=0;
end

switch in
    case 'mu'
        out = char(181);
    case 'alpha'
        out = char(945);
    case 'beta'
        out = char(946);
    case 'gamma'
        out = char(947);
    case 'delta'
        out = char(948);
    case 'Delta'
        out = char(916);
    case 'degree'
        out = char(176);
    case 'lambda'
        out = char(955);
    case 'epsilon'
        out = char(949);
    case 'pi'
        out = char(960);
end

if italic
   out = ['\it{'  out '}'];
end
if boldface
   out = ['\bf{'  out '}'];
end