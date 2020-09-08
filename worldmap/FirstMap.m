worldmap world

load coastlines
whos

[latcells, loncells] = polysplit(coastlat, coastlon);
numel(latcells);

plotm(coastlat, coastlon);