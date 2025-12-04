PATH_MNI_BRAIN = '/Users/yanming/Downloads/leaddbs/templates/space/MNI152NLin2009bAsym/cortex/CortexHiRes.mat';
 
ld = load(PATH_MNI_BRAIN, 'Vertices', 'Faces');
 
cortex = reducepatch(ld.Faces, ld.Vertices, 0.3);
cortex.vert = cortex.vertices;
cortex.tri = cortex.faces;
c_h = ctmr_gauss_plot(cortex);

load('/Volumes/Nexus/Users/yzhu/spike_analysis/processed_data/all_ecog_electrode_loc.mat')
elecmatrix_loc = zeros(width(Size), 3);
elecmatrix_loc(1:width(Size), 1) = MNI_x;
elecmatrix_loc(1:width(Size), 2) = MNI_y;
elecmatrix_loc(1:width(Size), 3) = MNI_z;
e_h = el_add(elecmatrix_loc); 
