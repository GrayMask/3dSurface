function showDisparityMap( )
width  = 640; % ����ط���Ҫָ��Ϊ���Լ��ľ���Ŀ���
height = 480; % ����E�Ҫָ��Ϊ���Լ��ľ���ĸ߶�
channels = 1; % ͨ���?
fs = fopen('disparityMap3.txt', 'rb');
db = fread(fs, 'uint8'); % ע�⣬����Eõ���unsigned int8
fclose(fs);

ou = reshape(db, width, channels*height); % ������ʾ��ʽ

im(:,:) = ou(3:end, :)'; % Bͨ��
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
figure; image(im);colormap jet; % һ��Ҫ�ǵ�ת��Ϊuint8
figure; imshow((mapminmax(im)+1)*0.5);
end

