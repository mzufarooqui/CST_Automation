close all;clear all;clc;
ITER = 10000;
for ind = 1:ITER 
A = rand(1)* exp( 1j * rand(1) * 2 * pi ); % LHCP Input signal
B = rand(1)* exp( 1j * rand(1) * 2 * pi ); % RHCP Input signal

Q = 2 * real( A * conj(B) );               % Stokes parameter
U = 2 * imag( A * conj(B) );
I = (abs(A))^2 + (abs(B))^2;
V = (abs(A))^2 - (abs(B))^2;

s   = rand(2,2) + 1j * rand(2,2);         % scattering matrix

[ H K ] = f_Smat2HKmatPolarizer(s(1,1),s(1,2),s(2,1),s(2,2));


QUm = H * [ Q; U ] + K * [ I; V ];

Am = A/2 * ((s(1,1) + s(2,1)) + 1j * (s(1,2) + s(2,2))) + B/2 * ((s(1,1) + s(2,1)) - 1j * (s(1,2) + s(2,2)));
Bm = A/2 * ((s(1,1) - s(2,1)) + 1j * (s(1,2) - s(2,2))) + B/2 * ((s(1,1) - s(2,1)) - 1j * (s(1,2) - s(2,2)));

Qm = 2 * real(Am * conj(Bm));
Um = 2 * imag(Am * conj(Bm));

totError(ind,1) = Qm - QUm(1);
totError(ind,2) = Um - QUm(2);
end
figure;
subplot(1,2,1);plot([1:ITER],totError(:,1));grid on;xlabel('Iteration');ylabel('Q_{Est-Meas}')
subplot(1,2,2);plot([1:ITER],totError(:,2));grid on;xlabel('Iteration');ylabel('U_{Est-Meas}')