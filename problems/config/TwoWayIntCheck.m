% Keenan X. Kocan | 07-Sep-016
% Code is to compare the two way interaction matrices against the C++
% calced versions
clc,clear;
BasAll = dlmread('curt_basis_formatted.txt');
Order = 8;
SingleBasis = BasAll(:, 1:Order);
SinglePrecision = SingleBasis' * SingleBasis;
if Order == 4
    %% Order = 4
    TBasis = zeros(500,6);
    % Fixed (Non-Degenerates)
    TBasis(:,1) = BasAll(:,1) .* BasAll(:,1);
    TBasis(:,2) = BasAll(:,2) .* BasAll(:,2);
    % Degenerates (Have duplicates)
    TBasis(:,3) = BasAll(:,2) .* BasAll(:,1);
    TBasis(:,4) = BasAll(:,3) .* BasAll(:,1);
    TBasis(:,5) = BasAll(:,3) .* BasAll(:,2);
    TBasis(:,6) = BasAll(:,4) .* BasAll(:,1);
    
    Precision = TBasis' * TBasis;
    lowerChol = chol(Precision, 'lower')
    
    X = ones(6,1);
    Res = lowerChol\X
    
elseif Order == 8
    %% Order = 8
    Degen = 16; Fixed = 4;
    TBasis = zeros(500,(Degen + Fixed));
    
    % Organized Pairs
%     % Fixed
    Pairs(1:4, 1) = 1:4;
    Pairs(1:4, 2) = 1:4;
%     % Degenerate
%     for I = (Fixed+1):(Fixed + Degen)
%         for J = 1:I
%             if (I + J) <= (Order + 1)
%                 Pairs(end + 1, 1) = I; Pairs(end + 1, 2) = J;
%             end
%         end
%     end
    Pairs(5,1) = 2; Pairs(5,2) = 1;
    Pairs(6:7, 1) = 3; Pairs(6:7,2) = 1:2;
    Pairs(8:10, 1) = 4; Pairs(8:10, 2) = 1:3;
    Pairs(11:14, 1) = 5; Pairs(11:14, 2) = 1:4;
    Pairs(15:17, 1) = 6; Pairs(15:17, 2) = 1:3;
    Pairs(18:19, 1) = 7; Pairs(18:19, 2) = 1:2;
    Pairs(20, 1) = 8; Pairs(20, 2) = 1;
    
    % Fixed (Non-Degenerates)
    for I = 1:Fixed
        TBasis(:,I) = BasAll(:,I) .* BasAll(:,I);
    end
    % Degenerates (Have duplicates)
for I = (Fixed + 1):(Degen + Fixed)
    TBasis(:, I) = BasAll(:, Pairs(I,1)) .* BasAll(:,Pairs(I,2));
end
    
    Precision = TBasis' * TBasis;
%     lowerChol = chol(Precision, 'lower')
    
% Alternative to using Choleksy Decomposition
[U, Sig, V] = svd(Precision);
lam = Sig' * Sig;
QR_In = sqrt(lam) * V';
[Q, RDecomp] = qr(QR_In);

%     X = ones((Degen + Fixed),1);
%     Res = lowerChol\X
    
A1=sum(Precision(:,1));
A2 = sum(Precision(:,2));
A3 = sum(Precision(:,3));
A4 = sum(Precision(:,4));
A5 = sum(Precision(:,5));
A6 = sum(Precision(:,6));
A7 = sum(Precision(:,7));
A8 = sum(Precision(:,8));
A9 = sum(Precision(:,9));
A10 = sum(Precision(:,10));
A11 = sum(Precision(:,11));
A12 = sum(Precision(:,12));
A13 = sum(Precision(:,13));
A14 = sum(Precision(:,14));
A15 = sum(Precision(:,15));
A16 = sum(Precision(:,16));
A17 = sum(Precision(:,17));
A18 = sum(Precision(:,18));
A19 = sum(Precision(:,19));
A20 = sum(Precision(:,20));

    
end
%% TW Order Pairing
Order = 8;
TwOrder = Order + 1;
Keep1=zeros(1,1); Keep2=Keep1;

for R = 1:TwOrder
    for C = 1:R
        if (R + C) <= TwOrder
            Keep1(end + 1) = R; Keep2(end + 1) = C;
        end
    end
end
Keep1 = Keep1(2:end)'; Keep2 = Keep2(2:end)';

Pairs(:,1) = Keep1; Pairs(:,2) = Keep2;

Override = 1;
if Override
    %% Order = 8
    Degen = 4; Fixed = 2;
    TBasis = zeros(500,(Degen + Fixed));
    
 % Organized Pairs
% Fixed
    Pairs(1:2, 1) = 1:2;
    Pairs(1:2, 2) = 1:2;
% Degenerate
    Pairs(3,1:2) = [2, 1];
    Pairs(4,1:2) = [3, 1];
    Pairs(5, 1:2) = [3, 2];
    Pairs(6, 1:2) = [4, 1];
    
    % Fixed (Non-Degenerates)
    for I = 1:Fixed
        TBasis(:,I) = BasAll(:,I) .* BasAll(:,I);
    end
    % Degenerates (Have duplicates)
for I = (Fixed + 1):(Degen + Fixed)
    TBasis(:, I) = BasAll(:, Pairs(I,1)) .* BasAll(:,Pairs(I,2));
end
    
    Precision = TBasis' * TBasis;
%     lowerChol = chol(Precision, 'lower')
    
% Alternative to using Choleksy Decomposition
[U, Sig, V] = svd(TBasis);
lam = Sig' * Sig;
QR_In = sqrt(lam) * V';
[Q, RDecomp] = qr(QR_In);
pseudolwrChol = RDecomp'
lowerChol = chol(Precision,'lower')
end