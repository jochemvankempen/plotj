function cm = AlwinsColorMaps(ColorMapName,flip,n)
%% ALWINSCOLORMAPS returns custom colormaps
%
% cm = AlwinsColorMaps(ColorMapName,flip,n)
% ColorMapName ... string of custom or builtin colormap, or cell array of
%                  rgb color names
% flip ........... flipud the selected colormap
% n .............. [256] n points

if nargin<3
    n = 256;
    if nargin<2
        flip = false;
    end;end

if ischar(ColorMapName)
    switch ColorMapName
        case 'grayglow'
            cm = usercolormap(rgb('blue'),rgb('light gray'),rgb('red'));
        case 'grayglow2'
            cm = usercolormap(rgb('blue'),rgb('cyan'),rgb('light gray'),rgb('yellow'),rgb('red'));
        case 'grayjet'
            cm = usercolormap(rgb('dark blue'),rgb('blue'),rgb('cyan'),rgb('dark gray'),rgb('yellow'),rgb('red'),rgb('dark red'));
        case 'iCSD'
            cm = usercolormap(rgb('yellow'),rgb('red'),rgb('dark red'),rgb('black'),rgb('dark blue'),rgb('blue'),rgb('cyan'));
        case 'greenjet'
            cm = usercolormap(rgb('dark blue'),rgb('blue'),rgb('cyan'),rgb('very dark green'),rgb('yellow'),rgb('red'),rgb('dark red'));
        case 'greenjet2'
            cm = usercolormap(rgb('blue'),rgb('cyan'),rgb('very dark green'),rgb('yellow'),rgb('red'));
        case 'whitejet'
            cm = usercolormap(rgb('dark blue'),rgb('blue'),rgb('cyan'),rgb('white'),rgb('yellow'),rgb('red'),rgb('dark red'));
        case 'blackjet'
            cm = usercolormap(rgb('dark blue'),rgb('blue'),rgb('cyan'),rgb('black'),rgb('yellow'),rgb('red'),rgb('dark red'));
        case 'jet'
            cm = usercolormap(rgb('dark blue'),rgb('blue'),rgb('cyan'),rgb('yellow'),rgb('red'),rgb('dark red'));
        case 'hires'
            cm = usercolormap(rgb('very dark green'),rgb('gray'),rgb('slightly light blue'),rgb('cyan'),rgb('yellow'),rgb('orange'),rgb('red'),rgb('dark red'));
        case 'kerkoerle'
            cm = usercolormap(rgb('cyan'),rgb('blue'),rgb('black'),rgb('red'),rgb('yellow'));
        case 'kerkoerlewhite'
            cm = usercolormap(rgb('cyan'),rgb('blue'),rgb('white'),rgb('red'),rgb('yellow'));
        case 'kerkoerlegray'
            cm = usercolormap(rgb('cyan'),rgb('blue'),rgb('dark gray'),rgb('red'),rgb('yellow'));
        case 'esa'
            cm = esa(256);
        case 'freqbands'
            cm = usercolormap(rgb('red'),rgb('blue'),rgb('cyan'),rgb('yellow'),rgb('orange'),rgb('light maroon'),rgb('gray'));
        case 'whitediff'
            cm = usercolormap(rgb('slightly dark blue'),rgb('cyan'),rgb('white'),rgb('yellow'),rgb('slightly dark red'));
        case 'whitehot'
            cm = usercolormap(rgb('white'),rgb('slightly dark yellow'),rgb('light orange'),rgb('red'));
        case 'grayhot'
%             cm = usercolormap(rgb('dark gray'),rgb('slightly light yellow'),rgb('red'),rgb('dark red'));
%             cm = usercolormap(rgb('dark gray'),rgb('slightly dark cyan'),rgb('slightly dark yellow'),rgb('yellow'),rgb('red'),rgb('dark red'));
            cm = usercolormap(rgb('dark gray'),rgb('dark cyan'),rgb('dark yellow'),rgb('yellow'),rgb('red'),rgb('dark red'));
        case 'greenhot'
%             cm = usercolormap(rgb('very dark green'),rgb('slightly dark cyan'),rgb('white'),rgb('yellow'),rgb('red'),rgb('dark red'));
            cm = usercolormap(rgb('very dark green'),rgb('slightly dark cyan'),rgb('yellow'),rgb('red'),rgb('dark red'));
        case 'circular'
            cm = usercolormap(rgb('blue'),rgb('cyan'),rgb('dark gray'),rgb('yellow'),rgb('red'));
        case 'greenjetzero'
            cm = usercolormap(rgb('dark blue'),rgb('blue'),rgb('cyan'),rgb('very dark green'),rgb('yellow'),rgb('red'),rgb('dark red'));
            cm([128 129],:) = 0;
        case 'pinkheat'
            cm = usercolormap(rgb('very light gray'),rgb('cyan'),rgb('blue'),rgb('magenta'));
        case 'orangeheat'
            cm = usercolormap(rgb('very light gray'),rgb('cyan'),rgb('blue'),rgb('orange'));
        case 'orangeredheat'
            cm = usercolormap(rgb('very light gray'),rgb('cyan'),rgb('light orange'),rgb('dark red'));
        case 'matlabInternal_diff'
%             cm = usercolormap(...
%                 [0 0.4470 0.7410],...
%                 [0.8500    0.3250    0.0980],...
%                 [0.4940    0.1840    0.5560]);
            cm = usercolormap(...                
                [0 0 1],...
                [0.3 0.7 0.3],...
                [1 0 0]);

        
        otherwise
            cm = colormap(ColorMapName);
    end
elseif iscell(ColorMapName)
    nShades = length(ColorMapName);
    for i=1:nShades
        ColorMapName{i} = rgb(ColorMapName{i});
    end
    cm = usercolormap(ColorMapName{:});
end
    
if flip
    cm = flipud(cm);
end

if n~=size(cm,1)
    cm = cm(round(linspace(1,size(cm,1),n)),:);
end









function C = usercolormap(varargin)

% USERCOLORMAP Create a color map.
%    USERCOLORMAP(COLOR1,COLOR2,COLOR3,...) creates a colormap
%    with colors specified by 1x3 vectors (COLOR1, COLOR2,
%    COLOR3...).
%
%    When the number of input colors are three for example,
%    the function linearly interpolates every column of a
%    3x3 matrix [COLOR1;COLOR2;COLOR3] to 256 values, which
%    is to be used as an input to COLORMAP. It means that
%    colors between those you specified change gradually.
%
%    (Example 1)
%    color1 = [1 0 0];
%    color2 = [1 1 1];
%    color3 = [0 0 1];
%    figure;
%    colormap(usercolormap(color1,color2,color3)),colorbar;
%
%
%    If you put a number (>0) as the last input argument
%    (USERCOLORMAP(...,NUM)), then the intensity scaling is
%    respected by automatically adjusting colors, in such a
%    way that the first color be the darkest (or lightest)
%    and the last be the lightest (or darkest). This is useful
%    when figures have to be printed out or photocopied in
%    grayscale.
%
%    When using this option, n-th intensity I(n) is expressed by
%    I(n) = I(1) + (I(256)-I(1))*((n-1)/255)^NUM.
%    When NUM = 1, then the scaling is linear (as in 
%    colormap(gray)). 1.2 can be a good compromise between
%    color map and intensity scale. You can check how it
%    looks in intensity (black and white) by exporting a
%    figure to a black/white eps format.
%
%    (Example 2)
%    color1 = [0 0 0];
%    color2 = [1 0 0];
%    color3 = [0.2 0.2 1];
%    color4 = [1 1 0];
%    color5 = [1 1 1];
%    figure;
%    C = usercolormap(color1,color2,color3,color4,color5,1);
%    colormap(C),colorbar;
%
%    You can also create an m-script like
%    %%%%%%
%    function C = mycolor
%    C = usercolormap([0 0 0],[1 0 0],[1 1 1]);
%    %%%%%%
%    and call this colormap by 'colormap(mycolor)'.
%
%    See also COLORMAP.
%

%    17 Mar 2005, Yo Fukushima


sz = size(varargin);
ncolor = sz(2);
C0 = [];
tol = 0.5; 

% when intensity option is given
if size(varargin{ncolor},2) == 1
   num = varargin{ncolor};
   ncolor = ncolor-1;
   isintensity = 1;
else
    isintensity = 0;
end   

% retrieve specified colors
for k = 1:ncolor
   C0 = [C0;varargin{k}];
end

% rescale when 'intensity' option is given
if isintensity == 1
   intensity_orig = (sum(C0.^2,2));
   first = intensity_orig(1);
   last = intensity_orig(ncolor);
%    if abs(first-last) < tol
%       warning('First and Last intensity should differ at least by 0.5.');
%    end
   % rescale intensity
   intensity = powerspace(first,last,ncolor,num);
   for k = 2:ncolor
      if intensity_orig(k) ~= 0
         kk = intensity(k)./intensity_orig(k);
         if kk > 1
            ind = find(C0(k,:)==0);
            C0(k,ind) = 0.01;
               a = C0(k,1);
               b = C0(k,2);
               c = C0(k,3);
               A = 3-2*(a+b+c)+a^2+b^2+c^2;
               B = a*(1-a)+b*(1-b)+c*(1-c);
               C = a^2+b^2+c^2-intensity(k);
               % sc is the root of Ax^2+2Bx+C=0
               sc = (-B+sqrt(B^2-A*C))/A;
               if ~(0 < sc & sc < 1)
                  sc = (-B-sqrt(B^2-A*C))/A;
               end
               C0(k,1) = a + (1-a).*sc;
               C0(k,2) = b + (1-b).*sc;
               C0(k,3) = c + (1-c).*sc;
         else
            C0(k,:) = sqrt(kk).*C0(k,:);
         end
      end      
   end
   
   %% disp %%
   disp('Rescaled colors:');
   disp(C0);
end

%% interpolation %%
lenC0 = size(C0,1);
step = linspace(1,256,lenC0);

C = zeros(256,3);
for k = 1:3
   foo = interp1(step',C0(:,k),1:256);
   C(:,k) = foo';
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 SUBFUNCTIONS                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function y = powerspace(d1, d2, n, power)
%POWERSPACE Exponentially spaced vector.
%   POWERSPACE(d1, d2, N, POWER) generates a row vector of N
%   exponentially spaced points between d1 and d2. POWER is
%   the power.

y = [(0:n-2)/(n-1), 1].^power;
y = rescale(y,[0,1],[d1,d2]);


function y = rescale(x,xrange,yrange)

% RESCALE Rescale the range of a vector or a matrix.
%
%   Y = RESCALE(X,[XMIN,XMAX],[YMIN,YMAX]) rescales the
%   range of X from [XMIN,XMAX] to [YMIN,YMAX].
%
%   (Example)
%   x = rand(50,50);
%   y = rescale(x,[0,1],[-100,100]);
%   figure;
%   subplot(121);imagesc(x),colorbar;
%   subplot(122);imagesc(y),colorbar;
%

xmin = xrange(1); xmax = xrange(2);
ymin = yrange(1); ymax = yrange(2);
y = (x-xmin).*(ymax-ymin)./(xmax-xmin) + ymin;





%% The following lines will create the same figure as the snapshot.

%      color1 = [0 0 0]; color2 = [1 0 0];
%      color3 = [0 1 0]; color4 = [0 0 1];
%      color5 = [1 1 1]; color6 = [1 1 0];
%      color7 = [0 1 1]; color8 = [1 0 1];
%      C1 = usercolormap(color2,color5,color4);
%      foo1 = shiftdim(C1,-1); foo1 = [foo1;foo1];
%      C2 = usercolormap(color5,color2,color6,color3,color5);
%      foo2 = shiftdim(C2,-1); foo2 = [foo2;foo2];
%      C3 = usercolormap(color1,color4,color7,color5);
%      foo3 = shiftdim(C3,-1); foo3 = [foo3;foo3];
%      C4 = usercolormap(color4,color3,color6,color2);
%      foo4 = shiftdim(C4,-1); foo4 = [foo4;foo4];
%      C5 = usercolormap(color1,color2,color3,color4,color5);
%      foo5 = shiftdim(C5,-1); foo5 = [foo5;foo5];
%      N = 256;
%      figure;
%      subplot(511);surf([1:N;1:N],'CData',foo1);shading interp;
%         view(2);set(gca,'XTick',[],'YTick',[]);axis([1 N 1 2]);
%      subplot(512);surf([1:N;1:N],'CData',foo2);shading interp;
%         view(2);set(gca,'XTick',[],'YTick',[]);axis([1 N 1 2]);
%      subplot(513);surf([1:N;1:N],'CData',foo3);shading interp;
%         view(2);set(gca,'XTick',[],'YTick',[]);axis([1 N 1 2]);
%      subplot(514);surf([1:N;1:N],'CData',foo4);shading interp;
%         view(2);set(gca,'XTick',[],'YTick',[]);axis([1 N 1 2]);
%      subplot(515);surf([1:N;1:N],'CData',foo5);shading interp;
%         view(2);set(gca,'XTick',[],'YTick',[]);axis([1 N 1 2]);
%


















function h = esa(m)
%ESA    Color map providing ESA corporate design colours.
%   ESA(M) returns an M-by-3 matrix of the colormap.
%   ESA, by itself, is the same length as the current colormap.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(esa)
%
%   See also HOT, HSV, GRAY, PINK, COOL, BONE, COPPER, FLAG, 
%   COLORMAP, RGBPLOT.

% Copyright (c) 2004-2005 by AMRON
% Norbert Marwan, Potsdam University, Germany
% http://www.agnld.uni-potsdam.de
%
% Last Revision: 2005-02-23
% Version: 2.0

if nargin < 1
  m = size(get(gcf,'colormap'),1); 
else
  if isempty(m), m = size(get(gcf,'colormap'),1); end
  if ischar(m), m = str2num(m); end
end

h = [     
     0.356860000000000011     0.466669999999999974     0.800000000000000044;

     0.387490000000000001     0.492070000000000007     0.809520000000000017;
     0.418109999999999982     0.517460000000000031     0.819049999999999945;
     0.448740000000000028     0.542860000000000009     0.828570000000000029;
     0.479360000000000008     0.568259999999999987     0.838099999999999956;
     0.509990000000000054     0.593650000000000011      0.84762000000000004;
     0.540610000000000035     0.619049999999999989     0.857140000000000013;
      0.57123999999999997     0.644449999999999967     0.866670000000000051;
     0.601870000000000016     0.669839999999999991     0.876190000000000024;
     0.632489999999999997     0.695239999999999969     0.885709999999999997;
     0.663120000000000043     0.720639999999999947     0.895240000000000036;
     0.693740000000000023     0.746029999999999971     0.904760000000000009;
     0.724369999999999958     0.771429999999999949     0.914290000000000047;
      0.75499000000000005     0.796830000000000038      0.92381000000000002;
     0.785619999999999985     0.822219999999999951     0.933329999999999993;
     0.816250000000000031      0.84762000000000004     0.942860000000000031;
     0.846870000000000012     0.873020000000000018     0.952380000000000004;
     0.877499999999999947     0.898410000000000042     0.961899999999999977;
     0.908120000000000038      0.92381000000000002     0.971430000000000016;
     0.938749999999999973     0.949209999999999998     0.980949999999999989;
     0.969369999999999954     0.974600000000000022     0.990480000000000027;
                        1                        1                        1;
                        1     0.988589999999999969     0.961679999999999979;
                        1     0.977180000000000049     0.923359999999999959;
                        1     0.965770000000000017     0.885050000000000003;
                        1     0.954359999999999986     0.846729999999999983;
                        1     0.942949999999999955     0.808409999999999962;
                        1     0.931549999999999989     0.770090000000000052;
                        1     0.920139999999999958     0.731770000000000032;
                        1     0.908730000000000038     0.693450000000000011;
                        1     0.897320000000000007     0.655139999999999945;
                        1     0.885909999999999975     0.616820000000000035;
                        1     0.874500000000000055     0.578500000000000014;
                        1     0.863090000000000024     0.540179999999999993;
                        1     0.851679999999999993     0.501859999999999973;
                        1     0.840269999999999961     0.463550000000000018;
                        1     0.828860000000000041     0.425229999999999997;
                        1      0.81745000000000001     0.386909999999999976;
                        1     0.806050000000000044     0.348590000000000011;
                        1     0.794640000000000013      0.31026999999999999;
                        1     0.783229999999999982     0.271950000000000025;
                        1     0.771819999999999951     0.233639999999999987;
                        1      0.76041000000000003     0.195319999999999994;
                        1     0.748999999999999999     0.157000000000000001;
                        1     0.730099999999999971     0.157000000000000001;
                        1     0.711200000000000054     0.157000000000000001;
                        1     0.692300000000000026     0.157000000000000001;
                        1     0.673399999999999999     0.157000000000000001;
                        1     0.654499999999999971     0.157000000000000001;
                        1     0.635600000000000054     0.157000000000000001;
                        1     0.616700000000000026     0.157000000000000001;
                        1     0.597799999999999998     0.157000000000000001;
                        1      0.57889999999999997     0.157000000000000001;
                        1     0.560000000000000053     0.157000000000000001;
                        1     0.541100000000000025     0.157000000000000001;
                        1     0.522199999999999998     0.157000000000000001;
                        1      0.50329999999999997     0.157000000000000001;
                        1     0.484399999999999997     0.157000000000000001;
                        1     0.465500000000000025     0.157000000000000001;
                        1     0.446599999999999997     0.157000000000000001;
                        1     0.427700000000000025     0.157000000000000001;
                        1     0.408799999999999997     0.157000000000000001;
                        1     0.389900000000000024     0.157000000000000001;
                        1     0.370999999999999996     0.157000000000000001;
];

if m ~= length(h)
    H = resample(h, m,length(h));
    H(H > 1) = 1;
    H(H < 0) = 0;
end



















% rgb.m: translates a colour from multiple formats into matlab colour format
% type 'rgb demo' to get started
%
% [matlabcolor]=rgb(col)
% matlab colors are in the format [R G B]
%
% if 'col' is a string, it is interpreted as
%
% 	[[modifier] descriptor] colour_name
%
% where
%		modifier is one of   (slightly, normal, very, extremely)
%		descriptor is one of (light/pale, normal, dark)
%		colorname is a name of a colour
%			(type 'rgb list' or 'rgb demo' to see them all)
%
% if 'col' is an integer between 0 and &HFFFFFF inclusive,
% it is interpreted as a double word RGB value in the form
% [0][R][G][B]
%
% if 'col' is a negative integer between -1 and -&HFFFFFF
% inclusive, it is interpreted as the complement of a double
% word RGB value in the form [0][B][G][R]
%
% if 'col' is a string of the form 'qbX' or 'qbXX' where X
% is a digit then the number part is interpreted as a qbasic
% color
%
% if 'col' is one of {k,w,r,g,b,y,m,c} a sensible result is
% returned
%
% if 'col' is already in matlab format, it is unchanged

%	VERSION:	06/06/2002
%	AUTHOR:		ben mitch
%	CONTACT:	footballpitch@theconnexion.zzn.com
%	WWW:		www.benmitch.co.uk\matlab (not yet)
%	LOCATION:	figures\colors\

function out=rgb(in)

if isa(in,'char') & length(in)>2 & length(in)<5 & strcmpi('qb',in(1:2))
	out=qbcolor(sscanf(in(3:end),'%i'));
elseif isa(in,'char') & length(in)==1
	out=translatecolorchar(in);
elseif isa(in,'char')
	if strcmp(in,'demo') rgb_demo; return; end
	if strcmp(in,'list') rgb_list; return; end
	out=translatecolorstring(in);
elseif isa(in,'double') & size(in,1)==1 & size(in,2)==1 & abs(in)<16777216
	out=translatecolorRGB(in);
elseif isa(in,'double') & size(in,1)==1 & size(in,2)==3
	out=in;
else
	warning('Unrecognised color format, black assumed');
	out=[0 0 0];
end

function out=translatecolorchar(in)
switch(in)
case 'k', out=[0 0 0];
case 'w', out=[1 1 1];
case 'r', out=[1 0 0];
case 'g', out=[0 1 0];
case 'b', out=[0 0 1];
case 'y', out=[1 1 0];
case 'm', out=[1 0 1];
case 'c', out=[0 1 1];
otherwise
	warning(['Unrecognised colour "' in '", black assumed'])
	out=[0 0 0];
	return;
end

function out=translatecolorstring(in)
args.tokens=rgb_parse(in);
args.N=length(args.tokens);
if args.N>3 warning('Too many words in color description, any more than 3 will be ignored'); end
while(args.N<3)
	args.tokens=[{'normal'};args.tokens];
	args.N=args.N+1;
end

cols=get_cols;
col=[];
for n=1:size(cols,1)
	names=cols{n,1};
	for m=1:length(names)
		if strcmp(args.tokens{3},names{m}) col=cols{n,2}; break; end
	end
	if ~isempty(col) break; end
end

if isempty(col)
	warning(['Unrecognised colour "' args.tokens{3} '", black assumed'])
	out=[0 0 0];
	return;
end

switch args.tokens{1}
case 'slightly', fac=0.75;
case 'normal', fac=0.5;
case 'very', fac=0.25;
case 'extremely', fac=0.125;
otherwise
	warning(['Unrecognised modifier "' args.tokens{1} '", normal assumed'])
	fac=0.5;
end

switch args.tokens{2}
case {'light','pale'}, out=1-(1-col)*fac;
case 'normal', out=col;
case 'dark', out=col*fac;
otherwise
	warning(['Unrecognised descriptor "' args.tokens{2} '", normal assumed'])
	out=col;
end

function out=translatecolorRGB(in)

BGR=0;
if in<0
	in=-in;
	BGR=1;
end

b=bytes4(in);
if BGR out=b(4:-1:2); else out=b(2:4); end

function out=qbcolor(in)

% rgb value from basic colour code
% 0-7 are normal, 8-15 are bright
% 0 - black
% 1 - red,  2 - green,   3 - blue
% 4 - cyan, 5 - magenta, 6 - yellow
% 7 - white

bright=0.5;
if in>7 in=in-8; bright=1; end

switch in
case 0, rgb=[0 0 0];
case 1, rgb=[1 0 0];
case 2, rgb=[0 1 0];
case 3, rgb=[0 0 1];
case 4, rgb=[0 1 1];
case 5, rgb=[1 0 1];
case 6, rgb=[1 1 0];
case 7, rgb=[1 1 1];
otherwise
	warning('Unrecognised QBasic color, black assumed');
	out=[0 0 0];
	return;
end

out=rgb*bright;


function tokens=rgb_parse(str)

% parse string to obtain all tokens
% quoted strings count as single tokens

inquotes=0;
intoken=0;
pos=1;
l=length(str);
st=0;
ed=0;
token='';
tab=char(9);
tokens=cell(0);
while(pos<=l)
	ch=str(pos);
	if inquotes
		if ch=='"'
			inquotes=0;
			tokens={tokens{:} token};
		else
			token=[token ch];
		end
	elseif intoken
		if ch==' ' | ch==tab
			intoken=0;
			tokens={tokens{:} token};
		elseif ch=='"'
			error(['Quote misplace in <' str '>']);
		else
			token=[token ch];
		end
	else
		if ch==' ' | ch==tab
			% do nothing
		elseif ch=='"'
			token='';
			inquotes=1;
		else
			token=ch;
			intoken=1;
		end
	end
	pos=pos+1;
end

if intoken tokens={tokens{:} token}; end
if inquotes error(['Unpaired quotes in <' str '>']); end

tokens=tokens';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rgb_demo

figure(1)
clf
cols = get_cols;
cols = {cols{:,1}}';
cols = { cols{:}, ...
	'k', ...
	'r', ...
	'g', ...
	'b', ...
	'y', ...
	'm', ...
	'c', ...
	'w', ...
	'', ...
	'extremely dark green', ...
	'very dark green', ...
	'dark green', ...
	'slightly dark green', ...
	'green', ...
	'slightly pale green', ...
	'pale green', ...
	'very pale green', ...
	'extremely pale green', ...
};

height=9;
x=0;
y=0;
for n=1:length(cols)
	rect(x,y,cols{n})
	y=y+1;
	if y==height
		x=x+2;
		y=0;
	end
end
if y==0 x=x-2; end
axis([0 (x+2) 0 height])
title('names on different rows are alternates')

function rect(x,y,col)
if isempty(col) return; end
r=rectangle('position',[x+0.1 y+0.1 1.8 0.8]);
col_=col;
if iscell(col) col=col{1}; end
colrgb=rgb(col);
if strcmp(col(1),'u') & length(col)==2
	t=text(x+1,y+0.5,{'unnamed',['colour (' col(2) ')']});
	set(r,'facecolor',colrgb);
else
	t=text(x+1,y+0.5,col_);
	set(r,'facecolor',colrgb);
	if sum(colrgb)<1.5 set(t,'color',[1 1 1]); end
end
set(t,'horizontalalignment','center')
set(t,'fontsize',10)

function rgb_list
cols=get_cols;
disp(' ')
for n=1:size(cols,1)
	code=cols{n,2};
	str=cols{n,1};
	str_=[];
	for m=1:length(str)
		str_=[str_ str{m} ', '];
	end
	str_=str_(1:end-2);
	if strcmp(str_(1),'u') & length(str_)==2
		str_=['* (' str_(2) ')'];
	end
	disp(['  [' sprintf('%.1f  %.1f  %.1f',code) '] - ' str_])
end
disp([10 '* colours marked thus are not named - if you know their' 10 '  designation, or if you feel sure a colour is mis-named,' 10 '  email me (address via help) or comment at' 10 '  www.mathworks.com/matlabcentral - "rgb demo" to see them' 10])

function cols=get_cols

cols={
	'black', [0 0 0]; ...
	'navy', [0 0 0.5]; ...
	'blue', [0 0 1]; ...
	'u1', [0 0.5 0]; ...
	{'teal','turquoise'}, [0 0.5 0.5]; ...
	'slateblue', [0 0.5 1]; ...
	{'green','lime'}, [0 1 0]; ...
	'springgreen', [0 1 0.5]; ...
	{'cyan','aqua'}, [0 1 1]; ...
	'maroon', [0.5 0 0]; ...
	'purple', [0.5 0 0.5]; ...
	'u2', [0.5 0 1]; ...
	'olive', [0.5 0.5 0]; ...
	{'gray','grey'}, [0.5 0.5 0.5]; ...
	'u3', [0.5 0.5 1]; ...
	{'mediumspringgreen','chartreuse'}, [0.5 1 0]; ...
	'u4', [0.5 1 0.5]; ...
	'sky', [0.5 1 1]; ...
	'red', [1 0 0]; ...
	'u5', [1 0 0.5]; ...
	{'magenta','fuchsia'}, [1 0 1]; ...
	'orange', [1 0.5 0]; ...
	'u6', [1 0.5 0.5]; ...
	'u7', [1 0.5 1]; ...
	'yellow', [1 1 0]; ...
	'u8', [1 1 0.5]; ...
	'white', [1 1 1]; ...
	};

for n=1:size(cols,1)
	if ~iscell(cols{n,1}) cols{n,1}={cols{n,1}}; end
end

% converts a DWORD into a four byte row vector
function out=bytes4(in)

out=[0 0 0 0];
if in<0 | in>(2^32-1)
	warning('DWORD out of range, zero assumed');
	return;
end

N=4;
while(in>0)
	out(N)=mod(in,256);
	in=(in-out(N))/256;
	N=N-1;
end

