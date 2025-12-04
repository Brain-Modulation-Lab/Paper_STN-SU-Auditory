PATH_MNI_BRAIN = '/Users/yanming/Downloads/leaddbs/templates/space/MNI152NLin2009bAsym/cortex/CortexHiRes.mat';
 
ld = load(PATH_MNI_BRAIN, 'Vertices', 'Faces');
 
cortex = reducepatch(ld.Faces, ld.Vertices, 0.3);
cortex.vert = cortex.vertices;
cortex.tri = cortex.faces;
c_h = ctmr_gauss_plot(cortex);

load('/Volumes/Nexus/Users/yzhu/spike_analysis/processed_data/cue_ecog_loc_onset.mat')
load('/Volumes/Nexus/Users/yzhu/spike_analysis/processed_data/cue_ecog_loc_sus.mat')
load('/Volumes/Nexus/Users/yzhu/spike_analysis/processed_data/cue_ecog_loc_three.mat')
e_h = el_add(elecmatrix_onset, 'color', 'r'); 
e_h = el_add(elecmatrix_sus, 'color', 'g'); 
e_h = el_add(elecmatrix_three, 'color', 'b'); 
