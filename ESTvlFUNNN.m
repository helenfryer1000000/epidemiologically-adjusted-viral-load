function [ESTvlFUNNNout,meandiff,meanageofinfection1,meanageofinfection2]=ESTvlFUNNN(AA,Hvec,normWWW,l10m,Istartz,zvec,tindex,log10xbarmatrix,avec,thebignormH)

PVLisHvecOwNUM1=zeros(length(Hvec),length(normWWW));
PVLisHvecOwNUM2=zeros(length(Hvec),length(normWWW));
Hvecwith0=[0,Hvec];

notsurewhatthisis1=zeros(length(normWWW),length(AA));
notsurewhatthisis2=zeros(length(normWWW),length(AA));

for j=1:length(Hvec)
    for r=1:2
        Istartzri=Istartz{zvec(r)};
        tindexri=tindex(r);
                
        for w=1:length(normWWW)
                        
            incdaysinfzFUN=zeros(1,length(avec));
            w2=min([w,tindexri]);
            incdaysinfzFUN(1:w2)=Istartzri(tindexri-(1:w2)+1);

            P_a_t_s_D=incdaysinfzFUN(AA)./sum(incdaysinfzFUN(AA));
            P_a_t_s_D(incdaysinfzFUN(AA)==0)=0;
            

            if r==1
                PVLisHvecOwNUM1(j,w)=sum((sum(((log10xbarmatrix(AA,w,:)>=Hvecwith0(j))&(log10xbarmatrix(AA,w,:)<Hvecwith0(j+1))).*thebignormH(AA,w,:),3))'.*P_a_t_s_D*normWWW(w),2);
                if j==1
                    notsurewhatthisis1(w,:)=sum(thebignormH(AA,w,:),3)'.*P_a_t_s_D*normWWW(w);
                end               
            else
                PVLisHvecOwNUM2(j,w)=sum((sum(((log10xbarmatrix(AA,w,:)>=Hvecwith0(j))&(log10xbarmatrix(AA,w,:)<Hvecwith0(j+1))).*thebignormH(AA,w,:),3))'.*P_a_t_s_D*normWWW(w),2);
                
                if j==1
                    notsurewhatthisis2(w,:)=sum(thebignormH(AA,w,:),3)'.*P_a_t_s_D*normWWW(w);
                end    
                
            end
        end
        
    end
end

meanageofinfection1=sum(sum(notsurewhatthisis1,1).*avec(AA));
meanageofinfection2=sum(sum(notsurewhatthisis2,1).*avec(AA));

PVLisHvec1=sum(PVLisHvecOwNUM1,2)./sum(sum(PVLisHvecOwNUM1));
PVLisHvec2=sum(PVLisHvecOwNUM2,2)./sum(sum(PVLisHvecOwNUM2));

cumsumPVisHvec1=cumsum(PVLisHvec1);
cumsumPVisHvec2=cumsum(PVLisHvec2);


pcthrough=spline(Hvec,cumsumPVisHvec1,l10m);

if ~issorted(cumsumPVisHvec2,'strictascend')
    [whatmindiff,wheremindiff]=min(abs(cumsumPVisHvec2-pcthrough));
    ESTvlFUNNNout=Hvec(wheremindiff);
else
    ESTvlFUNNNout=spline(cumsumPVisHvec2,Hvec,pcthrough);
end



meandiff=sum(PVLisHvec1.*Hvec')/sum(PVLisHvec1)-sum(PVLisHvec2.*Hvec')/sum(PVLisHvec2);



%     figure(114)
%     hold on; plot(AA*Aspace,P_a_t_s_D{1},'rx-')
%     hold on; plot(AA*Aspace,P_a_t_s_D{2},'bx-')
%     legend('data','flat epidemic')
%     xlabel('age of infection')
%     ylabel('density')
%     
%     figure(124)
%     hold on; plot(Hvec,PVLisHvec1,'rx-')
%     hold on; plot(Hvec,PVLisHvec2,'bx-')
%     legend('data','flat epidemic')
%     xlabel('log10(mapped)')
%     ylabel('density')
% %     
%     figure(29)
%     hold on; plot(Hvec,cumsumPVisHvec1,'kx-')
%     hold on; plot(Hvec,cumsumPVisHvec2,'kx-')
%     xlabel('log10(mapped)')
%     ylabel('cumulative thing')
%     legend('data','flat epidemic')
%     
%     figure(3000)
%     hold on; plot(Hvec,cumsumPVisHvec1,'kx-')
%     hold on; plot(Hvec,cumsumPVisHvec2,'kx-')
    