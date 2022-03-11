clear all
clc

helenpatchcog=readtable('C:\Users\helenf\Dropbox\ons-matlabsirmodel\publishedRT\FORregression\HELENPATCHTOGETHERCOG.xlsx');

days=helenpatchcog.week*7;

helenpatchcog=[helenpatchcog,array2table(days)];

       bigB1177 = interp1(helenpatchcog.days,helenpatchcog.B_1_177,  1:max(helenpatchcog.days));
       bigAlpha = interp1(helenpatchcog.days,helenpatchcog.B_1_1_7,  1:max(helenpatchcog.days));
 bigDeltaB16172 = interp1(helenpatchcog.days,helenpatchcog.B_1_617_2,1:max(helenpatchcog.days));
   bigDeltaAY42 = interp1(helenpatchcog.days,helenpatchcog.AY_4_2,   1:max(helenpatchcog.days));
  bigOmicronBA1 = interp1(helenpatchcog.days,helenpatchcog.BA_1,     1:max(helenpatchcog.days));
 bigOmicronBA11 = interp1(helenpatchcog.days,helenpatchcog.BA_1_1,   1:max(helenpatchcog.days));
  bigOmicronBA2 = interp1(helenpatchcog.days,helenpatchcog.BA_2,     1:max(helenpatchcog.days));
  
  bigDelta=bigDeltaB16172+bigDeltaAY42;
  bigOmicron=bigOmicronBA1+bigOmicronBA11+bigOmicronBA2;
  
  bigcogpatch=array2table([(1:max(helenpatchcog.days))',bigB1177',bigAlpha',bigDelta',bigOmicron'],'VariableNames',{'days','bigB1177','bigAlpha','bigDelta','bigOmicron'});
 
  startdate = datetime('02-may-2020','Format','dd-MMM-yyyy');
  
  date=startdate+(0:(height(bigcogpatch)-1))';
  
bigcog=[bigcogpatch,array2table(date)];

figure;
hold on; plot(bigcog.date,bigcog.bigB1177*100,'k-')
hold on; plot(bigcog.date,bigcog.bigAlpha*100,'r-')
hold on; plot(bigcog.date,bigcog.bigDelta*100,'g-')
hold on; plot(bigcog.date,bigcog.bigOmicron*100,'b-')
legend({'B_1_177','Alpha','Delta','Omicron'})

save('thebigcog','bigcog')

% figure;
% hold on; plot(bigcogpatch.date,bigcogpatch.bigB1177*100,      'k:')
% hold on; plot(bigcogpatch.date,bigcogpatch.bigAlpha*100,      'r:')
% hold on; plot(bigcogpatch.date,bigcogpatch.bigDeltaB16172*100,'b:')
% hold on; plot(bigcogpatch.date,bigcogpatch.bigDeltaAY42*100,  'c:')
% hold on; plot(bigcogpatch.date,bigcogpatch.bigOmicronBA1*100, 'y:')
% hold on; plot(bigcogpatch.date,bigcogpatch.bigOmicronBA11*100,'b-')
% hold on; plot(bigcogpatch.date,bigcogpatch.bigOmicronBA2*100, 'r-')
% legend({'B_1_177','Alpha','DeltaB16172','DeltaAY42','OmicronBA1','OmicronBA11','OmicronBA2'})



% 
% ggg=readtable('C:\Users\helenf\Dropbox\ons-matlabsirmodel\publishedRT\FORregression\COGProportion_in_England140222.csv');
% 
% figure(1)
% % hold on; plot(ggg.Var1,ggg.A)
% % hold on; plot(ggg.Var1,ggg.AY_4_2)
% % hold on; plot(ggg.Var1,ggg.B)
% hold on; plot(ggg.Var1,ggg.B_1_1_7)
% hold on; plot(ggg.Var1,ggg.B_1_177)
% hold on; plot(ggg.Var1,ggg.B_1_617_2)
% % hold on; plot(ggg.Var1,ggg.BA_1)
% % hold on; plot(ggg.Var1,ggg.BA_1_1)
% % hold on; plot(ggg.Var1,ggg.BA_2)
% 
% legend('A','AY_4_2','B','B_1_1_7','B_1_177','B_1_617_2','BA_1','BA_1_1','BA_2')
% 
% 
% 
% loadcog=readtable('C:\Users\helenf\Dropbox\ons-matlabsirmodel\publishedRT\FORregression\cog_metadata_lineage_proportions_211202.xlsx');
% 
% fff=loadcog(1,:);
% fff.week(1)=[0];
% loadcog=[fff;loadcog];
% 
% 
% startdate = datetime('26-apr-2020','Format','dd-MMM-yyyy');
% newtime=startdate+loadcog.week*7-1;
% 
% loadcog=[array2table(newtime),loadcog];
% head(loadcog)
% 
% 
% 
% loadcog(loadcog.week>25,:)=[];
% loadcog=loadcog
% ggg=ggg
% 
% figure(1)
% hold on; plot(ggg.Var1,ggg.A,'g-')
% hold on; plot(ggg.Var1,ggg.AY_4_2,'r-')
% hold on; plot(ggg.Var1,ggg.B,'k-')
% 
% hold on; plot(loadcog.newtime,loadcog.B_1_1_7*100,'g:')
% hold on; plot(loadcog.newtime,loadcog.B_1_177*100,'r:')
% hold on; plot(loadcog.newtime,loadcog.B_1_617_2*100,'k:')
% 
% 
% 
% 
% days=loadcog.week*7-3;
% days(1)=1;
% loadcog=[loadcog,array2table(days)];
% 
% bigB_1_177 = interp1(loadcog.days,loadcog.B_1_177,  1:max(loadcog.days));
%   bigAlpha = interp1(loadcog.days,loadcog.B_1_1_7,  1:max(loadcog.days));
%   bigDelta = interp1(loadcog.days,(loadcog.B_1_617_2+loadcog.AY_4_2),1:max(loadcog.days));
%   
%   
%   bigcog=array2table([(1:max(loadcog.days))',bigB_1_177',bigAlpha',bigDelta'],'VariableNames',{'days','bigB_1_177','bigAlpha','bigDelta'});
%   
%   startdate = datetime('26-apr-2020','Format','dd-MMM-yyyy');
%   
%   date=startdate+(0:(height(bigcog)-1))';
%   
% bigcog=[bigcog,array2table(date)];
% 
% % figure;
% hold on; plot(bigcog.date,bigcog.bigB_1_177*100,'k:')
% hold on; plot(bigcog.date,bigcog.bigAlpha*100,'r:')
% hold on; plot(bigcog.date,bigcog.bigDelta*100,'b:')
% % legend({'B_1_177','Alpha','Delta'})
% 
% % 
% % save('thebigcog','bigcog')
% % 
% %   