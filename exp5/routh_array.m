clear all; 
close all; 
clc
coeff = input('input vector of your system coefficients: ');
ceoffLength = length(coeff);
rTableColumn = round(ceoffLength/2);
rTable = zeros(ceoffLength,rTableColumn);
rTable(1,:) = coeff(1,1:2:ceoffLength);
if (rem(ceoffLength,2) ~= 0)
    rTable(2,1:rTableColumn - 1) = coeff(1,2:2:ceoffLength);
else
    rTable(2,:) = coeff(1,2:2:ceoffLength);
end
%% Calculate Routh Array table's rows
epss = 0.01;
for i = 3:ceoffLength
       if rTable(i-1,:) == 0
        order = (ceoffLength - i);
        cnt1 = 0;
        cnt2 = 1;
        for j = 1:rTableColumn - 1
            rTable(i-1,j) = (order - cnt1) * rTable(i-2,cnt2);
            cnt2 = cnt2 + 1;
            cnt1 = cnt1 + 2;
        end
    end
    
    for j = 1:rTableColumn - 1
        firstElemUpperRow = rTable(i-1,1);
        rTable(i,j) = ((rTable(i-1,1) * rTable(i-2,j+1)) - ....
            (rTable(i-2,1) * rTable(i-1,j+1))) / firstElemUpperRow;
    end
    if rTable(i,1) == 0
        rTable(i,1) = epss;
    end
end
%%  Compute number of right hand side poles(unstable poles)
%   Initialize unstable poles with zero
unstablePoles = 0;
%   Check change in signs
for i = 1:ceoffLength - 1
    if sign(rTable(i,1)) * sign(rTable(i+1,1)) == -1
        unstablePoles = unstablePoles + 1;
    end
end
fprintf('\n Routh Array Table:\n')
rTable
if unstablePoles == 0
    fprintf('it is a stable system! \n')
else
    fprintf('it is an unstable system!\n')
end
fprintf('\n Number of right hand side poles =%2.0f\n',unstablePoles)
