%%%% classic Drosteeffect
clear;clc;
%%
[im,map,alpha] = imread('test.png');
%%
NX=length(im(1,:,1)); X=0:NX-1;
NY=length(im(:,1,1)); Y=0:NY-1;
[MX, MY]=meshgrid(X,Y);

temp=double(flipud(alpha(:,:,1)));
tempx=MX(temp==0);
cxmin=min(tempx(:)); cxmax=max(tempx(:));
tempy=MY(temp==0);
cymin=min(tempy(:)); cymax=max(tempy(:));

X=X-(cxmin+cxmax)/2; Y=Y-(cymin+cymax)/2;
[MX, MY]=meshgrid(X,Y);
MR=sqrt(MX.^2+MY.^2); MT=angle(MX+1i*MY);

%%
temp=double(flipud(im(:,:,1)))+double(flipud(im(:,:,2)))+double(flipud(im(:,:,3)));
temp(flipud(alpha(:,:,1))==0)=nan;
figure(1);
% surf(temp);shading interp; view(2);axis equal;
surf(MX,MY,temp);shading interp; view(2);axis equal;
colormap gray;
%%
flag=1;
for ii=flag*(-1:2)
    hold on;
    temp2=double(isnan(temp));
    temp2(temp2==1)=nan;
    MRC=MR.*exp(flag*0.22*(MT+ii*2*pi));
    MXC=MRC.*cos(MT);
    MYC=MRC.*sin(MT);
    figure(2);
    surf(MXC,MYC,temp2,temp);shading interp; view(2);
end
colormap gray;
axis equal;
xlim([-1 1]*4e3);
ylim([-1 1]*4e3);
%%
saveas(gcf,'testout.png')
%%
% IX=-4e3:4e3;
% IY=X;
% [MIX, MIY]=meshgrid(IX,IY);
% for ii=flag*(-1:2)
%     temp2=double(isnan(temp));
%     temp2(temp2==1)=nan;
%     MRC=MR.*exp(flag*0.22*(MT+ii*2*pi));
%     MXC=MRC.*cos(MT);
%     MYC=MRC.*sin(MT);
%     ICC=griddata(MXC(:),MYC(:),temp(:),MIX,MIY);
%     figure(2);
%     surf(MIX,MIY,ICC);shading interp; view(2);
%     pause;
% end