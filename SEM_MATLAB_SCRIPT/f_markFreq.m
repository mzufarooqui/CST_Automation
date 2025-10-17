function f_markFreq(Vfreq,varargin)
% marca un frequenza o piu' con una riga verticale
%----------------------------
LineW = 1.0;
if ~isempty(varargin)
   Col = varargin{1};
end % if ~isempty(varargin)

ax = axis;
y1 = ax(3);
y2 = ax(4);
hold on

N = length(Vfreq);
i = 0;
while i<N
   i = i+1;
   f0 = Vfreq(i);
   %-----------------------------------------------
   h = plot((f0)*[1,1],[y1,y2],'-.');
   set(h,'linewidth',LineW,'color',Col)
   %-----------------------------------------------
end % while i<N
hold off