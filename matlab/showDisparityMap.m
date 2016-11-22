function showDisparityMap( )
width  = 640; % Õâ¸öµØ·½ÄãÒªÖ¸¶¨ÎªÄã×Ô¼ºµÄ¾ØÕóµÄ¿úÒÈ
height = 480; % ÕâÀE²ÒªÖ¸¶¨ÎªÄã×Ô¼ºµÄ¾ØÕóµÄ¸ß¶È
channels = 1; % Í¨µÀÊ?
fs = fopen('disparityMap3.txt', 'rb');
db = fread(fs, 'uint8'); % ×¢Òâ£¬ÕâÀEÃµÄÊÇunsigned int8
fclose(fs);

ou = reshape(db, width, channels*height); % µ÷ÕûÏÔÊ¾¸ñÊ½

im(:,:) = ou(3:end, :)'; % BÍ¨µÀ
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
figure; image(im);colormap jet; % Ò»¶¨Òª¼ÇµÃ×ª»»Îªuint8
figure; imshow((mapminmax(im)+1)*0.5);
end

