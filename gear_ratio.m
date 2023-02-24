clc
clear
format short g
format compact
close all

J_l = 1.3e-3; %load inertia, kgm2
J_m = 1.3e-7;
f = 9.55e-9; %friction coef, Nms/rad
T_s = 0.0215; %static torque,Nm
alpha_l = 10.5; %max output shaft acc,rad/s2
C = 0.004;
m = 6.667e-6;
N=0.4:0.2:15; %gear ratio
omega_l=0.4:0.2:15;

for i=1:length(omega_l)
    for j=1:length(N)
        omega_m(i,j) = N(j)*omega_l(i);
        T_m(i,j) = m*omega_m(i,j) + C;
        T_d(i,j) = N(j)*T_m(i,j);
        T_l(i,j) = f*omega_l(i) + T_s;
       if T_d(i,j)>T_l(i,j)
         conf(i,j) = 1;
       else
         conf(i,j) = 0;
       end
    end
end

%  mesh (omega_l,N, T_d)
%  hold on
%  mesh (omega_l,N, T_l) %figure 1

   mesh (omega_l,N,conf) %figure 2



