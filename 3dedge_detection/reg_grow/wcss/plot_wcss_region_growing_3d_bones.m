clear all
folder = 'C:\Users\Aleksandra\Desktop\W11\image_proc_proof\STLRead\stl_with_shadows_reader\3dedge_detection\reg_grow\wcss\out';
list_of_files = dir('C:\Users\Aleksandra\Desktop\W11\image_proc_proof\STLRead\stl_with_shadows_reader\3dedge_detection\reg_grow\wcss\out\*.mat');

m = size(list_of_files,1);

ss_bones = 100;
for i=1:m
   file_name = list_of_files(i).name;
   cd(folder);
  % file = load(list_of_files(i,:));
   file = load(file_name);
    cd ..
   name = fieldnames(file);
   name = name{1};
   file = file.(name);
   file = find_all_non_zero_bones(file);
   Copy_of_plot_region_growing_bones_3d(file,ss_bones);
end
