

%list_of_files = ls('*.mat');
list_of_files = dir('*.mat');
m = size(list_of_files,1);


currentFolder = pwd;
place_for_saving_results = sprintf('%s%s',currentFolder,'/out');

for i=1:m
   file_name = list_of_files(i).name;
   %file = load(list_of_files(i,:));
   file = load(file_name);
   name = fieldnames(file);
   name = name{1};
   file = file.(name);
   % [pathstr, file_name, ext] = fileparts(list_of_files(i,:));
   current_structure_name = sprintf('struct_of_bones_coordinates_3d_%s',file_name);
   struct_of_bones = find_all_bones_coorinates_for_3d(file);
   fullfilename = fullfile(place_for_saving_results,current_structure_name);
   save(fullfilename, 'struct_of_bones');
                   
end

exit

