function [x,y,z,COMx,COMy,COMz] = definePOI(phi,theta,r,m,COMr,COMt,sidestep,isLeft)
%definePOI - locates joint positions and COM based on angles and lengths
COMx = 0;
COMy = 0;
COMz = 0;
x = zeros(1,length(phi)+1);
z = zeros(1,length(x));
y = zeros(1,length(x));

if(isLeft)
    x(1) = sidestep;
    for n = 2:1:length(phi)+1
        COMx = x(n-1) + m(n-1)*COMr(n-1)*cos(phi(n-1)) + m(n-1)*COMt(n-1)*cos(phi(n-1) + pi/2);
        COMz = z(n-1) + m(n-1)*COMr(n-1)*sin(phi(n-1))*sin(theta(n-1)) + m(n-1)*COMt(n-1)*sin(phi(n-1) + pi/2);
        COMy = y(n-1) + m(n-1)*COMr(n-1)*cos(theta(n-1));
    
        x(n) = x(n-1) + r(n-1)*cos(phi(n-1));
        y(n) = y(n-1) + r(n-1)*cos(theta(n-1));
        z(n) = z(n-1) + r(n-1)*sin(phi(n-1))*sin(theta(n-1));
    end
else
    x(length(phi)+1) = sidestep;
    for n = length(phi):-1:1
        COMx = x(n+1) - m(n)*COMr(n)*cos(phi(n)) - m(n)*COMt(n)*cos(phi(n) + pi/2);
        COMz = z(n+1) - m(n)*COMr(n)*sin(phi(n))*sin(theta(n)) - m(n)*COMt(n)*sin(phi(n) + pi/2);
        COMy = y(n+1) + m(n)*COMr(n)*cos(theta(n));
    
        x(n) = x(n+1) - r(n)*cos(phi(n));
        y(n) = y(n+1) + r(n)*cos(theta(n));
        z(n) = z(n+1) - r(n)*sin(phi(n))*sin(theta(n));
    end
end
COMx = COMx / sum(m);
COMy = COMy / sum(m);
COMz = COMz / sum(m);
end

