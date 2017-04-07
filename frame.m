video_file='20170307_1045_w1.avi';
video=VideoReader(video_file);
frame_number=floor(video.Duration*video.FrameRate);

directory=[cd,'/w1/'];

for k=3001:10000
image_name=strcat('20170307_1045_w1\',num2str(k));
image_name=strcat(image_name,'.fig');
I=read(video,k);
I=rgb2gray(I);%三维的需要使用rgb2gray

%{
%subplot(1,2,1);
imshow(I);
title('original image');
%}

O=zeros(video.Height/2,video.Width/2);


for j=1:video.Width/2
    for i=1:video.Height/2
        O(i,j)=mean(mean(I(2*i-1:2*i,2*j-1:2*j)));
    end
end

%subplot(1,2,2);

P=imshow(O,[]);
title('bin 2*2');
%}
name=['w1_',num2str(k),'.fig'];
saveas(P,[directory,name]);
fprintf('%d is finished\n',k);
end