A=[0 0 0 0;0 0 0 1;0 0 1 0;0 0 1 1;0 1 0 0;0 1 0 1;0 1 1 0;0 1 1 1;1 0 0 0;1 0 0 1;1 0 1 0;1 0 1 1;1 1 0 0;1 1 0 1;1 1 1 0;1 1 1 1];
A=2*A-1;

F=1+[0 1 3 2; 4 5 7 6; 8 9 11 10; 12 13 15 14;
     0 1 5 4; 2 3 7 6; 8 9 13 12; 10 11 15 14; 
     0 1 9 8; 2 3 11 10; 4 5 13 12; 6 7 15 14; 
     0 2 6 4; 1 3 7 5 ; 8 10 14 12; 9 11 15 13;
     0 2 10 8; 1 3 11 9; 4 6 14 12; 5 7 15 13;
     0 4 12 8; 1 5 13 9; 2 6 14 10; 3 7 15 11];

count = 0;
while(count<1000)
	count = count + 1;
    C = eye(4);
    E=eye(4);
    C=C*rot(0,[1,4]);%原x方向翻
    C=C*rot(0,[2,4]);%原y方向翻
    C=C*rot(0.02*count,[3,4]);%原z方向翻
    
    C=C*rot(pi/12,[2,3]);%x压缩%绕x
    C=C*rot(-pi/6,[1,3]);%x压缩%绕y
    C=C*rot(pi/12,[1,2]);%x压缩%绕z

    D=A*C;
    
    ProjectOn3D = zeros(length(D(:,1)),3);
    for n=1:length(D(:,1))
        ProjectOn3D(n,:) = perspecWei(sawtooth(count/10,0.5)+3,D(n,:),4);
    end

    patch('vertices',ProjectOn3D(:,1:3),'faces',F(1:8,:),'FaceColor','r','LineStyle','none');
    patch('vertices',ProjectOn3D(:,1:3),'faces',F(9:16,:),'FaceColor','g','LineStyle','none');
    patch('vertices',ProjectOn3D(:,1:3),'faces',F(17:24,:),'FaceColor','b','LineStyle','none');
    
    alpha 0.2;view(3);axis equal;
    axis([-5 5 -5 5 -5 5]);
    pause(0.001);clf;
end