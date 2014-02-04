
% przygotuj katalog z plikami pacjentów

clear all
%katalog roboczy:
% folder = 'C:\Users\Aleksandra\Desktop\W11\image_proc_proof\01_082013\foot'
% cd(folder)

list_of_files = ls('*.mat');
m = size(list_of_files,1);

for i=1:m
   file = load(list_of_files(i,:));
   [pathstr,file_name,ext] = fileparts(list_of_files(i,:));
   current_structure_name = sprintf('struct_of_bones_coordinates_3d %s.mat',file_name);
   struct_of_bones = find_all_bones_coorinates_for_3d(file);
   save(current_structure_name,'struct_of_bones');
                   
end

   

