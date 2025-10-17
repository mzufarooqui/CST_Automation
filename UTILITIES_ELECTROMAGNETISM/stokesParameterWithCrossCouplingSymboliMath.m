% DESCRIPTION OF THE SCRIPT
% The script calculate the 4AmBm expression when cross coupling is also considered
close all;clear all;clc
ITER_NUM = 1000;
for ind = 1:ITER_NUM
    A = 3;
    B = 5;
    s = rand(4,4);
    
    Q = 2 * real( A * conj(B) );
    U = 2 * imag( A * conj(B) );
    I = abs(A)^2 + abs(B)^2;
    V = abs(A)^2 - abs(B)^2;          
    s31 = s(1,1);
    s32 = s(1,2);
    s41 = s(2,1);    
    s42 = s(2,2);
    
    
    P = A.*((s31+s41) + 1j.*(s32+s42));
    Q = B.*((s31+s41) - 1j.*(s32+s42));
    R = A.*((s31-s41) + 1j.*(s32-s42));
    S = B.*((s31-s41) - 1j.*(s32-s42));
    resNumerical(ind)  = (P+Q)*conj(R+S);
    
    ABC  = A.*conj(B);
    ACB  = conj(A).*B;
    s31C = conj(s31);
    s41C = conj(s41);
    s32C = conj(s32);
    s42C = conj(s42);
    
    resExpression(ind) = ...
         (abs(A).^2 + 2*real(ABC) + abs(B).^2)*(abs(s31).^2-abs(s41).^2+2*1j*imag(s41.*s31C)) ...
        +(abs(A).^2 - 2*real(ABC) + abs(B).^2)*(abs(s32).^2-abs(s42).^2+2*1j*imag(s42.*s32C)) ...
        +1j*(abs(A).^2+2*1j*imag(ABC)-abs(B).^2)*(s32*s31C-s32*s41C+s42*s31C-s42*s41C) ...
        -1j*(abs(A).^2-2*1j*imag(ABC)-abs(B).^2)*(s31*s32C-s31*s42C+s41*s32C-s41*s42C);
    
    Q = 2*real(ABC);
    U = 2*imag(ABC);
    I = abs(A).^2 + abs(B).^2;
    V = abs(A).^2 + abs(B).^2;
    
    resExpression1(ind) =...
         (I+Q)*(abs(s31).^2-abs(s41).^2+2*1j*imag(s41.*s31C)) ...
        +(I-Q)*(abs(s32).^2-abs(s42).^2+2*1j*imag(s42.*s32C)) ...
        +1j*(V+1j*U)*(s32*s31C-s32*s41C+s42*s31C-s42*s41C) ...
        -1j*(V-1j*U)*(s31*s32C-s31*s42C+s41*s32C-s41*s42C);
    
end

close all;clear all;clc;

for ind = 1:10000
    A = 1; B = 1;s = rand(4,4);
    Q = 2 * real( A * conj(B) );
    U = 2 * imag( A * conj(B) );
    I = abs(A)^2 + abs(B)^2;
    V = abs(A)^2 - abs(B)^2;    
    
    Am = A * s(3,1) + B * s(3,2);
    Bm = A * s(4,1) + B * s(4,2);
    Qm(ind) = 2 * real( Am * conj(Bm) );
    Um(ind) = 2 * imag( Am * conj(Bm) );    
    
    H = [ ...
        real( s(3,1) * conj(s(4,2)) + s(3,2) * conj(s(4,1)) ) -imag( s(3,1) * conj(s(4,2)) - s(3,2) * conj(s(4,1)) )
        imag( s(3,1) * conj(s(4,2)) + s(3,2) * conj(s(4,1)) )  real( s(3,1) * conj(s(4,2)) - s(3,2) * conj(s(4,1)) )
        ];
    K = [ ...
        real( s(3,1) * conj(s(4,1)) + s(3,2) * conj(s(4,2)) )  real( s(3,1) * conj(s(4,1)) - s(3,2) * conj(s(4,2)) )
        imag( s(3,1) * conj(s(4,1)) + s(3,2) * conj(s(4,2)) )  imag( s(3,1) * conj(s(4,1)) - s(3,2) * conj(s(4,2)) )
        ];

     QmUmAnal(:,ind) = H * [ Q ; U ] + K * [ I ; V ];
end
figure;
subplot(2,1,1);plot([1:10000],[Qm - QmUmAnal(1,:)]);grid on;xlabel('ind');ylabel('Q_m - Q_m^{Anal}')
subplot(2,1


figure;
subplot(2,1,1),plot(abs(resNumerical-resExpression));ylabel('abs');
subplot(2,1,2),plot(angle(resNumerical-resExpression));ylabel('angle');
figure;
subplot(2,1,1),plot(abs(resNumerical-resExpression1));ylabel('abs');
subplot(2,1,2),plot(angle(resNumerical-resExpression1));ylabel('angle');



syms s31 s41 s32 s42 A B P Q R S
P = A*((s31+s41) + 1j*(s32+s42));
Q = B*((s31+s41) - 1j*(s32+s42));
R = A*((s31-s41) + 1j*(s32-s42));
S = B*((s31-s41) - 1j*(s32-s42));
res      = (P+Q)*conj(R+S);
expRes   = expand(res);





















if 0
    syms s31 s41 s32 s42 A B P Q R S
    P = A*((s31+s41) + 1j*(s32+s42));
    Q = B*((s31+s41) - 1j*(s32+s42));
    R = A*((s31-s41) + 1j*(s32-s42));
    S = B*((s31-s41) - 1j*(s32-s42));
    res      = (P+Q)*conj(R+S);
    expRes   = expand(res);
    latExpr  = latex(expRes);
    latExpr1 = latExpr;
    strInd = {'31','41','32','42'};
    for ind = 1:4
        sElem = ['s' strInd{ind}];
        latExpr1 = strrep(latExpr1,['\overline{\mathrm{' sElem '}}'],[ '\' sElem '^*' ]);
        latExpr1 = strrep(latExpr1,['\mathrm{' sElem '}'],['\' sElem]);
    end
    latExpr1 = strrep(latExpr1,'\mathrm{i}','i');
    latExpr1 = strrep(latExpr1,['\overline{\mathrm{' sElem '}}'],[ '\' sElem '^*' ]);
    oldStr = {'\overline{A}','A','\overline{B}','B'};
    repStr ={'\EpLC','\EpL','\EpRC','\EpR'};
    for ind = 1 : length(oldStr)
        latExpr1 = strrep(latExpr1,oldStr{ind},repStr{ind});
    end
    latExpr1 = strrep(latExpr1,'\,','');
end