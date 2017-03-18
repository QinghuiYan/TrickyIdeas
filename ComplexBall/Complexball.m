function [ h1,h2 ] = Complexball( f,figind )
%COMPLEXBALL 此处显示有关此函数的摘要
%   此处显示详细说明
    %%
    T=(0:0.001:1)*2*pi;
    P=(-1:0.001:1)*pi/2;
    [MT,MP]=meshgrid(T,P);
    MR=(sin(MP)+1)./cos(MP);
    MX=MR.*cos(MT);
    MY=MR.*sin(MT);
    X2=-1:0.01:1;
    Y2=X2;
    [MX2, MY2]=meshgrid(X2,Y2);
    F1=MX+nan;
    F2=MX2+nan;
    %%
    for ii=1:length(MX(:,1))
        for jj=1:length(MX(1,:))
            F1(ii,jj)=double(feval(f,MX(ii,jj),MY(ii,jj)));
        end
    end
    for ii=1:length(MX2(:,1))
        for jj=1:length(MX2(1,:))
            F2(ii,jj)=double(feval(f,MX(ii,jj),MY(ii,jj)));
        end
    end
    %%
    figure(figind); hold on; box on; grid on;
    h1=surf(cos(MT).*cos(MP),sin(MT).*cos(MP),sin(MP)+1,F1);
    h2=surf(MX2,MY2,-double(isnan(F2)),F2);
    shading interp; %colormap gray;
    axis([-1 1 -1 1 0 2]);
    xlabel('x'); ylabel('y'); zlabel('z');
    view([1 1 1]);
end

