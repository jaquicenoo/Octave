function [out]=SchafferF7(in)
%Funcion Schaffer F7

x0=in(1:end-1);
x1=in(2:end);
out = sum(((x0.^2+x1.^2).^(0.25)).*((sin(50*(x0.^2+x1.^2).^(0.10)).^2)+1.0));

% z = 0.5+ (sin^2(sqrt(x^2+y^2))-0.5)/((1+0.01*(x^2+y^2))^2)
%out = sum(0.5+((sin(50*(x0.^2+x1.^2).^(2)-0.5).^2)+1.0)./(1+0.01*(x0.^2+x1.^2).^(2)));