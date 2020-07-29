pic_orig = imread('Purdue_Arch.png');
hold on
imshow(pic_orig);

pic = rgb2gray(pic_orig);
figure
imshow(pic)

phi = zeros(size(pic));
maximum = max(max(pic))-60;
minimum = min(min(pic));
mid = (maximum - minimum) / 2 + minimum;
phi(pic > mid) = 1;

figure
imshow(phi)

CC = bwconncomp(phi);

Pixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(Pixels);
BW(CC.PixelIdxList{idx}) = 0;

figure
imshow(phi)

se = strel('disk', 3);
phi = imtophat(phi,se);
phi = bwareaopen(phi, 120);

for x = 270:594
    for y = 1:1195
        phi(x,y) = 0;
    end
end
figure
imshow(phi);

rvalues = pic_orig(:,:,1);
gvalues = pic_orig(:,:,2);
bvalues = pic_orig(:,:,3);

rvalues(phi == 0) = 0;
gvalues(phi == 0) = 0;
bvalues(phi == 0) = 0;

pic_orig = cat(3, rvalues, gvalues, bvalues);
figure
imshow(pic_orig)
hold off
