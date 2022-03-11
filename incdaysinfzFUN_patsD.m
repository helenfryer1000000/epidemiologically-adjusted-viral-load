function [whatDminVec,whatDmaxVec,whattvec,whatzvec,whatotherdata,Istartz,verylargest]=incdaysinfzFUN_patsD(Aspace)

global ccc avec Aspace  cutofffortesting

verylargest=40;   %%this gives max age
avec=Aspace:Aspace:verylargest;

load('themetadata')

%restrict to veseq
% sw1=categories(categorical(metadatatable.protocol));
% sw2=countcats(categorical(metadatatable.protocol));
%  dddd=[sw1,sw2]

metadatatable(categorical(metadatatable.protocol)=='ARCTIC',:)    =[];
metadatatable(categorical(metadatatable.protocol)=='ARTIC',:)     =[];
metadatatable(categorical(metadatatable.protocol)=='ARTIC_PHEC',:)=[];
metadatatable(categorical(metadatatable.protocol)=='Artic-V3' ,:) =[];    
metadatatable(categorical(metadatatable.protocol)=='LoCost',:)    =[];

metadatatable.log10mapped(categorical(metadatatable.log10mapped)=='NoData')={''};
metadatatable.log10mapped=str2double(metadatatable.log10mapped);

% fulldataXXX = readtable('C:\Users\helenf\Dropbox\ONS_sequencing_restricted_access_shared\ONS_Household_Data\Archived\ONS_2021_12_06\ONS_positives_all_results_household_20211206.csv');   
% fulldataXXX = readtable('C:\Users\helenf\Dropbox\ONS_sequencing_restricted_access_shared\ONS_Household_Data\ONS_2021_12_29\ONS_positives_all_results_household_20211229.csv');
% fulldataXXX = readtable('C:\Users\helenf\Dropbox\ONS_sequencing_restricted_access_shared\ONS_Household_Data\ONS_2022_01_04\ONS_positives_all_results_household_20220103');
fulldataXXX = readtable('C:\Users\helenf\Dropbox\ONS_sequencing_restricted_access_shared\ONS_Household_Data\ONS_2022_02_07\ONS_positives_all_results_household_20220207.csv');

fulldataXXX=fulldataXXX(:,{'collection_date','pseudo_person_id','result_mk','result_tdi'});

head(fulldataXXX)

%%%%%%%%%%%HERE  HERE   HERE !!!

newzvec=-1+zeros(height(fulldataXXX),1);
whatinfectionnumber=zeros(height(fulldataXXX),1);
timefromlastnegative=whatinfectionnumber; timefromlastnegative(:)=NaN;
cumsumresulttdi01=whatinfectionnumber;    cumsumresulttdi01(:)=NaN;
timefromfirstpos=whatinfectionnumber;     timefromfirstpos(:)=NaN;
result_mk01=whatinfectionnumber;          result_mk01(:)=NaN;
firstPCRpositive=whatinfectionnumber;     firstPCRpositive(:)=NaN;

fulldataXXX=[array2table(newzvec),array2table(whatinfectionnumber),array2table(timefromlastnegative),array2table(cumsumresulttdi01),array2table(timefromfirstpos),array2table(result_mk01),array2table(firstPCRpositive),fulldataXXX];

incidencetable=readtable('incidencedata.xlsx');
%%%  find incidence here:   https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/conditionsanddiseases/datasets/coronaviruscovid19infectionsurveydata

figure(1000)
hold on; plot(incidencetable.month,incidencetable.incidence,'x-')

metadatatable(isnan(metadatatable.ct_mean),:)=[];
metadatatable(~isfinite(metadatatable.ct_mean),:)=[];
metadatatable(datenum(metadatatable.collection_date)<datenum(min(incidencetable.month)),:)=[]; 
metadatatable(datenum(metadatatable.collection_date)>datenum(max(incidencetable.month)),:)=[]; 
metadatatable(~isfinite(metadatatable.collection_date),:)=[];
metadatatable(~isfinite(metadatatable.timebetweensamples),:)=[];
metadatatable=[metadatatable, array2table(datenum(metadatatable.collection_date)-datenum(min(incidencetable.month)),'VariableNames',{'timefromfirst'})];
metadatatable(isnan(metadatatable.timefromfirst),:)=[];
% metadatatable(metadatatable.protocol~='veSeq',:)=[];

metadatatable.VaccDate1=datetime(metadatatable.covid_vaccine_date_1(:),'InputFormat','ddMMMyyyy');
metadatatable.VaccDate2=datetime(metadatatable.covid_vaccine_date_2(:),'InputFormat','ddMMMyyyy');

vaccbeforpositive=metadatatable.VaccDate1<=metadatatable.collection_date;
vaccbeforpositive7=metadatatable.VaccDate1+7<=metadatatable.collection_date;
vaccbeforpositive14=metadatatable.VaccDate1+14<=metadatatable.collection_date;
VaccLESS14=(metadatatable.VaccDate1+14>metadatatable.collection_date).*(metadatatable.VaccDate1<=metadatatable.collection_date);
Vacc7to14=(metadatatable.VaccDate1+14>metadatatable.collection_date).*(metadatatable.VaccDate1+7<=metadatatable.collection_date);

serobeforepositive=metadatatable.first_seroPos_date<=metadatatable.collection_date;

metadatatable=[metadatatable,array2table([vaccbeforpositive,VaccLESS14,Vacc7to14,vaccbeforpositive7,vaccbeforpositive14,serobeforepositive],'VariableNames',{'VaccLESS14','Vacc7to14','vaccinebeforepositive','vaccbeforpositive7','vaccbeforpositive14','serobeforepositive'})];

isVacc1=metadatatable.VaccDate1+14<=metadatatable.collection_date;
isVacc2=metadatatable.VaccDate2+14<=metadatatable.collection_date; 
isVacc1only=isVacc1.*(~isVacc2);

Timesincevacc2=isVacc2.*(datenum(metadatatable.collection_date)-datenum(metadatatable.VaccDate2+14));
Timesincevacc2(isnan(Timesincevacc2))=0;

isVacc2=isVacc2*1;
metadatatable=[metadatatable,array2table(isVacc1only),array2table(isVacc2),array2table(Timesincevacc2)];


isitAZ=categorical(metadatatable.covid_vaccine_type_1)=='Oxford/AstraZeneca';
isitPB=categorical(metadatatable.covid_vaccine_type_1)=='Pfizer/BioNTech';

% isitAZ=categorical(metadatatable.vaccTYPE1)=='Oxford/AstraZeneca';
% isitPB=categorical(metadatatable.vaccTYPE1)=='Pfizer/BioNTech';

isitAZ=isitAZ*1;
isitPB=isitPB*1;

metadatatable=[metadatatable,array2table(isitAZ),array2table(isitPB)];

eitherbeforepositive=categorical(metadatatable.vaccinebeforepositive);
eitherbeforepositive(categorical(metadatatable.serobeforepositive)=='true')='true';
metadatatable=[metadatatable, array2table(eitherbeforepositive,'VariableNames',{'eitherbeforepositive'})];

%%%%%%
ForVLb117=metadatatable.B_1_1_7;
ForVLb117(:)='_';
ForVLb117(contains(metadatatable.lineage,'B.1.177'))='False'; %B.1.177=orig
ForVLb117(categorical(metadatatable.B_1_177)=='True')='False';

ForVLb117(contains(metadatatable.lineage,'B.1.1.7'))='True'; %Alpha
ForVLb117(categorical(metadatatable.B_1_1_7)=='True')='True';

ForVLb117(contains(metadatatable.lineage,'B.1.617.2'))='Delta'; %Delta
ForVLb117(contains(metadatatable.lineage,'AY.4'))='Delta'; %Delta
ForVLb117(categorical(metadatatable.AY_4_2)=='True')='Delta'; %Delta
ForVLb117(categorical(metadatatable.B_1_617_2)=='True')='Delta'; %Delta

ForVLb117(contains(metadatatable.lineage,'BA.1'))='Omicron'; %Delta
ForVLb117(contains(metadatatable.lineage,'BA.2'))='Omicron'; %Delta

metadatatable=[metadatatable,array2table(ForVLb117)];
metadatatable(metadatatable.ForVLb117=='_',:)=[];  %this removes all but alpha delta and orig

isALPHA=(metadatatable.ForVLb117=='True')*1;
isDELTA=(metadatatable.ForVLb117=='Delta')*1;
metadatatable=[metadatatable,array2table(isALPHA),array2table(isDELTA)];


isALPHAvacc1only=metadatatable.isVacc1only.*(metadatatable.ForVLb117=='True');
isALPHAvacc2=metadatatable.isVacc2.*(metadatatable.ForVLb117=='True');
isDELTAvacc1only=metadatatable.isVacc1only.*(metadatatable.ForVLb117=='Delta');
isDELTAvacc2=metadatatable.isVacc2.*(metadatatable.ForVLb117=='Delta');
metadatatable=[metadatatable,array2table(isALPHAvacc1only),array2table(isALPHAvacc2),array2table(isDELTAvacc1only),array2table(isDELTAvacc2)];

isVacc1=metadatatable.VaccDate1+14<=metadatatable.collection_date;
isALPHAvacc=isVacc1.*(metadatatable.ForVLb117=='True');
isDELTAvacc=isVacc1.*(metadatatable.ForVLb117=='Delta');
metadatatable=[metadatatable,array2table(isALPHAvacc),array2table(isDELTAvacc)];




% head(metadatatable)
metadatatable(isnan(metadatatable.ct_mean),:)=[];

whatname=metadatatable.ForVLb117;
metadatatable=[metadatatable,array2table(whatname)];
 

%%%use to convert between ct and log10mapped
metaforlinefit=metadatatable;
metaforlinefit(isnan(metadatatable.ct_mean),:)=[];

class(metadatatable.log10mapped)

metaforlinefit(isnan(metadatatable.log10mapped),:)=[];

ccc = polyfit(metaforlinefit.ct_mean,metaforlinefit.log10mapped,1)

figure
hold on; scatter(metaforlinefit.ct_mean,metaforlinefit.log10mapped)


CTtolog10mapped=polyval(ccc,metadatatable.ct_mean); %ORIGINAL
%CTtolog10mapped=polyval(ccc,metadatatable.ct_mean-7.3); %RESTRICTED TO LESS THAN 31
CTtolog10mapped<0==0;

CTtomapped=ceil(10.^CTtolog10mapped);

metadatatable=[metadatatable,array2table(CTtolog10mapped),array2table(CTtomapped)];

 y_est = polyval(ccc,22.3)
 y_est = polyval(ccc,23.4)
 y_est2 = polyval(ccc,22.3+4.2)
 y_est3 = polyval(ccc,22.3-4.2)

y_est4 = polyval(ccc,9.3)

y_est5 = polyval(ccc,39.6)

hold on; plot([5,40],polyval(ccc,[5,40]),'b-')
ylim([0,8])


DATES=incidencetable.month;

load('thebigcog')


bigcog(bigcog.date<min(DATES),:)=[];
bigcog(bigcog.date>max(DATES),:)=[];

min(bigcog.date)
max(bigcog.date)

newTIMES=datenum(bigcog.date)-datenum(incidencetable.month(1));
prevsfulltimes=newTIMES(1):Aspace:newTIMES(end);

head(bigcog)

 PCPOSAlphathin=myinterpolate(newTIMES,bigcog.bigAlpha,Aspace);
 PCPOSB1177thin=myinterpolate(newTIMES,bigcog.bigB1177,Aspace);
 PCPOSDeltathin=myinterpolate(newTIMES,bigcog.bigDelta,Aspace);
 PCPOSOmicronthin=myinterpolate(newTIMES,bigcog.bigOmicron,Aspace);

BIGprevTAB=array2table([prevsfulltimes',PCPOSAlphathin',PCPOSB1177thin',PCPOSDeltathin',PCPOSOmicronthin'],'VariableNames',{'fulltimes','prevAlpha','prevB1177','prevDelta','prevOmicron'});

BIGprevTAB(BIGprevTAB.fulltimes<0,:)=[];

maxprevtimes=max(BIGprevTAB.fulltimes);

INCtimes=datenum(incidencetable.month)-datenum(incidencetable.month(1));
incidencetable=[incidencetable,array2table([INCtimes],'VariableNames',{'INCtimes'})];

ThinINCtimes=incidencetable.INCtimes(1):Aspace:incidencetable.INCtimes(end);

metadatatable(metadatatable.timefromfirst>cutofffortesting,:)=[];


figure(88)
hold on; plot(incidencetable.INCtimes,incidencetable.incidence,'x-')

Ithin=myinterpolate(incidencetable.INCtimes,incidencetable.incidence,Aspace)*Aspace;

incidencetablethin=array2table([ThinINCtimes',Ithin'],'VariableNames',{'ThinINCtimes','Ithin'});
incidencetablethin(ThinINCtimes>maxprevtimes,:)=[];

INCandPREVpatch=[incidencetablethin,BIGprevTAB];

INCandPREVpatch(:,{'fulltimes'})=[];
head(INCandPREVpatch)

Istartz=cell(3,1);
for z=[2,1,3,4,5]
    if z==1 %%b117=alpha
        INCandPREVpatch.prevAlpha(INCandPREVpatch.prevAlpha==0)=0.00001;
        Istartz{z}=(INCandPREVpatch.Ithin).*(INCandPREVpatch.prevAlpha);
    elseif z==2 %NOT VOC
        INCandPREVpatch.prevB1177(INCandPREVpatch.prevB1177==0)=0.00001;
        Istartz{z}=(INCandPREVpatch.Ithin).*(INCandPREVpatch.prevB1177);
    elseif z==3 % DELTA
        INCandPREVpatch.prevDelta(INCandPREVpatch.prevDelta==0)=0.00001;
        Istartz{z}=(INCandPREVpatch.Ithin).*(INCandPREVpatch.prevDelta);
    elseif z==4 % DELTA
        INCandPREVpatch.prevOmicron(INCandPREVpatch.prevOmicron==0)=0.00001;
        Istartz{z}=(INCandPREVpatch.Ithin).*(INCandPREVpatch.prevOmicron);
    elseif z==5 % FLAT
        Istartz{z}=mean(INCandPREVpatch.Ithin)+0*INCandPREVpatch.ThinINCtimes;
    end
    colcol={'r-','k-','b-','c-','y-'};
    figure(999)
    if z<5
        hold on; plot(INCandPREVpatch.ThinINCtimes+DATES(1),4*Istartz{z},colcol{z},'linewidth',1.5)
        %     hold on; plot(INCandPREVpatch.ThinINCtimes,INCandPREVpatch.Ithin,'k-','linewidth',1.5)
        %     hold on; plot(INCandPREVpatch.ThinINCtimes,mean(INCandPREVpatch.Ithin)+0*INCandPREVpatch.ThinINCtimes,'g-','linewidth',1.5)
    end
end

legend({'B.1.177','Alpha','Delta','Omicron'})
figure(999)
ylabel('Incidence per 10000 people per day')


timefromfirstcoll=datenum(metadatatable.collection_date)-datenum(incidencetable.month(1));

metadatatable=[metadatatable,array2table(timefromfirstcoll,'VariableNames',{'timefromfirstcoll'})];
maxtime=max(INCandPREVpatch.ThinINCtimes);
metadatatable(metadatatable.timefromfirstcoll>maxtime,:)=[];
metadatatable(metadatatable.timefromfirstcoll<0,:)=[];

isMALE=(categorical(metadatatable.source_sex)=='M')*1;
metadatatable=[array2table(isMALE),metadatatable];

[N2,X2]=hist(categorical(fulldataXXX.pseudo_person_id));
tableofpersonidcounts22=[array2table(N2','VariableNames',{'counts2'}),cell2table(X2','VariableNames',{'person_id22'})];

infirstinfection=(metadatatable.isMALE)*0;
HFminAOI=(metadatatable.isMALE)*0; HFminAOI(:)=NaN;
HFmaxAOI=(metadatatable.isMALE)*0; HFmaxAOI(:)=NaN;
whatinfectionnumber=(metadatatable.isMALE)*0; whatinfectionnumber(:)=NaN;

metadatatable=[array2table(infirstinfection),array2table(HFminAOI),array2table(HFmaxAOI),array2table(whatinfectionnumber),metadatatable];

metadatatable.person_id=categorical(metadatatable.person_id);
fulldataXXX.pseudo_person_id=categorical(fulldataXXX.pseudo_person_id);

whatzvec=zeros(height(metadatatable),1);
for i=1:height(metadatatable)
    if categorical(metadatatable.ForVLb117(i))=='True'
        whatzvec(i)= 1;
    elseif categorical(metadatatable.ForVLb117(i))=='False'
        whatzvec(i)=2;
    elseif categorical(metadatatable.ForVLb117(i))=='Delta'
        whatzvec(i)=3;
    elseif categorical(metadatatable.ForVLb117(i))=='Omicron'
        whatzvec(i)=4;
    else
        whatzvec(i)=0;
    end
end
metadatatable=[array2table(whatzvec),metadatatable];


xxee1=0*(1:height(tableofpersonidcounts22));

%%RESTRICT TO IN FIRST INFECTION
% tellme='in first section'
for k=1:height(tableofpersonidcounts22)
        k/height(tableofpersonidcounts22)
%for k=2169:2200
% for k=500:700
% for k=65127
% for k=65127:65150
%     for k=1:100
% for k=[106,110]
    ssss2=tableofpersonidcounts22(k,:);
    if ssss2.counts2>0
        persontable2=fulldataXXX(fulldataXXX.pseudo_person_id==tableofpersonidcounts22.person_id22(k),:);
        persontable2=sortrows(persontable2,{'collection_date'});
        persontable2(datenum(persontable2.collection_date)>datenum(max(incidencetable.month)),:)=[];
        if height(persontable2)>1
            for r=[height(persontable2):-1:2]
                if persontable2.collection_date(r)==persontable2.collection_date(r-1)
                    persontable2(r,:)=[];
                end
            end
        end
        persontable2.result_mk01=(categorical(persontable2.result_mk)=='Positive')*1;
        result_tdi01=(categorical(persontable2.result_tdi)=='Positive')*1;
         cumsumresultmk01=cumsum(persontable2.result_mk01);
        persontable2.cumsumresulttdi01=cumsum(result_tdi01);
        
        persontable2.firstPCRpositive=(persontable2.result_mk01==1).*(cumsumresultmk01==1);  

        findfirstpositive=find(persontable2.firstPCRpositive);

        if findfirstpositive>1
            lastnegbeforefirstpos=persontable2.collection_date(findfirstpositive-1);
        else
            lastnegbeforefirstpos=NaT;
        end
        persontable2.timefromlastnegative=datenum(persontable2.collection_date)-datenum(lastnegbeforefirstpos);
        persontable2.whatinfectionnumber(persontable2.result_mk01==1)=1;
        
       
        if isempty(findfirstpositive)          
            persontable2(:,:)=[];
        elseif findfirstpositive>1
            if persontable2.cumsumresulttdi01(findfirstpositive-1)>0
                persontable2.whatinfectionnumber(persontable2.whatinfectionnumber==1)=-1;
            end
            persontable2(1:(findfirstpositive-1),:)=[]; %this removes up to the first positive

            for rr2=1:height(persontable2) %this add the zvector
                
                findmatchingdata=find((metadatatable.person_id==persontable2.pseudo_person_id(rr2)).*(metadatatable.collection_date==persontable2.collection_date(rr2)));
                if ~isempty(findmatchingdata)
                persontable2.newzvec(rr2)=metadatatable.whatzvec(findmatchingdata(1));
                end
            end
        end
        %find where lineages change over
        if sum(persontable2.newzvec~=-1)==0
            persontable2=[];
        else
            whereothers=find((persontable2.newzvec~=-1).*(persontable2.newzvec~=persontable2.newzvec(1)));
            if ~isempty(whereothers)
                persontable2.whatinfectionnumber(whereothers)=2;
                persontable2.timefromlastnegative(whereothers(1):end)=persontable2.timefromlastnegative(whereothers(1):end)-persontable2.timefromlastnegative(whereothers(1)-1);
                whereothers2=find((persontable2.newzvec~=-1).*(persontable2.newzvec~=persontable2.newzvec(1)).*(persontable2.newzvec~=persontable2.newzvec(min(whereothers))));
                if ~isempty(whereothers2)
                    persontable2.whatinfectionnumber(whereothers2)=3;
                end    
            end
        end  
        if ~isempty(persontable2)            
            % add time from first positive
            persontable2.timefromfirstpos=datenum(persontable2.collection_date)-datenum(persontable2.collection_date(1));
            if ~isempty(whereothers)
                persontable2.timefromfirstpos(whereothers:end)=datenum(persontable2.collection_date(whereothers:end))-datenum(persontable2.collection_date(whereothers(1)));
                if ~isempty(whereothers2)
                    persontable2.timefromfirstpos(whereothers2:end)=datenum(persontable2.collection_date(whereothers2:end))-datenum(persontable2.collection_date(whereothers(1)));
                end
            end
            
            %remove pcr negative
            persontable2(persontable2.result_mk01==0,:)=[];
            persontable2(persontable2.newzvec==-1,:)=[];  % remove anything without a lineage
            persontable2(persontable2.newzvec==0,:)=[];  %  remove anything with other lineage
        end
        %add things back into the metadata
        if ~isempty(persontable2)           
            for r2=1:height(persontable2)
                findmatch=find((metadatatable.person_id==persontable2.pseudo_person_id(r2)).*(metadatatable.collection_date==persontable2.collection_date(r2)));              
                
                metadatatable.HFminAOI(findmatch)=persontable2.timefromfirstpos(r2);
                metadatatable.HFmaxAOI(findmatch)=persontable2.timefromlastnegative(r2);
                metadatatable.whatinfectionnumber(findmatch)=persontable2.whatinfectionnumber(r2);
            end
        end
    end
end


% figure
% histogram(xxee1)

%%%% This restricts the metadatatable to just those in first infection
whattvec=metadatatable.timefromfirstcoll ; % need to
whatDmaxVec=metadatatable.HFmaxAOI;
whatDminVec=metadatatable.HFminAOI;

max(metadatatable.HFmaxAOI)
max(metadatatable.HFminAOI)

whatotherdata=metadatatable;


   

