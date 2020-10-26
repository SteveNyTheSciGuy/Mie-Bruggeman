clear all; clc;
nu=4000:-2:700;
colors={'b';'g';'m';'c';'k';'y'}; % For unique plotting

% Plotting for mixture
figure(1),clf,title('Mixture 50:50 [by mol]'), hold on
axis([700 4000,-.01 .15])
xlabel('\nu (cm^{-1})','fontsize',16),ylabel('Absorbance','fontsize',16)
set(gca,'FontSize',14),set(gca,'xdir','reverse')
for i=1:7
    str1=sprintf('Mix5050_%i.asc',i);
    mix=dlmread(str1,'\t','A26..B1676');
    nuMix=mix(:,1);
    Mix(:,i)=mix(:,2);
    if i<=6
        Color=colors(i);
    elseif i<=12
        Color=colors(i-6);
    end
    plot(nuMix,Mix(:,i),Color{1})
    str2=sprintf('');
end
[ln,wd]=size(Mix);
for i=1:ln
    MixAvg(i)=sum(Mix(i,:));
end
MixAvg=MixAvg'./wd;
plot(nu,MixAvg,'r--','LineWidth',2)
hold off

% Plotting for Lithium Sulfate calibrant
figure(2),clf,title('Li_{2} SO_{4}'), hold on
axis([700 4000,-.01 .2])
xlabel('\nu (cm^{-1})','fontsize',16),ylabel('Absorbance','fontsize',16)
set(gca,'FontSize',14),set(gca,'xdir','reverse')
for i=1:9
    str1=sprintf('LS_%i.asc',i);
    ls=dlmread(str1,'\t','A26..B1676');
    nuLS=ls(:,1);
    LS(:,i)=ls(:,2);
    if i<=6
        Color=colors(i);
    elseif i<=12
        Color=colors(i-6);
    end
    plot(nuLS,LS(:,i),Color{1})
end
[ln,wd]=size(LS);
for i=1:ln
    LSAvg(i)=sum(LS(i,:));
end
LSAvg=LSAvg'./wd;
plot(nu,LSAvg,'r--','LineWidth',2)
hold off

% Plotting for Lithium Caronate calibrant
figure(3),clf,title('Li_{2} CO_{3}'), hold on
axis([700 4000,-.01 .15])
xlabel('\nu (cm^{-1})','fontsize',16),ylabel('Absorbance','fontsize',16)
set(gca,'FontSize',14),set(gca,'xdir','reverse')
for i=1:11
    str1=sprintf('LC_%i.asc',i);
    lc=dlmread(str1,'\t','A26..B1676');
    nuLC=ls(:,1);
    LC(:,i)=lc(:,2);
    if i<=6
        Color=colors(i);
    elseif i<=12
        Color=colors(i-6);
    end
    plot(nuLC,LC(:,i),Color{1})
end
[ln,wd]=size(LC);
for i=1:ln
    LCAvg(i)=sum(LC(i,:));
end
LCAvg=LCAvg'./wd;
plot(nu,LCAvg,'r--','LineWidth',2)
hold off

% Plotting for COMPARISON
figure(4),clf,title('Mie-Bruggamem'), hold on
axis([700 4000,-.01 .15])
xlabel('\nu (cm^{-1})','fontsize',16),ylabel('Absorbance','fontsize',16)
set(gca,'FontSize',14),set(gca,'xdir','reverse')
plot(nu,MixAvg,'Color',[1 0 1],'LineWidth',1)
plot(nu,LSAvg,'r-','LineWidth',1)
plot(nu,LCAvg,'b-','LineWidth',1)
legend('50|50','LS','LC','Location','best')
hold off

% Save Averages
LCAVG=cat(2,nu',LCAvg);
save LCAvg.txt LCAVG -ASCII;
LSAVG=cat(2,nu',LSAvg);
save LSAvg.txt LSAVG -ASCII;
MixAVG=cat(2,nu',MixAvg);
save MixAvg.txt MixAVG -ASCII;








