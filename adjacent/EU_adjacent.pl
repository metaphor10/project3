%we do not include greece because it is not
%adjacent to any other EU country and thus
%can be colored any color; for aesthetic
%reasons we choose to make the united kingdom and france
%adjacent, so the map coloring makes it clear they are separate
%countries
adj(po,sp). %portugal, spain
adj(sp,fr). %spain, france
adj(fr,ge). %france, germany
adj(fr,be). %france, belgium
adj(fr,lu). %france, luxembourg
adj(fr,it). %france, italy
adj(be,ne). %belgium, netherlands
adj(be,lu). %belgium,luxembourg
adj(ge,be). %germany, belgium
adj(ge,it). %germany, italy
adj(ge,au). %germany, austria
adj(ge,da). %germnay,denmark
adj(ge,ne). %germany, netherlands
adj(ge,lu). %germany, luxembourg
adj(da,sw). %denmark,sweden
adj(sw,fi). %sweden,finland
adj(au,it). %austria,italy
adj(uk,fr). %united kingdom, france
adj(uk,ir). %united kingdom, ireland
adjacent(X,Y):-adj(X,Y).
adjacent(X,Y):-adj(Y,X).