function showDisparityMap( )
width  = 640; % 这个地方你要指定为你自己的矩阵的窥胰
height = 480; % 这纴E惨付ㄎ阕约旱木卣蟮母叨�
channels = 1; % 通道�?
fs = fopen('disparityMap1.txt', 'rb');
db = fread(fs, 'uint8'); % 注意，这纴E玫氖莡nsigned int8
fclose(fs);

ou = reshape(db, width, channels*height); % 调整显示格式

im(:,:) = ou(3:end, :)'; % B通道
min = inf;
for i=1:height
    for j=1:638
        value = im(i,j);
        if value~=0 && value<min
            min=value;
        end
    end
end
for i=1:height
    for j=1:638
        value = im(i,j);
        if value~=0
            im(i,j) = value - min;
        end
    end
end
figure; image(im);colormap jet; % 一定要记得转换为uint8
figure; imshow((mapminmax(im)+1)*0.5);
end

