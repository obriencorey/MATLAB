
radii = [7,8,9,10,13,14];
strain = [.00891,.00865,.00647,.00602,.00549,.00526];
radiiR = 1./radii;

strainWheat = [.00801,.00701,.00623,.00561,.00432,.00401];

% plot(radii,strain,'k');
% yticks([0.005 .0055 .006 .0065 .007 .0075 .008 .0085 .009 .0095])
% yticklabels({'0.005', '.0055' ,'.006' ,'.0065', '.007' ,'.0075' ,'.008' ,'.0085' ,'.009' ,'.0095'});
% xlabel("Curvature (inches)");
% ylabel("Strain");
% grid on
% set(gca,'FontName','Times');
% set(gca,'FontSize',14);

% plot(radiiR,strain,'k');
% yticks([0.005 .0055 .006 .0065 .007 .0075 .008 .0085 .009 .0095])
% yticklabels({'0.005', '.0055' ,'.006' ,'.0065', '.007' ,'.0075' ,'.008' ,'.0085' ,'.009' ,'.0095'});
% xlabel("Reciprocal of Curvature (inches)");
% ylabel("Strain");
% grid on
% set(gca,'FontName','Times');
% set(gca,'FontSize',14);

plot(radiiR,strainWheat,'k');
yticks([.003 .0035 .004 .0045 0.005 .0055 .006 .0065 .007 .0075 .008 .0085 .009 .0095])
yticklabels({'.003','.0035','.004','.0045','.005', '.0055' ,'.006' ,'.0065', '.007' ,'.0075' ,'.008' ,'.0085' ,'.009' ,'.0095'});
xlabel("Reciprocal of Curvature (inches)");
ylabel("Strain");
grid on
set(gca,'FontName','Times');
set(gca,'FontSize',14);

mdl = fitlm(radiiR,strainWheat);
mdl.Rsquared.Ordinary