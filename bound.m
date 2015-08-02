function y=bound(x,low,upp)
y=x;
y(y<low)=low;
y(y>upp)=upp;
end