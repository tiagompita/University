close

casa = [-1+i -1-i 1-i 1+i -1+i 0+2i 1+i]

plot(casa, "r-")
axis("equal");
axis([-2 2 -2 3]);
ax = gca();
set(ax, 'xaxislocation', 'origin', 'yaxislocation', 'origin');
box off
hold on
plot(casa.*exp(j*(pi/4)), "b-")
