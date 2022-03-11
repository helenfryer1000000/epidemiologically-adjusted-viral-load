function [EstVLfun2,meandiff,ma1,ma2]=EstVLfun(dataX,WWWmean,WWWsd,Hmean,Hsd,Aspace, WWWspace,log10xbarmatrix, HHspace,avec, WWWvec, Hvec,Istartz)

whatDminVec=dataX{1};
whatDmaxVec=dataX{2};

whatDminVec(whatDminVec>40)=40;
whatDmaxVec(whatDmaxVec>40)=40;

% figure(3330)
% hold on; histogram(whatDvec)

tvec1=dataX{3};
tvec2=ceil(mean(tvec1))+0*tvec1;
tvec=[tvec1,tvec2];
zvec1=dataX{4}; % 1= alpha, 2 =b1177, 3=delta
zvec2=5+0*zvec1;% 5 is the correct z index for flat
zvec=[zvec1,zvec2];
whatl10m=dataX{5};
tindex=tvec/Aspace;

normWWW=normcdf(WWWvec,WWWmean,WWWsd)-normcdf(WWWvec-WWWspace,WWWmean,WWWsd);
normWWW=normWWW/sum(normWWW);
normH=normcdf(Hvec,Hmean,Hsd)-normcdf(Hvec-HHspace,Hmean,Hsd);
normH=normH/sum(normH);
thebignormH=zeros(length(avec),length(WWWvec),length(Hvec));
for i1=1:length(avec)
    for i2=1:length(WWWvec)
        for i3=1:length(Hvec)        
            thebignormH(i1,i2,i3)=normH(i3);     
        end
    end
end

EstVLfun2=0*whatDminVec;
meandiff=0*whatDminVec;
ma1=0*whatDminVec;
ma2=0*whatDminVec;

parfor i=1:length(whatDminVec)
% for i=1:length(whatDminVec)
 [i/length(whatDminVec),i]

    Dmin=whatDminVec(i);
    Dmax=whatDmaxVec(i);
    
      if Dmin>0  
          AA=(Dmin/Aspace):(Dmax/Aspace);
      else
          AA=1:(Dmax/Aspace);
      end
    l10m=whatl10m(i);
    whatzvec=zvec(i,:);
    whattindex=tindex(i,:);
    
    [EstVLfun2(i),meandiff(i),ma1(i),ma2(i)]=ESTvlFUNNN(AA,Hvec,normWWW,l10m,Istartz,whatzvec,whattindex,log10xbarmatrix,avec,thebignormH);
end







    
    
            

