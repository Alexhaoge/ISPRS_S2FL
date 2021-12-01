clc
clear
close all

[fileName,pathName]=uigetfile('*.mat','Input Data-File');


fullPath = [pathName,fileName];
% load(fullPath);
image = importdata(fullPath);
shape = size(image);
dirName = fileName(1:length(fileName)-4);
dirPath = [pathName,dirName];
if exist(dirPath,'dir')==0
	mkdir(dirPath);
end

if length(shape) < 3
    fprintf("Not hyperspectral image\n");
    image = uint16(image);         
    str = [dirPath,'\',dirName,'.tif'];
    imwrite(image,str,'tif');
    return;
end
fprintf("Number of bands: %d\n",shape(3));

for K=1:shape(3)
    band = image(:,:,K);
    % band = uint16(band);         
    if K == 1
        imwrite(image(:,:,K), [fileName,'.tif']);
    else
        imwrite(image(:,:,K), [fileName,'.tif'], 'WriteMode', 'append');
    end
end

