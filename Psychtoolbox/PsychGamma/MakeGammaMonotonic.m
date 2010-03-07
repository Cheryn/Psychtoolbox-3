function output = MakeGammaMonotonic(input)
% output = MakeGammaMonotonic(input)
%
% Make input monotonically increasing.
%
% This version also forces the last value to be 1, and then
% enforces decreasing downwards from there, after the
% enforcement of increasing from 0.
%
% This routine also forces the first entry to be exactly zero.
%
% 3/1/99  dhb  Handle multiple columns.
% 8/03/07 dhb  Old routine just enforced non-decreasing.  Fixed to make strictly increasing.
% 3/07/10 dhb  Wrote from MakeMonotonic.
%              Did not want to change behavior of MakeMonotonic in case it is called from
%              programs unrelated to gamma fitting.

[m,n] = size(input);

output = input;
for j = 1:n
    output(1,j) = 0;
	for i = 1:m-1
	  if (output(i,j) >= output(i+1,j))
	    output(i+1,j) = output(i,j)+eps;
	  end
    end
    
    for i = m:-1:2
	  if (output(i,j) <= output(i-1,j))
	    output(i-1,j) = output(i,j)-eps;
	  end
    end
end

  
