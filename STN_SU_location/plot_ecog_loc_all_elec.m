PATH_MNI_BRAIN = '/Users/yanming/Downloads/leaddbs/templates/space/MNI152NLin2009bAsym/cortex/CortexHiRes.mat';
 
ld = load(PATH_MNI_BRAIN, 'Vertices', 'Faces');
 
cortex = reducepatch(ld.Faces, ld.Vertices, 0.3);
faces = cortex.faces;
vertices = cortex.vertices;

load('/Volumes/Nexus/Users/yzhu/spike_analysis/processed_data/all_ecog_electrode_loc.mat')
  
%electrode = cell2table(cell(1,5),'VariableNames', {'x','y','z','radius','color'});
MNI.x = MNI_x;
MNI.y = MNI_y;
MNI.z = MNI_z;
MNI.r = Size;
MNI.c = Color;

electrode.x = MNI.x;
electrode.y = MNI.y;
electrode.z = MNI.z;
 electrode.radius = double(MNI.r);
electrode.Properties.VariableNames = 'color';
%electrode.color = ("");
electrode.color = repmat(hex2rgb('#B7B6C1'),width(MNI_x),1);
electrode.name = num2cell(int2str(Size));
%electrode.y = MNI_y;
%electrode.z = MNI_z;
%electrode.radius = Size;
%electrode.radius = 1;
%electrode.color = Color;%
%electrode.color = 'red';
% repmat(hex2rgb('#B7B6C1'),height(electrode),1);
 
 
figure; set(gcf,'Visible','off') % 2 views
tiledlayout(1,2)
cfg = [];
cfg.h_ax = gca;
cfg.view = [-20,15];
%title({[SUBJECT], ' native-space ECoG reconstruction'})
title('MNI-space ECoG reconstruction')
hold on

%cfg.surface_facecolor = hex2rgb(faceColors{target_i});
%cfg.surface_facealpha = faceAlphas(target_i);

bml_plot3d_surface(cfg, vertices,faces);

 
hold on
 
cfg.h_ax = gca;
cfg.annotate = false;
bml_plot3d_points(cfg, electrode);
 
%clim([-3 3])
%colormap(redwhitegreen)
colorbar