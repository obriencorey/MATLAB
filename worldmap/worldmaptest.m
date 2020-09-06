data = rand(72,144);
rv = [0.4 90 0]; 
worldmap('world');
geoshow(data, rv, 'displaytype', 'texturemap');
C = load('coast');
plotm(C.lat, C.long, 'k');