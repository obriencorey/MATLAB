
radii = [7,8,9,10,13,14];
strain = [.00891,.00865,.00647,.00602,.00549,.00526];
radiiR = 1./radii;

% plot(radii,strain,'k');
% yticks([0.005 .0055 .006 .0065 .007 .0075 .008 .0085 .009 .0095])
% yticklabels({'0.005', '.0055' ,'.006' ,'.0065', '.007' ,'.0075' ,'.008' ,'.0085' ,'.009' ,'.0095'});
% xlabel("Curvature (inches)");
% ylabel("Strain");
% grid on
% set(gca,'FontName','Times');
% set(gca,'FontSize',14);

plot(radiiR,strain,'k');
yticks([0.005 .0055 .006 .0065 .007 .0075 .008 .0085 .009 .0095])
yticklabels({'0.005', '.0055' ,'.006' ,'.0065', '.007' ,'.0075' ,'.008' ,'.0085' ,'.009' ,'.0095'});
xlabel("Reciprocal of Curvature (inches)");
ylabel("Strain");
grid on
set(gca,'FontName','Times');
set(gca,'FontSize',14);

mdl = fitlm(radiiR,strain);
mdl.Rsquared.Ordinary