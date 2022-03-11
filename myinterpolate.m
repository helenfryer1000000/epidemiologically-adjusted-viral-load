function myinterpolate=myinterpolate(RTtimesX,IstartX,AspaceX)

myinterpolate=[];
for i=1:(length(RTtimesX)-1)
    overwhich=[RTtimesX(i):AspaceX:RTtimesX(i+1)];
    overwhich(end)=[];
    intveci=interp1(RTtimesX([i,i+1]),IstartX([i,i+1]),overwhich);
    myinterpolate=[myinterpolate,intveci];
end
myinterpolate=[myinterpolate,IstartX([i+1])];