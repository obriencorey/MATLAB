I = imread('IMG-0611.JPG');
I = imresize(I,[100,100]);
figure
imshow(I);

bigimage = zeros(200,200,3);
bigimage = uint8(bigimage);


for rows = 101:200
    for columns = 101:200
        for colors = 1:3
            bigimage(rows,columns,colors) = I(rows - 100,columns - 100,colors);
       end
    end
end

for rows = 1:100
    for columns = 101:200
        for colors = 1:3
            bigimage(rows,columns,colors) = .5 * I(rows,columns - 100,colors);
       end
    end
end

for rows = 101:200
    for columns = 1:100
        for colors = 1:3
            bigimage(rows,columns,colors) = 1.5 * I(rows - 100,columns,colors);
       end
    end
end

for x = 10000:20000
    I(x) = 0;
    
end
for rows = 1:100
    for columns = 1:100
        for colors = 1:3
            bigimage(rows,columns,colors) = I(rows,columns,colors);
       end
    end
end
figure
imshow(I);
figure
imshow(bigimage);
