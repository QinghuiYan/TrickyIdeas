A=[0 0 0 0;0 0 0 1;0 0 1 0;0 0 1 1;0 1 0 0;0 1 0 1;0 1 1 0;0 1 1 1;1 0 0 0;1 0 0 1;1 0 1 0;1 0 1 1;1 1 0 0;1 1 0 1;1 1 1 0;1 1 1 1];
A=2*A-1;
ra=5;
A=A*ra;

x0=50;y0=50;z0=50;a0=50;
F=1+[0 1 3 2; 4 5 7 6; 8 9 11 10; 12 13 15 14; 0 1 5 4; 2 3 7 6; 8 9 13 12; 10 11 15 14; 0 1 9 8; 2 3 11 10; 4 5 13 12; 6 7 9 11; 0 2 6 4; 1 3 7 5 ; 8 10 14 12; 9 11 15 13; 0 2 10 8; 1 3 11 9; 4 6 14 12; 5 7 15 13; 0 4 12 8; 1 5 13 9; 2 6 14 10; 3 7 15 11];

for theta=(0:0.005:2)*pi
% theta=pi/6;

theta12=0;
theta13=0;
theta14=pi/3;
theta23=0;
theta24=0;
theta34=0;
% theta12=theta;
theta13=theta;
% theta14=theta;
theta23=-theta;
% theta24=theta;
% theta34=theta;

C=eye(4);
C12=[cos(theta12) sin(theta12) 0 0;-sin(theta12) cos(theta12) 0 0;0 0 1 0;0 0 0 1];
C13=[cos(theta13) 0 sin(theta13) 0;0 1 0 0;-sin(theta13) 0 cos(theta13) 0;0 0 0 1];
C14=[cos(theta14) 0 0 sin(theta14);0 1 0 0;0 0 1 0;-sin(theta14) 0 0 cos(theta14)];
C23=[1 0 0 0;0 cos(theta23) sin(theta23) 0;0 -sin(theta23) cos(theta23) 0;0 0 0 1];
C24=[1 0 0 0;0 cos(theta24)  0 sin(theta24);0 0 1 0;0 -sin(theta24) 0 cos(theta24)];
C34=[1 0 0 0;0 1 0 0;0 0 cos(theta34) sin(theta34);0 0 -sin(theta34) cos(theta34)];
% C=C*C12*C13*C14*C23*C24*C34;
C=C*C14*C13*C14^(-1);
% C=C*rot(,4,1,2);

B=[0 1;0 2;0 4;0 8;    1 3;1 5;1 9;    2 3;2 6;2 10;    3 7;3 11;    4 5;4 6;4 12;    5 7;5 13;    6 7;6 14;    7 15;    8 9;8 10;8 12;    9 11;9 13;    10 11;10 14;    11 15;    12 13;12 14;    13 15;    14 15];
B=B+1;
D=A*C;
E=D;
for n=1:length(D(:,1))
    E(n,:)=perspec(x0,y0,z0,a0,D(n,1),D(n,2),D(n,3),D(n,4));
end
m=1: length(B);
% plot3([E(B(m,1),1) E(B(m,2),1)]', [E(B(m,1),2) E(B(m,2),2)]', [E(B(m,1),3) E(B(m,2),3)]');


patch('vertices',E(:,1:3),'faces',F,'FaceColor','r');
patch('vertices',E(:,1:3),'faces',F(1:8,:),'FaceColor','r','LineStyle','none');
patch('vertices',E(:,1:3),'faces',F(8:16,:),'FaceColor','g','LineStyle','none');
patch('vertices',E(:,1:3),'faces',F(17:24,:),'FaceColor','b','LineStyle','none');
alpha 0.2;
view([-1 -1 1]);
grid
axis equal;
axis(2*ra*[-1 1 -1 1 -1 1]);
xlabel('x');ylabel('y');zlabel('z');
pause(0.001);clf;
end