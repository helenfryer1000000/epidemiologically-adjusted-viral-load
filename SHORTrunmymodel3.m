clear all
clc
% % 
% % %% are we deleting too many time points
% % %%check issues with minusinfinity
% % 
% % global ccc WWWvec avec Aspace Hvec cutofffortesting
% % 
% % %cutofffortesting=170; %in up phase
% % % cutofffortesting=197; %main peak
% % %cutofffortesting=255; %down phase
% % cutofffortesting=30000; % all
% % 
% % 
% % Aspace=0.25;
% % %Aspace=0.1;
% % WWWspace=Aspace;
% % HHspace=0.1;
% % %Hspaceend=7; %6.5 %IMPORTANT THIS CHANGES THE ESTIMATES DRAMATICALLY!!!
% % Hspaceend=8; %6.5 %IMPORTANT THIS CHANGES THE ESTIMATES DRAMATICALLY!!!
% % 
% % [whatDminVec,whatDmaxVec,whattvec,whatzvec,whatotherdata,Istartz,verylargest]=incdaysinfzFUN_patsD(Aspace);
% % % % % 
% %save('outofstage1_15022')
% load('outofstage1_15022')
% % % % 
% WWWsd=5.18; %kissler
% Hsd=0.85; %kissler
% % bigwvecX=[10.8]; %kissler
% % bigwvecX=[5:2.5:15]; %kissler
% %bigwvecX=[5.18];
% % bigwvecX=[5.18,15.9];
% % bigwvecX=[15.98]; %upper
% % bigwvecX=[5.18]; %lower
% %HvecX=[4.37]; %kissler
% % HvecX=[6.3]; %estimate
% % HvecX=[3.52,5.22];
% % HvecX=[3.52]; %lower
% %HvecX=[5.22]; %upper
% % % 
% % % 
% WWWvec=WWWspace:WWWspace:40; %if this is too small then can get -INf problems!!
% Hvec=HHspace:HHspace:Hspaceend;
% 
% 
% % % % %%%change W between delta and alpha%%%%%
% WsplitWWvecz{1}=[0.3]; %alpha
% WsplitWWvecz{2}=[0.3]; %b1177
% WsplitWWvecz{3}=[0.3]; %delta
% WsplitWWvecz{4}=[0.3]; %omicron
% 
% bigwvecXz{1}=[8];  %alpha
% bigwvecXz{2}=[8];  %b1177
% bigwvecXz{3}=[8];  %delta
% bigwvecXz{4}=[8];  %omicron
%              
% HvecXvecz{1}=[6.3]; %alpha
% HvecXvecz{2}=[6.3]; %b1177       
% HvecXvecz{3}=[6.3]; %delta
% HvecXvecz{4}=[6.3]; %omicron
% % 
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % 
% % % % % 
% % % % % WsplitWWvecz{1}=[0.1,0.1,0.1,0.1,0.1;...
% % % % %                  0.2,0.2,0.2,0.2,0.2;...
% % % % %                  0.3,0.3,0.3,0.3,0.3;...
% % % % %                  0.4,0.4,0.4,0.4,0.4;...
% % % % %                  0.5,0.5,0.5,0.5,0.5];     %alpha
% % % % % 
% % % % % WsplitWWvecz{2}=[0.3,0.3,0.3,0.3,0.3;...
% % % % %                  0.3,0.3,0.3,0.3,0.3;...
% % % % %                  0.3,0.3,0.3,0.3,0.3;...
% % % % %                  0.3,0.3,0.3,0.3,0.3;...
% % % % %                  0.3,0.3,0.3,0.3,0.3];     %b1177
% % % % % 
% % % % % % WsplitWWvecz{2}=[0.1,0.2,0.3,0.4,0.5;...
% % % % % %                  0.1,0.2,0.3,0.4,0.5;...
% % % % % %                  0.1,0.2,0.3,0.4,0.5;...
% % % % % %                  0.1,0.2,0.3,0.4,0.5;...
% % % % % %                  0.1,0.2,0.3,0.4,0.5];   %b1177
% % % % % 
% % % % % WsplitWWvecz{3}=[0.1,0.2,0.3,0.4,0.5;...
% % % % %                  0.1,0.2,0.3,0.4,0.5;...
% % % % %                  0.1,0.2,0.3,0.4,0.5;...
% % % % %                  0.1,0.2,0.3,0.4,0.5;...
% % % % %                  0.1,0.2,0.3,0.4,0.5];     %delta 
% % % % % % 
% % % % % % WsplitWWvecz{3}=[0.3,0.3,0.3,0.3,0.3;...
% % % % % %                   0.3,0.3,0.3,0.3,0.3;...
% % % % % %                   0.3,0.3,0.3,0.3,0.3;...
% % % % % %                   0.3,0.3,0.3,0.3,0.3;...
% % % % % %                   0.3,0.3,0.3,0.3,0.3];    %delta
% 
% % % % % % WsplitWWvecz{4}=[0.3,0.3,0.3,0.3,0.3;...
% % % % % %                   0.3,0.3,0.3,0.3,0.3;...
% % % % % %                   0.3,0.3,0.3,0.3,0.3;...
% % % % % %                   0.3,0.3,0.3,0.3,0.3;...
% % % % % %                   0.3,0.3,0.3,0.3,0.3];    %omicron
% 
% 
% % % % %                           
% % % % % HvecXvecz{1}=[6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3];         %alpha
% % % % % 
% % % % % HvecXvecz{2}=[6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3];         %b1177
% % % % %              
% % % % % HvecXvecz{3}=[6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3];        %delta
% 
% % % % % HvecXvecz{4}=[6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3;...
% % % % %               6.3,6.3,6.3,6.3,6.3];        %omicron
% % % % 
% % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % 
% % % % % % PEAKalphaLM =
% % % % % % 
% % % % % %     6.5770    6.5768    6.5770    6.5768    6.5768
% % % % % %     6.5786    6.5786    6.5786    6.5786    6.5786
% % % % % %     6.5787    6.5791    6.5772    6.5789    6.5789
% % % % % %     6.5777    6.5779    6.5773    6.5777    6.5777
% % % % % %     6.5766    6.5766    6.5766    6.5766    6.5766
% % % % % % 
% % % % % % 
% % % % % % PEAKdeltaLM =
% % % % % % 
% % % % % %     5.6823    5.8725    6.0375    6.2073    6.3964
% % % % % %     5.6752    5.8726    6.0371    6.2025    6.3753
% % % % % %     5.6508    5.8665    6.0269    6.2046    6.3577
% % % % % %     5.6656    5.8455    6.0171    6.2160    6.3686
% % % % % %     5.6419    5.8364    6.0505    6.2065    6.3437
% % % % % 
% % % % % %%%%%%%%%%%%%%%%%%%%%%    
% 
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % %%%change W between delta and alpha%%%%%
% % % % 
% % % % WsplitWWvecz{1}=[0.3,0.3,0.3,0.3,0.3]; %alpha
% % % % WsplitWWvecz{2}=[0.1,0.2,0.3,0.4,0.5]; %b1177
% % % % WsplitWWvecz{3}=[0.3,0.3,0.3,0.3,0.3]; %delta
% % % % WsplitWWvecz{4}=[0.3,0.3,0.3,0.3,0.3]; %omicron
% 
% % % % bigwvecXz{1}=[10.8,10.8,10.8,10.8,10.8]; %alpha
% % % % bigwvecXz{2}=[5,   7.5,   10,12.5,  15]; %b1177
% % % % bigwvecXz{3}=[10.8,10.8,10.8,10.8,10.8]; %delta
% % % % bigwvecXz{4}=[10.8,10.8,10.8,10.8,10.8]; %omicron
% % % %              
% % % % HvecXvecz{1}=[6.3,6.3,6.3,6.3,6.3]; %alpha
% % % % HvecXvecz{2}=[6.3,6.3,6.3,6.3,6.3]; %b1177       
% % % % HvecXvecz{3}=[6.3,6.3,6.3,6.3,6.3]; %delta
% % % % HvecXvecz{4}=[6.3,6.3,6.3,6.3,6.3]; %omicron
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%%%
% % % 
% dataXXXz{1}={whatDminVec(whatzvec==1),whatDmaxVec(whatzvec==1),whattvec(whatzvec==1),whatzvec(whatzvec==1),whatotherdata.CTtolog10mapped(whatzvec==1)};
% dataXXXz{2}={whatDminVec(whatzvec==2),whatDmaxVec(whatzvec==2),whattvec(whatzvec==2),whatzvec(whatzvec==2),whatotherdata.CTtolog10mapped(whatzvec==2)};
% dataXXXz{3}={whatDminVec(whatzvec==3),whatDmaxVec(whatzvec==3),whattvec(whatzvec==3),whatzvec(whatzvec==3),whatotherdata.CTtolog10mapped(whatzvec==3)};
% dataXXXz{4}={whatDminVec(whatzvec==4),whatDmaxVec(whatzvec==4),whattvec(whatzvec==4),whatzvec(whatzvec==4),whatotherdata.CTtolog10mapped(whatzvec==4)};
% 
% 
% whatDminVecPATCH=[dataXXXz{1}{1};dataXXXz{2}{1};dataXXXz{3}{1};dataXXXz{4}{1}];
% whatDmaxVecPATCH=[dataXXXz{1}{2};dataXXXz{2}{2};dataXXXz{3}{2};dataXXXz{4}{2}];
%    whattvecPATCH=[dataXXXz{1}{3};dataXXXz{2}{3};dataXXXz{3}{3};dataXXXz{4}{3}];
%    whatzvecPATCH=[dataXXXz{1}{4};dataXXXz{2}{4};dataXXXz{3}{4};dataXXXz{4}{4}];
% whatotherdataPATCH=[whatotherdata(whatzvec==1,:);whatotherdata(whatzvec==2,:);whatotherdata(whatzvec==3,:);whatotherdata(whatzvec==4,:)];
% % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % 
% EstimatedCTz=cell(size(WsplitWWvecz));
% meandiff=cell(size(WsplitWWvecz));
% for ee=1:length(EstimatedCTz)
%     WsplitWWvec=WsplitWWvecz{ee};
%     dataXXX=dataXXXz{ee};
%     HvecX=HvecXvecz{ee};
%     bigwvecX=bigwvecXz{ee};
%     WsplitWWvec
%     sizeWsplitWWvec=size(WsplitWWvec);
%     for i1=1:sizeWsplitWWvec(1)
%         for ii1=1:sizeWsplitWWvec(2)
%             [ee,i1,ii1]
%             log10xbarmatrix=log10mappedFUN2(avec,WWWvec,Hvec,HHspace,WsplitWWvec(i1,ii1));
%             for i2=1:length(bigwvecX)
%                 [out1,out2,out3,out4]=EstVLfun(dataXXX,bigwvecX(i2),WWWsd,HvecX(i1,ii1),Hsd,Aspace,WWWspace,log10xbarmatrix,HHspace,avec,WWWvec,Hvec,Istartz);
%                 
%                 EstimatedCTz{ee}{i1,ii1,i2}=(out1-ccc(2))/ccc(1);
%                  
%                 ageofinfections1{ee}{i1,ii1,i2}=out3;
%                 ageofinfections2{ee}{i1,ii1,i2}=out4;
%                 
%                 %  meandiff{ee}{i1,i2,i3}=out2; %???
%             end
%         end
%     end
% end
% dddd='this has ended'
% % % save('outofstage2_singlerun170222')

load('outofstage2_singlerun170222')



% % 
% % 
% % % figure
% % % heatmap(bigwvecX,WsplitWWvec,meandiff)
% % % xlabel('infected periods(days)')
% % % ylabel('peak fraction')
% % 
% % 
% % % outdataTABLE.eitherbeforepositive=(outdataTABLE.eitherbeforepositive=="true")*1;
% % 
% % %     ALPHAvacc=(outdataTABLE.z==1).*(outdataTABLE.eitherbeforepositive==1)*1;
% % %  ALPHAnotvacc=(outdataTABLE.z==1).*(outdataTABLE.eitherbeforepositive==0)*1;
% % %     DELTAvacc=(outdataTABLE.z==3).*(outdataTABLE.eitherbeforepositive==1)*1;
% % %  DELTAnotvacc=(outdataTABLE.z==3).*(outdataTABLE.eitherbeforepositive==0)*1;
% % %    NOTvocvacc=(outdataTABLE.z==2).*(outdataTABLE.eitherbeforepositive==1)*1;
% % % NOTvocNOTvacc=(outdataTABLE.z==2).*(outdataTABLE.eitherbeforepositive==0)*1;
% % % outdataTABLE=[array2table([ALPHAvacc, ALPHAnotvacc,DELTAvacc,DELTAnotvacc,NOTvocvacc,NOTvocNOTvacc],'VariableNames',{'ALPHAvacc','ALPHAnotvacc','DELTAvacc','DELTAnotvacc','NOTvocvacc','NOTvocNOTvacc'}),outdataTABLE];
% %  
% % isalphaCOEFF=zeros(height(WsplitWWvec),width(WsplitWWvec),length(bigwvecX));
% % isdeltapvals=zeros(height(WsplitWWvec),width(WsplitWWvec),length(bigwvecX));
% % constantCOEFF=zeros(height(WsplitWWvec),width(WsplitWWvec),length(bigwvecX));
% % sourceageCOEFF=zeros(height(WsplitWWvec),width(WsplitWWvec),length(bigwvecX));
% % EstimatedCTPATCH=cell(height(WsplitWWvec),width(WsplitWWvec),length(bigwvecX));
% 
% 
% %%somewhere need to add back somthing about just testing people not in
% %%first infection
% 
%
% load('BIGAllout070122short') %big version compare alpha and b1177
% load('BIGAllout110122short') %big version compare alpha and delta




sizeWsplitWWvec=size(WsplitWWvec);
% % for i1=3
% %     for ii1=3
for i1=1:sizeWsplitWWvec(1) 
    for ii1=1:sizeWsplitWWvec(2)
        for i2=1:length(bigwvecX)
            
            EstimatedCTPATCH{i1,ii1,i2}=[];
             ageofinfections1PATCH{i1,ii1,i2}=[];
            for ee=1:length(EstimatedCTz)
                EstimatedCTPATCH{i1,ii1,i2}=[EstimatedCTPATCH{i1,ii1,i2};EstimatedCTz{ee}{i1,ii1,i2}];
                 ageofinfections1PATCH{i1,ii1,i2}=[ageofinfections1PATCH{i1,ii1,i2};ageofinfections1{ee}{i1,ii1,i2}];
            end
            
             outdataTABLEPATCH=[array2table([ageofinfections1PATCH{i1,ii1,i2},EstimatedCTPATCH{i1,ii1,i2},whatzvecPATCH],'VariableNames',{'ave_age_of_infec','estCT','whatzvecPATCH'}),whatotherdataPATCH];
%            outdataTABLEPATCH=[array2table([EstimatedCTPATCH{i1,ii1,i2},whatzvecPATCH],'VariableNames',{'estCT','whatzvecPATCH'}),whatotherdataPATCH];
            

%%%%     WHICH GROUP OF DATA!!!!
              outdataTABLEPATCH=outdataTABLEPATCH(categorical(outdataTABLEPATCH.protocol)=='ARTIC_NORT',:);
%              outdataTABLEPATCH=outdataTABLEPATCH(categorical(outdataTABLEPATCH.protocol)=='veSeq',:);
            
             
            outdataTABLEPATCH(~isfinite(outdataTABLEPATCH.estCT),:)=[];
             outdataTABLEPATCH(outdataTABLEPATCH.estCT>30,:)=[];
            
            isb1177=(outdataTABLEPATCH.ForVLb117=='False')*1;
            isOmicron=(outdataTABLEPATCH.ForVLb117=='Omicron')*1;
            
            outdataTABLEPATCH=[outdataTABLEPATCH,array2table(isb1177),array2table(isOmicron)];
            
            
            vacc1GivenALPHA=outdataTABLEPATCH.isVacc1only.*(outdataTABLEPATCH.ForVLb117=='True');
            vacc1GivenDELTA=outdataTABLEPATCH.isVacc1only.*(outdataTABLEPATCH.ForVLb117=='Delta');
            vacc1GivenOMICRON=outdataTABLEPATCH.isVacc1only.*(outdataTABLEPATCH.ForVLb117=='Omicron');
            outdataTABLEPATCH=[outdataTABLEPATCH,array2table(vacc1GivenALPHA),array2table(vacc1GivenDELTA),array2table(vacc1GivenOMICRON)];
                        
            
            vacc2GivenALPHA=outdataTABLEPATCH.isVacc2.*(outdataTABLEPATCH.ForVLb117=='True');
            vacc2GivenDELTA=outdataTABLEPATCH.isVacc2.*(outdataTABLEPATCH.ForVLb117=='Delta');
            vacc2GivenOMICRON=outdataTABLEPATCH.isVacc2.*(outdataTABLEPATCH.ForVLb117=='Omicron');
            outdataTABLEPATCH=[outdataTABLEPATCH,array2table(vacc2GivenALPHA),array2table(vacc2GivenDELTA),array2table(vacc2GivenOMICRON)];
            
            VaccDate3=datetime(outdataTABLEPATCH.covid_vaccine_date_3(:),'InputFormat','ddMMMyyyy');
            isVacc3=VaccDate3+14<=outdataTABLEPATCH.collection_date;
             outdataTABLEPATCH=[outdataTABLEPATCH,array2table(isVacc3)];

            isVacc2only=(outdataTABLEPATCH.isVacc2*1).*((~isVacc3)*1);
            vacc2onlyGivenDELTA=isVacc2only.*(outdataTABLEPATCH.ForVLb117=='Delta');
            vacc2onlyGivenOMICRON=isVacc2only.*(outdataTABLEPATCH.ForVLb117=='Omicron');
            outdataTABLEPATCH=[outdataTABLEPATCH,array2table(isVacc2only),array2table(vacc2onlyGivenDELTA),array2table(vacc2onlyGivenOMICRON)];
            
            vacc3GivenDELTA=isVacc3.*(outdataTABLEPATCH.ForVLb117=='Delta');
            vacc3GivenOMICRON=isVacc3.*(outdataTABLEPATCH.ForVLb117=='Omicron');
            outdataTABLEPATCH=[outdataTABLEPATCH,array2table(vacc3GivenDELTA),array2table(vacc3GivenOMICRON)];
            
            isABpos=(outdataTABLEPATCH.whatinfectionnumber==-1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0);
            outdataTABLEPATCH=[outdataTABLEPATCH,array2table(isABpos)];
            
            
            medianfromB1177=median(outdataTABLEPATCH.timefromfirst(outdataTABLEPATCH.ForVLb117=='False'));
            medianfromDELTA=median(outdataTABLEPATCH.timefromfirst(outdataTABLEPATCH.ForVLb117=='Delta'));
            medianfromALPHA=median(outdataTABLEPATCH.timefromfirst(outdataTABLEPATCH.ForVLb117=='True' ));
            medianfromB1177=median(outdataTABLEPATCH.timefromfirst(outdataTABLEPATCH.ForVLb117=='False'));
            medianfromALPHAorB1177=median(outdataTABLEPATCH.timefromfirst(outdataTABLEPATCH.ForVLb117~='Delta'));
            
%           timefromfirstgivenAorD=(outdataTABLEPATCH.ForVLb117~='False'.*(outdataTABLEPATCH.timefromfirst-medianfromAorD);
            timefromfirstgivenDELTA=(outdataTABLEPATCH.ForVLb117=='Delta').*(outdataTABLEPATCH.timefromfirst-medianfromDELTA);
            timefromfirstgivenALPHA=(outdataTABLEPATCH.ForVLb117=='True' ).*(outdataTABLEPATCH.timefromfirst-medianfromALPHA);
            timefromfirstgivenb1177=(outdataTABLEPATCH.ForVLb117=='False').*(outdataTABLEPATCH.timefromfirst-medianfromB1177);
            timefromfirstgivenALPHAorb1177=(outdataTABLEPATCH.ForVLb117=='False').*(outdataTABLEPATCH.timefromfirst-medianfromALPHAorB1177);
            outdataTABLEPATCH=[outdataTABLEPATCH,array2table(timefromfirstgivenDELTA),array2table(timefromfirstgivenALPHA),array2table(timefromfirstgivenb1177),array2table(timefromfirstgivenALPHAorb1177)];

            timesincevacc240days=outdataTABLEPATCH.Timesincevacc2;
             timesincevacc240days(timesincevacc240days>300)=300;
            
            outdataTABLEPATCH=[outdataTABLEPATCH,array2table(timesincevacc240days)];
      
            sizeouttab=size(outdataTABLEPATCH)
           
            head(outdataTABLEPATCH)  
            
            outdataTABLEPATCH = renamevars(outdataTABLEPATCH,["source_age","timefromfirst","timesincevacc240days"],["age","SampleDate","TimeDoubleVacc"]);
            
             
%%%%%%%%%%%%%THIS IS THE CORRECT LIST
             
 
              whatXvars={'isb1177','isDELTA','SampleDate','age','isABpos','vacc1GivenALPHA','vacc2GivenALPHA','vacc1GivenDELTA','vacc2GivenDELTA','isitAZ','TimeDoubleVacc','isMALE'}; 
%              whatXvars={'isb1177','isDELTA','SampleDate','age','isABpos','vacc1GivenALPHA','vacc2GivenALPHA','vacc1GivenDELTA','vacc2GivenDELTA'}; 
%              whatXvars={           'isDELTA','SampleDate','age','isABpos','vacc1GivenALPHA','vacc2GivenALPHA','vacc1GivenDELTA','vacc2GivenDELTA'}; 
%              whatXvars={'isb1177',           'SampleDate','age','isABpos','vacc1GivenALPHA','vacc2GivenALPHA','vacc1GivenDELTA','vacc2GivenDELTA'}; 
%               whatXvars={'isb1177','isDELTA',              'age','isABpos','vacc1GivenALPHA','vacc2GivenALPHA','vacc1GivenDELTA','vacc2GivenDELTA','TimeDoubleVacc','isMALE'}; 
               whatXvars={'isb1177','isDELTA',              'age','isABpos','vacc1GivenALPHA','vacc2GivenALPHA','vacc1GivenDELTA','vacc2GivenDELTA'}; 
               
                whatXvars={'isb1177','isDELTA',              'age','isABpos','vacc1GivenALPHA','vacc2GivenALPHA','vacc1GivenDELTA','vacc2GivenDELTA'}; 
%                whatXvars={'isb1177','isDELTA','SampleDate',       'isABpos','vacc1GivenALPHA','vacc2GivenALPHA','vacc1GivenDELTA','vacc2GivenDELTA'}; 
                                                
                                                

  %%%%%%%%%%%%omicron asses
%                 whatXvars={'isOmicron','age','SampleDate','isABpos','vacc1GivenDELTA','vacc2onlyGivenDELTA','vacc3GivenDELTA','vacc1GivenOMICRON','vacc2onlyGivenOMICRON','vacc3GivenOMICRON','TimeDoubleVacc','isitAZ'};
%                 whatXvars={'isOmicron','age','SampleDate','isABpos','vacc1GivenDELTA','vacc2onlyGivenDELTA','vacc3GivenDELTA','vacc1GivenOMICRON','vacc2onlyGivenOMICRON','vacc3GivenOMICRON'};
%                whatXvars={'isOmicron','age',               'isABpos','vacc1GivenDELTA','vacc2onlyGivenDELTA','vacc3GivenDELTA','vacc1GivenOMICRON','vacc2onlyGivenOMICRON','vacc3GivenOMICRON','TimeDoubleVacc'};
%                whatXvars={            'age','SampleDate','isABpos','vacc1GivenDELTA','vacc2onlyGivenDELTA','vacc3GivenDELTA','vacc1GivenOMICRON','vacc2onlyGivenOMICRON','vacc3GivenOMICRON','TimeDoubleVacc','isitAZ'};
                whatXvars={'isOmicron','age',            'isABpos','vacc1GivenDELTA','vacc2onlyGivenDELTA','vacc3GivenDELTA','vacc1GivenOMICRON','vacc2onlyGivenOMICRON','vacc3GivenOMICRON'};
                whatXvars={'isOmicron','age','SampleDate','isABpos','vacc1GivenDELTA','vacc2onlyGivenDELTA','vacc3GivenDELTA','vacc1GivenOMICRON','vacc2onlyGivenOMICRON','vacc3GivenOMICRON','isMALE'};


            REGRESSmatrixX=outdataTABLEPATCH(:,whatXvars);
            REGRESSmatrixY=outdataTABLEPATCH(:,{'estCT'});  
            
%             figure;
%             corrplot(REGRESSmatrixX)
%             [R,PValue] = corrplot(REGRESSmatrixX,'tail','right')
            

            [heightX,widthX]=size(REGRESSmatrixX);
%              widthX=2
           [XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] = plsregress(zscore(table2array(REGRESSmatrixX)),zscore(table2array(REGRESSmatrixY)),widthX);
%            [XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] = plsregress(zscore(table2array(REGRESSmatrixX)),table2array(REGRESSmatrixY),widthX);
            
%              x=std(x)*z+mean(x)
             
              whatsdX=std(table2array(REGRESSmatrixX));
              whatsdY=std(table2array(REGRESSmatrixY));
              
%               scalebackbeta=[0;BETA(2:end).*whatsdX'/whatsdY];
              scalebackbeta=[0;BETA(2:end)./whatsdX'*whatsdY];
              
              whatsdXp0=[0,whatsdX]';
              tableofBETA=[array2table(['constant',whatXvars(:)']'),array2table(BETA),array2table(scalebackbeta),array2table(whatsdXp0)]
             
            W0 = stats.W ./ sqrt(sum(stats.W.^2,1));
            p = size(XL,1);
            sumSq = sum(XS.^2,1).*sum(YL.^2,1);
            vipScore = sqrt(p*sum(sumSq.*(W0.^2),2)./ sum(sumSq,2));
            indVIP = find(vipScore >= 1)
            
            figure(52)
            hold on; plot(1:length(vipScore),vipScore,'ko')
            hold on; plot(indVIP,vipScore(indVIP),'ko')
            hold on; plot([1 length(vipScore)],[1 1],'--k')         
            xticks(1:length(whatXvars))
            xticklabels(whatXvars)
            hold off
            axis tight
            xlabel('Predictor Variables')
            ylabel('VIariable Importance in Projection Scores')

             [Xl,Yl,Xs,Ys,beta,pctVar,PLSmsep] = plsregress(zscore(table2array(REGRESSmatrixX)),zscore(table2array(REGRESSmatrixY)),widthX,'CV',widthX);

             
             %              [Xl,Yl,Xs,Ys,beta,pctVar,PLSmsep] = plsregress(zscore(table2array(REGRESSmatrixX)),table2array(REGRESSmatrixY),widthX,'CV',widthX);
%             PCRmsep = sum(crossval(@pcrsse,table2array(REGRESSmatrixX),table2array(REGRESSmatrixY),'KFold',widthX),1)/heightX;
            figure(45454)
            hold on; plot(0:widthX,PLSmsep(2,:),'r-o');
%             hold on; plot(0:widthX,PCRmsep,'r-^');
            xlabel('Number of components');
            ylabel('Estimated Mean Squared Prediction Error');

            figure;(887);
            hold on; scatter(XL(:,1),XL(:,2))
            text(XL(:,1)+3,XL(:,2),whatXvars)
            siT=100;
             axis([-siT,siT,-siT,siT])
            hold on; plot([-siT,siT],[0,0],'k:')
            hold on; plot([0,0],[-siT,siT],'k:')
            xlabel('1st component loadings')
            ylabel('2nd component loadings') 
            
%             figure;(887)
%             hold on; scatter(XL(:,3),XL(:,4))
%             text(XL(:,3)+3,XL(:,4),whatXvars)
%             siT=160;
%             axis([-siT,siT,-siT,siT])
%             hold on; plot([-siT,siT],[0,0],'k:')
%             hold on; plot([0,0],[-siT,siT],'k:')
%             xlabel('3rd component loadings')
%             ylabel('4th component loadings') 
            
            figure(2323233)
%           hold on; plot(1:widthX,cumsum(100*PCTVAR(2,:)),'-bx');
             hold on; plot(1:widthX,cumsum(100*PCTVAR(2,:)),'-ro');
%             ylim([0,5])
            xlabel('Number of PLS components');
            ylabel('Percent Variance Explained in y');
            
            XL=XL
            
                         
               [QRoutCOEFF,QRoutpvalue]=qr_standard(Xs,table2array(REGRESSmatrixY),0.5,'test','wald','method','interior')


            fffddd= fitlm(Xs,table2array(REGRESSmatrixY))
                      
            [QRoutCOEFF,QRoutpvalue]=qr_standard(table2array(REGRESSmatrixX),table2array(REGRESSmatrixY),0.5,'test','kernel');
            ispvalles005=(QRoutpvalue<0.05)*1;
             coeffTABLE=array2table([QRoutCOEFF';QRoutpvalue';ispvalles005'],'VariableNames',['constant',whatXvars])
%             
%              isdeltaCOEFF(i1,ii1,i2)=coeffTABLE.isDELTA(1);
%              isdeltapvals(i1,ii1,i2)=coeffTABLE.isDELTA(2);
%              
%              isb1177COEFF(i1,ii1,i2)=coeffTABLE.isb1177(1);
%              isb1177pvals(i1,ii1,i2)=coeffTABLE.isb1177(2);
%              
%              WIDTH_HMisdeltaCOEFF(ii1,i2)=coeffTABLE.isDELTA(1);
%              WIDTH_HMisdeltapvals(ii1,i2)=coeffTABLE.isDELTA(2);
%              
%              WIDTH_HMisb1177COEFF(ii1,i2)=coeffTABLE.isb1177(1);
%              WIDTH_HMisb1177pvals(ii1,i2)=coeffTABLE.isb1177(2);
             
             
             
             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             XwhatcutooffalphaforCHANGEFIG=204; %205; %211     
%              XwhatcutooffalphaforCHANGEFIG=212; %205; %211     
             XplayalphaTABLEpatch=outdataTABLEPATCH;
             XplayalphaTABLEpatch=XplayalphaTABLEpatch(find((XplayalphaTABLEpatch.whatzvecPATCH==1).*isfinite(XplayalphaTABLEpatch.ct_mean).*isfinite(XplayalphaTABLEpatch.estCT).*(XplayalphaTABLEpatch.whatinfectionnumber==1).*(XplayalphaTABLEpatch.vaccbeforpositive14==0)),:);
             XearlyTIMEoutdataTABLEPATCH=XplayalphaTABLEpatch;
             XlateTIMEoutdataTABLEPATCH=XplayalphaTABLEpatch;
             XearlyTIMEoutdataTABLEPATCH(XearlyTIMEoutdataTABLEPATCH.SampleDate>XwhatcutooffalphaforCHANGEFIG,:)=[];
             XlateTIMEoutdataTABLEPATCH(XlateTIMEoutdataTABLEPATCH.SampleDate<=XwhatcutooffalphaforCHANGEFIG,:)=[];
             XalphaNVearly=XearlyTIMEoutdataTABLEPATCH.estCT;
             XalphaNVAll=XplayalphaTABLEpatch.estCT;
             XalphaNVlate=XlateTIMEoutdataTABLEPATCH.estCT;
             Xwhatmedianearly(i1,ii1,i2)=median(XalphaNVearly);
             XwhatmedianALL(i1,ii1,i2)=median(XalphaNVAll);
             Xwhatmedianlate(i1,ii1,i2)=median(XalphaNVlate);
             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%           
              
         %    constantCOEFF(i1,ii1,i2)=coeffTABLE.constant(1);
%             sourceageCOEFF(i1,ii1,i2)=coeffTABLE.source_age(1);
        end
    end
end


figure;
tablewithoutzeros=outdataTABLEPATCH;
tablewithoutzeros(tablewithoutzeros.TimeDoubleVacc==0,:)=[];
scatter(tablewithoutzeros.TimeDoubleVacc,tablewithoutzeros.estCT)
lsline

% % %%%ADJUSTED DATA
% b1177VMA=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber~=1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
% b1177V0A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
% b1177V1A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc1only==1)));
% b1177V2A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc2==1)));
% deltaVMA=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber~=1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
% deltaV0A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
% deltaV1A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc1only==1)));
% deltaV2A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc2==1)));
% alphaVMA=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber~=1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
% alphaV0A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
% alphaV1A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc1only==1)));
% alphaV2A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc2==1)));
%   OmiVMA=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==4).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber~=1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
%   OmiV0A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==4).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
%   OmiV1A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==4).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc1only==1)));
%   OmiV2A=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==4).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc2==1)));


b1177VMA=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber~=1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
b1177V0A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
b1177V1A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc1only==1)));
b1177V2A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc2==1)));
deltaVMA=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber~=1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
deltaV0A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
deltaV1A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc1only==1)));
deltaV2A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc2only==1)));
deltaV3A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc3==1)));
alphaVMA=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber~=1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
alphaV0A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
alphaV1A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc1only==1)));
alphaV2A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc2==1)));
  OmiVMA=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==4).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber~=1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
  OmiV0A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==4).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.whatinfectionnumber==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
  OmiV1A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==4).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc1only==1)));
  OmiV2A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==4).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc2only==1)));
  OmiV3A=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==4).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.isVacc3==1)));

  
  
  
alldata1V0MA=[  1+0*b1177VMA;3.8+0*alphaVMA;6.6+0*deltaVMA;  10.0+0*OmiVMA];
alldata2V0MA=[      b1177VMA;      alphaVMA;      deltaVMA;        OmiVMA];
alldata1V00A=[1.6+0*b1177V0A;4.4+0*alphaV0A;7.2+0*deltaV0A;  10.6+0*OmiV0A];
alldata2V00A=[      b1177V0A;      alphaV0A;      deltaV0A;        OmiV0A];
alldata1V11A=[2.2+0*b1177V1A;5.0+0*alphaV1A;7.8+0*deltaV1A; 11.2+0*OmiV1A];
alldata2V11A=[      b1177V1A;      alphaV1A;      deltaV1A;        OmiV1A];
alldata1V22A=[2.8+0*b1177V2A;5.6+0*alphaV2A;8.4+0*deltaV2A; 11.8+0*OmiV2A];
alldata2V22A=[      b1177V2A;      alphaV2A;      deltaV2A;        OmiV2A];
alldata1V33A=[                              9.0+0*deltaV3A; 12.4+0*OmiV3A];
alldata2V33A=[                                    deltaV3A;        OmiV3A];

figure(588786)
hold on; boxchart(alldata1V0MA,alldata2V0MA,'MarkerStyle','none','boxfacecolor','g')%,'boxwidth',0.9,'JitterOutliers','on')
hold on; boxchart(alldata1V00A,alldata2V00A,'MarkerStyle','none','boxfacecolor','k')%,'boxwidth',0.9,'JitterOutliers','on')
hold on; boxchart(alldata1V11A,alldata2V11A,'MarkerStyle','none','boxfacecolor','r')%,'boxwidth',0.9,'JitterOutliers','on')
hold on; boxchart(alldata1V22A,alldata2V22A,'MarkerStyle','none','boxfacecolor','b')%,'boxwidth',0.9,'JitterOutliers','on')
hold on; boxchart(alldata1V33A,alldata2V33A,'MarkerStyle','none','boxfacecolor','m')%,'boxwidth',0.9,'JitterOutliers','on')
hold on;  scatter(alldata1V0MA,alldata2V0MA,'g.','jitter','on')
hold on;  scatter(alldata1V00A,alldata2V00A,'k.','jitter','on')
hold on;  scatter(alldata1V11A,alldata2V11A,'r.','jitter','on')
hold on;  scatter(alldata1V22A,alldata2V22A,'b.','jitter','on')
hold on;  scatter(alldata1V33A,alldata2V33A,'m.','jitter','on')
xticks([1.6,4.4,7.2,10.6])
xticklabels({'B.1.177','Alpha','Delta','Omicron'})
legend('Prior infection','No known exposure','1 dose','2 doses','3 doses')
ylabel('Adjusted ct')
% ylim([5,35])
% text(1-0.15,6.5,  num2str(round(median(b1177V0A),2)))
% text(1.6-0.15,6.5,num2str(round(median(b1177V1A),2)))
% text(3.2-0.15,6.5,num2str(round(median(alphaV0A),2)))
% text(3.8-0.15,6.5,num2str(round(median(alphaV1A),2)))
% text(4.4-0.15,6.5,num2str(round(median(alphaV2A),2)))
% text(5.4-0.15,6.5,num2str(round(median(deltaV0A),2)))
% text(6.0-0.15,6.5,num2str(round(median(deltaV1A),2)))
% text(6.6-0.15,6.5,num2str(round(median(deltaV2A),2)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AGE=outdataTABLEPATCH.age;
AGEasindex=AGE;
AGEasindex(AGE<=7)=1;
AGEasindex(find((AGE>7).*(AGE<=25)))=1.6;
AGEasindex(find((AGE>25).*(AGE<=55)))=2.2;
AGEasindex(AGE>55)=2.8;
tableforplotting=[outdataTABLEPATCH,array2table(AGEasindex)];
figure
hold on; boxchart(tableforplotting.AGEasindex,tableforplotting.estCT,'MarkerStyle','none','boxfacecolor','k','Linewidth',1.5)
hold on; scatter(tableforplotting.AGEasindex,tableforplotting.estCT,'k.','jitter','on')
ylabel('Adjusted CT')
xticks([1,1.6,2.2,2.8])
xticklabels({'0-10','11-30','31-60','>60'})
xlabel('Age')
ylim([5,35])
text(1-0.06,  33,num2str(round(median(tableforplotting.estCT(AGEasindex==1.0)),2)),'FontSize',14)
text(1.6-0.06,33,num2str(round(median(tableforplotting.estCT(AGEasindex==1.6)),2)),'FontSize',14)
text(2.2-0.06,33,num2str(round(median(tableforplotting.estCT(AGEasindex==2.2)),2)),'FontSize',14)
text(2.8-0.06,33,num2str(round(median(tableforplotting.estCT(AGEasindex==2.8)),2)),'FontSize',14)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tablefortimeplot=outdataTABLEPATCH(find((isfinite(outdataTABLEPATCH.estCT)).*(outdataTABLEPATCH.whatinfectionnumber==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)),:);
figure(300)
z1outx=tablefortimeplot.timefromfirstcoll(tablefortimeplot.whatzvecPATCH==1);
z2outx=tablefortimeplot.timefromfirstcoll(tablefortimeplot.whatzvecPATCH==2);
z3outx=tablefortimeplot.timefromfirstcoll(tablefortimeplot.whatzvecPATCH==3);
z4outx=tablefortimeplot.timefromfirstcoll(tablefortimeplot.whatzvecPATCH==4);
            z1outy=tablefortimeplot.estCT(tablefortimeplot.whatzvecPATCH==1);
            z2outy=tablefortimeplot.estCT(tablefortimeplot.whatzvecPATCH==2);
            z3outy=tablefortimeplot.estCT(tablefortimeplot.whatzvecPATCH==3);
            z4outy=tablefortimeplot.estCT(tablefortimeplot.whatzvecPATCH==4);
z1mat=[z1outx,z1outy];
z2mat=[z2outx,z2outy];
z3mat=[z3outx,z3outy];
z4mat=[z4outx,z4outy];
sortedz1=sortrows(z1mat,'descend');
sortedz2=sortrows(z2mat,'descend');
sortedz3=sortrows(z3mat,'descend');
sortedz4=sortrows(z4mat,'descend');
sortedz1((isnan(sortedz1(:,1))),:)=[];
sortedz2((isnan(sortedz2(:,1))),:)=[];
sortedz3((isnan(sortedz3(:,1))),:)=[];
sortedz4((isnan(sortedz4(:,1))),:)=[];
fitz1=smooth(sortedz1(:,1),sortedz1(:,2),0.55,'loess');
fitz2=smooth(sortedz2(:,1),sortedz2(:,2),0.55,'loess');
fitz3=smooth(sortedz3(:,1),sortedz3(:,2),0.55,'loess');
fitz4=smooth(sortedz4(:,1),sortedz4(:,2),0.55,'loess');
s1=sortedz1(:,1);
s2=sortedz2(:,1);
s3=sortedz3(:,1);
s4=sortedz4(:,1);
hold on; plot(datetime(2020,9,27)-104+s2(s2<230),fitz2(s2<230),'k-','linewidth',1.5)
hold on; plot(datetime(2020,9,27)-104+s1(find((s1>170).*(s1<290))),fitz1(find((s1>170).*(s1<290))),'r-','linewidth',1.5)
hold on; plot(datetime(2020,9,27)-104+s3(find((s3>350).*(s3<560))),fitz3(find((s3>350).*(s3<560))),'b-','linewidth',1.5)
hold on; plot(datetime(2020,9,27)-104+s4(s4>560),fitz4(s4>560),'r-','linewidth',1.5)
% hold on; plot(datetime(2020,9,27)-104+sortedall(:,1),fitall,'g-','linewidth',1.5)
hold on; scatter(datetime(2020,9,27)-104+z1outx,z1outy,'rx')
hold on; scatter(datetime(2020,9,27)-104+z2outx,z2outy,'kx')
hold on; scatter(datetime(2020,9,27)-104+z3outx,z3outy,'bx')
hold on; scatter(datetime(2020,9,27)-104+z4outx,z4outy,'rx')
legend('B.1.177','Alpha','Delta','All')
ylim([8,32])
xlabel('Sample date')
ylabel('Adjusted CT')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% yesAZ=outdataTABLEPATCH(outdataTABLEPATCH.isitAZ==1,:);
% noAZ=outdataTABLEPATCH(outdataTABLEPATCH.isitAZ==0,:);
% 
% yesPB=outdataTABLEPATCH(outdataTABLEPATCH.isitPB==1,:);
% noPB=outdataTABLEPATCH(outdataTABLEPATCH.isitPB==0,:);
% 
% yesAZbyage = groupsummary(yesAZ,{'source_age'})
% noAZbyage = groupsummary(noAZ,{'source_age'})
% 
% yesPBbyage = groupsummary(yesPB,{'source_age'})
% noPBbyage = groupsummary(noPB,{'source_age'})
% 
% 
% figure; 
% hold on; plot(yesAZbyage.source_age,yesAZbyage.GroupCount,'ro-')
% hold on; plot(noAZbyage.source_age,  noAZbyage.GroupCount,'bo-')
% hold on; plot(yesPBbyage.source_age,yesPBbyage.GroupCount,'bx:')
% hold on; plot(noPBbyage.source_age,  noPBbyage.GroupCount,'rx:')
% 
% G = groupsummary(outdataTABLEPATCH,{'isitAZ','source_age'})
% 
% % % WsplitWWvecz{1}=[0.1,0.1,0.1,0.1,0.1;...
% % %                  0.2,0.2,0.2,0.2,0.2;...
% % %                  0.3,0.3,0.3,0.3,0.3;...
% % %                  0.4,0.4,0.4,0.4,0.4;...
% % %                  0.5,0.5,0.5,0.5,0.5];     %alpha
% 
% % figure(212121)
% % hold on; plot(0.1:0.1:0.5,Xwhatmedianearly(:,3,1),'ro-','linewidth',2)
% % hold on; plot(0.1:0.1:0.5,XwhatmedianALL(:,3,1),  'go-','linewidth',2)
% % hold on; plot(0.1:0.1:0.5,Xwhatmedianlate(:,3,1), 'bo-','linewidth',2)
% % legend('Early samples','All samples','Late samples')
% % xlabel('\theta_\alpha')
% % ylabel('adjusted CT')
% % ylim([18.5,20.5])
% % set(gca, 'YDir','reverse')
% 
% 
% isdeltaCOEFF
% isdeltapvals
% 
% NEWheightALPHA=constantCOEFF+sourceageCOEFF*45;
% NEWheightDELTA=NEWheightALPHA+isdeltaCOEFF;
% 
% PEAKalphaCT=2*NEWheightALPHA-30
% PEAKdeltaCT=2*NEWheightDELTA-30
% 
% PEAKalphaLM=ccc(2)+ccc(1)*PEAKalphaCT
% PEAKdeltaLM=ccc(2)+ccc(1)*PEAKdeltaCT
% 


% figure(77)
% heatmap(5:2.5:15,0.5:-0.1:0.1,flipud(WIDTH_HMisb1177COEFF),'Title','ct_b_1_1_7_7-ct_\alpha')
% xlabel('w_b_1_1_7')
% ylabel('\theta_b_1_1_7_7')
% 
% figure(88)
% heatmap(5:2.5:15,0.5:-0.1:0.1,flipud(WIDTH_HMisb1177pvals),'Title','p-value')
% xlabel('w_b_1_1_7')
% ylabel('\theta_b_1_1_7_7')
% 
% figure(777)
% heatmap(5:2.5:15,0.5:-0.1:0.1,flipud(WIDTH_HMisdeltaCOEFF),'Title','ct_\delta-ct_\alpha')
% xlabel('w_\delta')
% ylabel('\theta_\delta')
% 
% figure(888)
% heatmap(5:2.5:15,0.5:-0.1:0.1,flipud(WIDTH_HMisdeltapvals),'Title','p-value')
% xlabel('w_\delta')
% ylabel('\theta_\delta')
% 
% 
% figure(1)
% heatmap(0.1:0.1:0.5,0.5:-0.1:0.1,flipud(isdeltaCOEFF),'Title','ct_\delta-ct_\alpha')
% xlabel('\theta_\delta')
% ylabel('\theta_\alpha')
% 
% figure(2)
% heatmap(0.1:0.1:0.5,0.5:-0.1:0.1,flipud(isdeltapvals),'Title','p-value')
% xlabel('\theta_\delta')
% ylabel('\theta_\alpha')
% 
% % figure(3)
% % heatmap(0.1:0.1:0.5,0.5:-0.1:0.1,flipud(isb1177COEFF),'Title','ct_\delta-ct_\alpha')
% % xlabel('\theta_b_1_1_7_7')
% % ylabel('\theta_\alpha')
% % 
% % figure(4)
% % heatmap(0.1:0.1:0.5,0.5:-0.1:0.1,flipud(isb1177pvals),'Title','p-value')
% % xlabel('\theta_b_1_1_7_7')
% % ylabel('\theta_\alpha')
% 
% 
% % subtractcoeff=isdeltaCOEFF;
% 
% 
% % % % clear all
% % % % clc
% % % % writetable(outdataTABLEPATCH,'thenotexptable.csv')
% % % % 
% % % % figure(35453);
% % % % hold on; plot(Hspaceend,subtractcoeff(:),'ko-')
% % % % xlabel('Hspaceend')
% % % % ylabel('ct_\alpha-ct_\delta')
% % % % 
% % % % figure(35466);
% % % % hold on; plot(bigwvecX,subtractcoeff(:),'ko-')
% % % % xlabel('infected period)')
% % % % ylabel('ct_\alpha-ct_\delta')
% 
% %%ORIGINAL DATA
% 
% b1177V0=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.ct_mean).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
% b1177V1=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.ct_mean).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1only==1)));
% b1177V2=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==2).*isfinite(outdataTABLEPATCH.ct_mean).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc2==1)));
% deltaV0=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.ct_mean).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
% deltaV1=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.ct_mean).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1only==1)));
% deltaV2=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.ct_mean).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc2==1)));
% alphaV0=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.ct_mean).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1only==0).*(outdataTABLEPATCH.isVacc2==0)));
% alphaV1=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.ct_mean).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1only==1)));
% alphaV2=outdataTABLEPATCH.ct_mean(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.ct_mean).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc2==1)));
% 
%  
% alldata1V00=[  1+0*b1177V0;3.2+ 0*alphaV0;5.4+0*deltaV0];
% alldata2V00=[      b1177V0;       alphaV0;      deltaV0];
% alldata1V11=[1.6+0*b1177V1;3.8+ 0*alphaV1;6.0+0*deltaV1];
% alldata2V11=[      b1177V1;       alphaV1;      deltaV1];
% alldata1V22=[2.2+0*b1177V2;4.4+ 0*alphaV2;6.6+0*deltaV2];
% alldata2V22=[      b1177V2;       alphaV2;      deltaV2];
% 
% figure(56556)
% hold on; boxchart(alldata1V00,alldata2V00,'MarkerStyle','none','boxfacecolor','k')%,'boxwidth',0.9,'JitterOutliers','on')
% hold on; boxchart(alldata1V11,alldata2V11,'MarkerStyle','none','boxfacecolor','r')%,'boxwidth',0.9,'JitterOutliers','on')
% hold on; boxchart(alldata1V22,alldata2V22,'MarkerStyle','none','boxfacecolor','b')%,'boxwidth',0.9,'JitterOutliers','on')
% hold on;  scatter(alldata1V00,alldata2V00,'k.','jitter','on')
% hold on;  scatter(alldata1V11,alldata2V11,'r.','jitter','on')
% hold on;  scatter(alldata1V22,alldata2V22,'b.','jitter','on')
% xticks([1.6,3.8,6.2])
% xticklabels({'B.1.177','Alpha','Delta'})
% legend('not vaccinated','1 dose','2 doses')
% ylabel('observed ct')
% text(1-0.15,6.5,  num2str(round(median(b1177V0),2)))
% text(1.6-0.15,6.5,num2str(round(median(b1177V1),2)))
% text(3.2-0.15,6.5,num2str(round(median(alphaV0),2)))
% text(3.8-0.15,6.5,num2str(round(median(alphaV1),2)))
% text(4.4-0.15,6.5,num2str(round(median(alphaV2),2)))
% text(5.4-0.15,6.5,num2str(round(median(deltaV0),2)))
% text(6.0-0.15,6.5,num2str(round(median(deltaV1),2)))
% text(6.6-0.15,6.5,num2str(round(median(deltaV2),2)))
% ylim([5,35])
% 
% %%%%%%%%%%%%%%%%%%%
% 

% 
% 
% %%%%%
% 
% %%%ADJUSTED DATA test impact of az on delta
% 
% deltaNO=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1==0)));
% deltaAZ=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1==1).*(outdataTABLEPATCH.isitAZ==1)));
% deltaPB=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==3).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1==1).*(outdataTABLEPATCH.isitPB==1)));
% alphaNO=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1==0)));
% alphaAZ=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1==1).*(outdataTABLEPATCH.isitAZ==1)));
% alphaPB=outdataTABLEPATCH.estCT(find((outdataTABLEPATCH.whatzvecPATCH==1).*isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.infirstinfection==1).*(outdataTABLEPATCH.isVacc1==1).*(outdataTABLEPATCH.isitPB==1)));
% 
% alldata1NO=[  1+0*alphaNO;3.2+0*deltaNO];
% alldata2NO=[      alphaNO;      deltaNO];
% alldata1AZ=[1.6+0*alphaAZ;3.8+0*deltaAZ];
% alldata2AZ=[      alphaAZ;      deltaAZ];
% alldata1PB=[2.2+0*alphaPB;4.4+0*deltaPB];
% alldata2PB=[      alphaPB;      deltaPB];
% 
% figure(3847293)
% hold on; boxchart(alldata1NO,alldata2NO,'MarkerStyle','none','boxfacecolor','k')%,'boxwidth',0.9,'JitterOutliers','on')
% hold on; boxchart(alldata1AZ,alldata2AZ,'MarkerStyle','none','boxfacecolor','r')%,'boxwidth',0.9,'JitterOutliers','on')
% hold on; boxchart(alldata1PB,alldata2PB,'MarkerStyle','none','boxfacecolor','b')%,'boxwidth',0.9,'JitterOutliers','on')
% hold on; scatter(alldata1NO,alldata2NO,'k.','jitter','on')
% hold on; scatter(alldata1AZ,alldata2AZ,'r.','jitter','on')
% hold on; scatter(alldata1PB,alldata2PB,'b.','jitter','on')
% 
% xticks([1.6,3.8])
% xticklabels({'Alpha','Delta'})
% legend('Not vaccinated','AZ','PB')
% ylabel('Adjusted CT')
% ylim([5,35])
% text(1-0.05,  6.5,num2str(round(median(alphaNO),2)))
% text(1.6-0.05,6.5,num2str(round(median(alphaAZ),2)))
% text(2.2-0.05,6.5,num2str(round(median(alphaPB),2)))
% text(3.2-0.05,6.5,num2str(round(median(deltaNO),2)))
% text(3.8-0.05,6.5,num2str(round(median(deltaAZ),2)))
% text(4.4-0.05,6.5,num2str(round(median(deltaPB),2)))
% 
% %%%%compare alpha observed ct at different stages
% 
playalphaTABLEpatch=outdataTABLEPATCH;
playalphaTABLEpatch=playalphaTABLEpatch(find((playalphaTABLEpatch.whatzvecPATCH==1).*isfinite(playalphaTABLEpatch.ct_mean).*isfinite(playalphaTABLEpatch.estCT).*(playalphaTABLEpatch.whatinfectionnumber==1).*(playalphaTABLEpatch.vaccbeforpositive14==0)),:);


whatcutooffalpha=204; %205; %211
 earlyTIMEoutdataTABLEPATCH=playalphaTABLEpatch;
  lateTIMEoutdataTABLEPATCH=playalphaTABLEpatch;
 earlyTIMEoutdataTABLEPATCH(earlyTIMEoutdataTABLEPATCH.SampleDate>whatcutooffalpha,:)=[];
  lateTIMEoutdataTABLEPATCH(lateTIMEoutdataTABLEPATCH.SampleDate<=whatcutooffalpha,:)=[];
 
alphaNVearly=earlyTIMEoutdataTABLEPATCH.ct_mean;
  alphaNVAll=playalphaTABLEpatch.ct_mean;
 alphaNVlate=lateTIMEoutdataTABLEPATCH.ct_mean;
alldata1VXX=[1+0*alphaNVearly;2+0*alphaNVAll;3+0*alphaNVlate];
alldata2VXX=[    alphaNVearly;    alphaNVAll;    alphaNVlate];

figure(111111)
subplot(2,1,1)
hold on;  scatter(alldata1VXX,alldata2VXX,'.','jitter','on','MarkerEdgeColor', 0.55*[1,1,1])
whatmediansA=[median(alphaNVearly),median(alphaNVAll),median(alphaNVlate)];
whatpc25=[prctile(alphaNVearly,25),prctile(alphaNVAll,25),prctile(alphaNVlate,25)];
whatpc75=[prctile(alphaNVearly,75),prctile(alphaNVAll,75),prctile(alphaNVlate,75)];
hold on; plot([0.75,1.25],whatmediansA(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatmediansA(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatmediansA(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,1.25],whatpc25(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatpc25(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatpc25(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,1.25],whatpc75(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatpc75(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatpc75(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,0.75],[whatpc25(1),whatpc75(1)],'k-','linewidth',2)
hold on; plot([1.25,1.25],[whatpc25(1),whatpc75(1)],'k-','linewidth',2)
hold on; plot([1.75,1.75],[whatpc25(2),whatpc75(2)],'k-','linewidth',2)
hold on; plot([2.25,2.25],[whatpc25(2),whatpc75(2)],'k-','linewidth',2)
hold on; plot([2.75,2.75],[whatpc25(3),whatpc75(3)],'k-','linewidth',2)
hold on; plot([3.25,3.25],[whatpc25(3),whatpc75(3)],'k-','linewidth',2)
text(0.9,32.5,num2str(whatmediansA(1)))
text(1.9,32.5,num2str(whatmediansA(2)))
text(2.9,32.5,num2str(whatmediansA(3)))
% hold on; boxchart(alldata1VXX,alldata2VXX,'MarkerStyle','none','boxfacecolor','none','linewidth',2)
xticks(1:3)
xticklabels({'','',''})
ylabel('observed ct')
ylim([5,35])
% 
% %%%%compare alpha adjusted ct at different stages
% 
 alphaNVearlyA=earlyTIMEoutdataTABLEPATCH.estCT;   
  alphaNVAllA=playalphaTABLEpatch.estCT;
 alphaNVlateA=lateTIMEoutdataTABLEPATCH.estCT;
alldata1VXXA=[1+0*alphaNVearlyA;2+0*alphaNVAllA;3+0*alphaNVlateA];
alldata2VXXA=[    alphaNVearlyA;    alphaNVAllA;    alphaNVlateA];


figure(211111)
subplot(2,1,2)
hold on;  scatter(alldata1VXXA,alldata2VXXA,'.','jitter','on','MarkerEdgeColor', 0.55*[1,1,1])
whatmediansA=[median(alphaNVearlyA),median(alphaNVAllA),median(alphaNVlateA)];
whatpc25=[prctile(alphaNVearlyA,25),prctile(alphaNVAllA,25),prctile(alphaNVlateA,25)];
whatpc75=[prctile(alphaNVearlyA,75),prctile(alphaNVAllA,75),prctile(alphaNVlateA,75)];
hold on; plot([0.75,1.25],whatmediansA(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatmediansA(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatmediansA(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,1.25],whatpc25(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatpc25(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatpc25(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,1.25],whatpc75(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatpc75(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatpc75(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,0.75],[whatpc25(1),whatpc75(1)],'k-','linewidth',2)
hold on; plot([1.25,1.25],[whatpc25(1),whatpc75(1)],'k-','linewidth',2)
hold on; plot([1.75,1.75],[whatpc25(2),whatpc75(2)],'k-','linewidth',2)
hold on; plot([2.25,2.25],[whatpc25(2),whatpc75(2)],'k-','linewidth',2)
hold on; plot([2.75,2.75],[whatpc25(3),whatpc75(3)],'k-','linewidth',2)
hold on; plot([3.25,3.25],[whatpc25(3),whatpc75(3)],'k-','linewidth',2)
text(0.9,32.5,num2str(whatmediansA(1)))
text(1.9,32.5,num2str(whatmediansA(2)))
text(2.9,32.5,num2str(whatmediansA(3)))
% hold on; boxchart(alldata1VXXA,alldata2VXXA,'MarkerStyle','none','boxfacecolor','none','linewidth',2)
xticks(1:3)
xticklabels({'early','all','late'})
ylabel('Adjusted ct')
ylim([5,35])
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 alphaNVearlyAGE=earlyTIMEoutdataTABLEPATCH.ave_age_of_infec;   
  alphaNVAllAGE=playalphaTABLEpatch.ave_age_of_infec;
 alphaNVlateAGE=lateTIMEoutdataTABLEPATCH.ave_age_of_infec;
alldata1VXXAGE=[1+0*alphaNVearlyAGE;2+0*alphaNVAllAGE;3+0*alphaNVlateAGE];
alldata2VXXAGE=[    alphaNVearlyAGE;    alphaNVAllAGE;    alphaNVlateAGE];


figure(111111)
subplot(2,1,2)
% hold on; boxchart(alldata1VXXAGE,alldata2VXXAGE,'MarkerStyle','none','boxfacecolor','none')
hold on;  scatter(alldata1VXXAGE,alldata2VXXAGE,'.','jitter','on','MarkerEdgeColor', 0.55*[1,1,1])
whatmediansA=[median(alphaNVearlyAGE),median(alphaNVAllAGE),median(alphaNVlateAGE)];
whatpc25=[prctile(alphaNVearlyAGE,25),prctile(alphaNVAllAGE,25),prctile(alphaNVlateAGE,25)];
whatpc75=[prctile(alphaNVearlyAGE,75),prctile(alphaNVAllAGE,75),prctile(alphaNVlateAGE,75)];
hold on; plot([0.75,1.25],whatmediansA(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatmediansA(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatmediansA(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,1.25],whatpc25(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatpc25(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatpc25(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,1.25],whatpc75(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatpc75(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatpc75(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,0.75],[whatpc25(1),whatpc75(1)],'k-','linewidth',2)
hold on; plot([1.25,1.25],[whatpc25(1),whatpc75(1)],'k-','linewidth',2)
hold on; plot([1.75,1.75],[whatpc25(2),whatpc75(2)],'k-','linewidth',2)
hold on; plot([2.25,2.25],[whatpc25(2),whatpc75(2)],'k-','linewidth',2)
hold on; plot([2.75,2.75],[whatpc25(3),whatpc75(3)],'k-','linewidth',2)
hold on; plot([3.25,3.25],[whatpc25(3),whatpc75(3)],'k-','linewidth',2)
text(0.9,7,num2str(whatmediansA(1)))
text(1.9,7,num2str(whatmediansA(2)))
text(2.9,7,num2str(whatmediansA(3)))
xticks(1:3)
xticklabels({'','',''})
% xticklabels({'early','all','late'})
ylabel('mean age of infection')
ylim([1,7.5])
% 
% 
% %%%%%what is the adjustment
% 
alldata1diff=[1+0*alphaNVearlyA;                 2+0*alphaNVAllA;         3+0*alphaNVlateA];

alldata2diff=[alphaNVearly-alphaNVearlyA;alphaNVAll-alphaNVAllA; alphaNVlate-alphaNVlateA];

figure(211111)
subplot(2,1,1)
% hold on; boxchart(alldata1diff,alldata2diff,'MarkerStyle','none','boxfacecolor','none','linewidth',2)
hold on;  scatter(alldata1diff,-alldata2diff,'.','jitter','on','MarkerEdgeColor', 0.55*[1,1,1])
whatmediansA=[median(-alphaNVearly+alphaNVearlyA),median(-alphaNVAll+alphaNVAllA),median(-alphaNVlate+alphaNVlateA)];
whatpc25=[prctile(-alphaNVearly+alphaNVearlyA,25),prctile(-alphaNVAll+alphaNVAllA,25),prctile(-alphaNVlate+alphaNVlateA,25)];
whatpc75=[prctile(-alphaNVearly+alphaNVearlyA,75),prctile(-alphaNVAll+alphaNVAllA,75),prctile(-alphaNVlate+alphaNVlateA,75)];
hold on; plot([0.75,1.25],whatmediansA(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatmediansA(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatmediansA(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,1.25],whatpc25(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatpc25(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatpc25(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,1.25],whatpc75(1)*[1,1],'k-','linewidth',2)
hold on; plot([1.75,2.25],whatpc75(2)*[1,1],'k-','linewidth',2)
hold on; plot([2.75,3.25],whatpc75(3)*[1,1],'k-','linewidth',2)
hold on; plot([0.75,0.75],[whatpc25(1),whatpc75(1)],'k-','linewidth',2)
hold on; plot([1.25,1.25],[whatpc25(1),whatpc75(1)],'k-','linewidth',2)
hold on; plot([1.75,1.75],[whatpc25(2),whatpc75(2)],'k-','linewidth',2)
hold on; plot([2.25,2.25],[whatpc25(2),whatpc75(2)],'k-','linewidth',2)
hold on; plot([2.75,2.75],[whatpc25(3),whatpc75(3)],'k-','linewidth',2)
hold on; plot([3.25,3.25],[whatpc25(3),whatpc75(3)],'k-','linewidth',2)
text(0.9,2,num2str(round(whatmediansA(1),3)))
text(1.9,2,num2str(round(whatmediansA(2),3)))
text(2.9,2,num2str(round(whatmediansA(3),3)))
xticks(1:3)
xticklabels({'','',''})
% xticklabels({'early','all','late'})
ylabel('adjustment size')
ylim([-3,2.5])

% 
% figure;
% alloutx=outdataTABLEPATCH.timefromfirstcoll(find(isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.infirstinfection==1)));
% allouty=outdataTABLEPATCH.estCT(find(isfinite(outdataTABLEPATCH.estCT).*(outdataTABLEPATCH.infirstinfection==1)));
% allmat=[alloutx,allouty];
% sortedall=sortrows(allmat,'descend');
% sortedall((isnan(sortedall(:,1))),:)=[];
% fitall=smooth(sortedall(:,1),sortedall(:,2),0.55,'loess');
% hold on; plot(sortedall(:,1),fitall,'k-','linewidth',1.5)
% hold on; scatter(alloutx,allouty,'kx')
% % xlim([0,50])
% % ylabel('mean(ct)')
% % xlabel('midpoint of time since last negative')
% % legend('Not VOC','Alpha','Delta')
% 






% 

% 
% 
% AGEandtypeasindex=AGE;
%  AGEandtypeasindex(find((AGE<45).*(outdataTABLEPATCH.isitAZ==1).*(outdataTABLEPATCH.isDELTA==1)))=1;
%   AGEandtypeasindex(find((AGE<45).*(outdataTABLEPATCH.isitAZ==0).*(outdataTABLEPATCH.isDELTA==1)))=1.6;
% AGEandtypeasindex(find((AGE>=45).*(outdataTABLEPATCH.isitAZ==1).*(outdataTABLEPATCH.isDELTA==1)))=2.2;
% AGEandtypeasindex(find((AGE>=45).*(outdataTABLEPATCH.isitAZ==0).*(outdataTABLEPATCH.isDELTA==1)))=2.8;
% 
% 
% tableforplotting=[outdataTABLEPATCH,array2table(AGEandtypeasindex)];
% tableforplotting(tableforplotting.AGEandtypeasindex>2.8,:)=[];
% 
% figure
% hold on; boxchart(tableforplotting.AGEandtypeasindex,tableforplotting.estCT,'MarkerStyle','none','boxfacecolor','k','Linewidth',1.5)
% hold on; scatter(tableforplotting.AGEandtypeasindex,tableforplotting.estCT,'k.','jitter','on')
% ylabel('Adjusted CT')
% xticks([1,1.6,2.2,2.8])
% xticklabels({'<45 & AZ','<45 & PB','>=45 & AZ','>=45 & PB'})
% xlabel('Age')
% ylim([5,35])
% 
% AGEandtypeasindex=AGE;
%  AGEandtypeasindex(find((AGE<45).*(outdataTABLEPATCH.isDELTA==1)))=1;
%   AGEandtypeasindex(find((AGE>=45).*(outdataTABLEPATCH.isDELTA==1)))=1.6;
% tableforplotting=[outdataTABLEPATCH,array2table(AGEandtypeasindex)];
% tableforplotting(tableforplotting.AGEandtypeasindex>1.6,:)=[];
% figure
% hold on; boxchart(tableforplotting.AGEandtypeasindex,tableforplotting.estCT,'MarkerStyle','none','boxfacecolor','k','Linewidth',1.5)
% hold on; scatter(tableforplotting.AGEandtypeasindex,tableforplotting.estCT,'k.','jitter','on')
% 
% 
