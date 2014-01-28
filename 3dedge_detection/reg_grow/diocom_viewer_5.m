%The function dicom_viewer is a dicom viewer (1 column of windows) that
%include bone segmentation (2 column of windows)
%and bone contours methods (3 column of winndows)
% it is used DICOM_VIEWER of
%Author: Eric Johnston
%email: ejohnst@stanford.edu
%Release: 1.2
%Date: July 31, 2010


function diocom_viewer
close all
f = figure('Visible','off','Position',[0,0,1700,1000],'MenuBar','none');
movegui(f,'center');
backgroundcolor = [0.35 0.35 0.35]; %Background of figure
set(f,'Name','My_dicom_viewer','Color',backgroundcolor);
colormap('Gray'); %Dealing only with grayscaled images (*.DCM)


uicontrol('Style','PushButton','Position',[1010 10 100 50],'String','Find Directory','CallBack',@lookfordicom);

%uicontrol('Style','PushButton','Position',[1120 70 100 20],'String','Build 3D Axial Model','CallBack',@build_3d_axial_model);
%uicontrol('Style','PushButton','Position',[1120 40 100 20],'String','Build 3D Sagittal Model','CallBack',@build_3d_sagittal_model);
%uicontrol('Style','PushButton','Position',[1120 10 100 20],'String','Build 3D Coronal Model','CallBack',@build_3d_coronal_model);



maintextA = uicontrol('Style','Text','Position', [1 600 20 50] ,'String', 'A', 'FontSize',13,'HorizontalAlignment','left','BackgroundColor',backgroundcolor);
maintextS = uicontrol('Style','Text','Position', [1 200 20 200] ,'String', 'S', 'FontSize',13,'HorizontalAlignment','left','BackgroundColor',backgroundcolor);
maintextC = uicontrol('Style','Text','Position', [1 10 20 180] ,'String', 'C', 'FontSize',13,'HorizontalAlignment','left','BackgroundColor',backgroundcolor);

axtext = uicontrol('Style','Text','Position',[700+520 60 140 25],'String','Axial:','FontSize',13,'HorizontalAlignment','left','BackgroundColor',backgroundcolor);
sagtext = uicontrol('Style','Text','Position',[700+520 35 140 25],'String','Sagittal:','FontSize',13,'HorizontalAlignment','left','BackgroundColor',backgroundcolor);
cortext = uicontrol('Style','Text','Position',[700+520 10 140 25],'String','Coronal:','FontSize',13,'HorizontalAlignment','left','BackgroundColor',backgroundcolor);

axial = axes('Position',[0.02 0.2 0.16 1.2],'DataAspectRatio',[1 1 1],'XTick',[],'YTick',[],'Box','on');
axial_bones = axes('Position',[0.2 0.2 0.16 1.2],'DataAspectRatio',[1 1 1],'XTick',[],'YTick',[],'Box','on');
axial_contour = axes('Position',[0.38 0.2 0.16 1.2],'DataAspectRatio',[1 1 1],'XTick',[],'YTick',[],'Box','on');

sagittal = axes('Position',        [0.02 0.17 0.16 0.6],'DataAspectRatio',[1 1 1],'XTick',[],'YTick',[],'Box','on');
sagittal_bones = axes('Position',  [0.2 0.17 0.16 0.6],'DataAspectRatio',[1 1 1],'XTick',[],'YTick',[],'Box','on');
sagittal_contour = axes('Position',[0.38 0.17 0.16 0.6],'DataAspectRatio',[1 1 1],'XTick',[],'YTick',[],'Box','on');

coronal = axes('Position',[0.02 0.001 0.16 0.3],'DataAspectRatio',[1 1 1],'XTick',[],'YTick',[],'Box','on');
coronal_bones = axes('Position',[0.2 0.001 0.16 0.3],'DataAspectRatio',[1 1 1],'XTick',[],'YTick',[],'Box','on');
coronal_contour = axes('Position',[0.38 0.001 0.16 0.3],'DataAspectRatio',[1 1 1],'XTick',[],'YTick',[],'Box','on');



typestring = ''; %Records when numbered keys are pressed
threedarray = NaN; %The three dimensional array given by the DICOM files
curx=1; cury=1; curz=1; %The cross sections of the current images
[P Q R] = size(threedarray); %Size of the three dimensional array
axvert = NaN; axhorz = NaN; sagvert = NaN; saghorz = NaN; corvert = NaN; corhorz = NaN; %For zooming functionality
x2 = NaN; y2 = NaN; %Current Mouse position when depressed
xthickness = NaN; ythickness = NaN; zthickness = NaN; %For measurement tool

set(f,'Visible','On');

function disp_images(x,y,z)
display_axial(z)
display_axial_bone(z)
display_axial_contour(z)


display_sagittal(y)
display_sagittal_bone(y)
display_sagittal_contour(y)


display_coronal(x)
display_coronal_bone(x)
display_coronal_contour(x)



end

    function display_axial(z)
        set(f,'CurrentAxes',axial);
        im = double(squeeze(threedarray(axvert,axhorz,z)));
        im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
        imshow(im); axis square;
                
    end %end dispay_axial
    function display_axial_bone(z)
         set(f,'CurrentAxes',axial_bones);
         im = squeeze(threedarray(axvert,axhorz,z));
         im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
         bone_axial = find_bone(im);
         imshow(bone_axial); axis square;
                  
    end %end display_axial_bone
    function display_axial_contour(z)
        set(f,'CurrentAxes',axial_contour);
        im = double(squeeze(threedarray(axvert,axhorz,z)));
        
       
        %im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
        c = imcontour(im);            % pokazuj? co wczyta?am, ale po konturowaniu ju?
        out = get_contour(c);             % wyodrebniam kontury -> komentarze w ?rodku funkcji
        [m n]=size(out); 
        
        for i=1:3   %plotowanie konturów(1:n- wszystkie) , a jak nie wszytkie to  wybierz dwie liczby od 1 do n.
        hold on
        plot(out(i).x, out(i).y); axis square; %rysuj wszystkie kontury
        hold off
        end
         
        %imcontour(im,7); axis square;
        %imshow(im); axis square;
        %imrotate(plot(out(i).x, out(i).y ),90); axis off;
       
        
    end %end dispay_axial_contour
 
    function display_sagittal(y)
        set(f,'CurrentAxes',sagittal);
        im = double(squeeze(threedarray(sagvert,y,saghorz)));
        im = imresize(im, [512 512]);
        im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
        imshow(im); %axis square;
    end  
    function display_sagittal_bone(y)
        set(f,'CurrentAxes',sagittal_bones);
        im = double(squeeze(threedarray(sagvert,y,saghorz)));
        im = imresize(im, [512 512]);
        im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
        bone_sagittal = find_bone(im);
        imshow(bone_sagittal); %axis square;
        
    end  
    function display_sagittal_contour(y)
        
        set(f,'CurrentAxes',sagittal_contour);
        im = squeeze(threedarray(sagvert,y,saghorz));
        %im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
        c = imcontour(im);            % pokazuj? co wczyta?am, ale po konturowaniu ju?
        out = get_contour(c);             % wyodrebniam kontury -> komentarze w ?rodku funkcji
        [m n]=size(out); 
        
        for i=1:3   %plotowanie konturów(1:n- wszystkie) , a jak nie wszytkie to  wybierz dwie liczby od 1 do n.
        hold on
        plot(out(i).x, out(i).y); axis square; %rysuj wszystkie kontury
        hold off
        end
 
    end %end dispay_axial_contour
 
    function display_coronal(x)
        set(f,'CurrentAxes',coronal);
        im = double(squeeze(threedarray(x, corvert, corhorz)));
        im = imresize(im, [512 512]);
        im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
        imshow(im); axis square;
    end  
    function display_coronal_bone(x)
        set(f,'CurrentAxes',coronal_bones);
        im = squeeze(threedarray(x, corvert, corhorz));
        im = imresize(im, [512 512]);
        im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
        bone_coronal = find_bone(im);
        imshow(bone_coronal); axis square;
    end  
    function display_coronal_contour(x)
        
        set(f,'CurrentAxes',coronal_contour);
        im = squeeze(threedarray(x, corvert, corhorz));
        %im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
        c = imcontour(im);            % pokazuj? co wczyta?am, ale po konturowaniu ju?
        out = get_contour(c);             % wyodrebniam kontury -> komentarze w ?rodku funkcji
        [m n]=size(out); 
        
        for i=1:3   %plotowanie konturów(1:n- wszystkie) , a jak nie wszytkie to  wybierz dwie liczby od 1 do n.
        hold on
        plot(out(i).x, out(i).y); axis square; %rysuj wszystkie kontury
        hold off
        end
         
        %imcontour(im,7); axis square;
        %imshow(im); axis square;
        %imrotate(plot(out(i).x, out(i).y ),90); axis off;
    end %end dispay_axial_contour





    function lookfordicom(src, eventdata)
         try
        folder = uigetdir;
        %folder = 'C:\Users\Aleksandra\Desktop\W11\image_proc_proof\01_082013\foot';
        w = cd; cd(folder);
        
    catch %#ok<CTCH>
       return 
    end
    set(f, 'Pointer', 'watch'); pause(0.01);
    threedarray = NaN;
    try
        [threedarray xthickness ythickness zthickness] = gatherImages(folder);
    catch %#ok<CTCH>
        disp('You selected a folder that does not contain .dcm images');
        threedarray = NaN; xthickness = NaN; ythickness = NaN; zthickness = NaN;
        set(f, 'Pointer', 'arrow','KeyPressFcn','','WindowScrollWheelFcn','');
        %set([zoomer measurer maximize contrast slide],'Enable','off');
        cd(w);
        return
    end
    cd(w);
    
    [P Q R] = size(threedarray);
    axvert = 1:P; sagvert = 1:P; corvert = 1:Q;
    axhorz = 1:Q; saghorz = 1:R; corhorz = 1:R;
    curx = ceil(P/2); 
    cury = ceil(Q/2); 
    curz = ceil(R/2);
    set(axtext,'String',['Axial: ' num2str(curz) '/' num2str(R)]);
    set(sagtext,'String',['Sagittal:' num2str(cury) '/' num2str(Q) ]);
    set(cortext,'String',['Coronal: ' num2str(curx) '/' num2str(P)]);
    disp_images(curx,cury, curz) %dispIm(curx,cury,curz);
    set(f, 'Pointer', 'arrow');
    %set([zoomer measurer maximize contrast slide export],'Enable','on');
    %Press Buttons
    set(f,'KeyPressFcn',@(h_obj,evt) keymove(evt.Key));
    set(f,'WindowScrollWheelFcn',@(h_obj,evt) keymove(evt.VerticalScrollCount));
    
    
    end %end lookfordicom

function keymove(key)
    if strcmp(key,'uparrow') || sum(key)==-1 %If the uparrow is pressed or the mouse wheel is turned
        if (gca == axial && curz<R) %And we're not out of bounds
            curz = curz+1; display_axial(curz); display_axial_bone(curz); display_axial_contour(curz); set(f,'CurrentAxes',axial); set(axtext,'String',['Axial: ' num2str(curz) '/' num2str(R)]);
        elseif (gca == sagittal && cury<P)
            cury = cury+1; display_sagittal(cury);display_sagittal_bone(cury); display_sagittal_contour(cury); set(f,'CurrentAxes',sagittal); set(sagtext,'String',['Sagittal: ' num2str(cury) '/' num2str(Q)]);
        elseif (gca == coronal && curx<Q)
            curx = curx+1; display_coronal(curx); display_coronal_bone(curx); display_coronal_contour(curx); set(f,'CurrentAxes',coronal); set(cortext,'String',['Coronal: ' num2str(curx) '/' num2str(P)]);
        end
    elseif strcmp(key,'downarrow') || sum(key)==1 %If the down arrow or mouse wheel is turned
        if (gca == axial && curz>1) %And we're not out of bounds
            curz = curz-1; display_axial(curz); display_axial_bone(curz); display_axial_contour(curz); set(f,'CurrentAxes',axial); set(axtext,'String',['Axial: ' num2str(curz) '/' num2str(R)]);
        elseif (gca == sagittal && cury>1)
            cury = cury-1; display_sagittal(cury); display_sagittal_bone(cury);display_sagittal_contour(cury); set(f,'CurrentAxes',sagittal); set(sagtext,'String',['Sagittal: ' num2str(cury) '/' num2str(Q)]);
         elseif (gca == coronal && curx>1)
             curx = curx-1; display_coronal(curx);display_coronal_bone(curx); display_coronal_contour(curx); set(f,'CurrentAxes',coronal); set(cortext,'String',['Coronal: ' num2str(curx) '/' num2str(P)]);
        end
    elseif sum(strcmp(key,{'1','2','3','4','5','6','7','8','9','0'})) && length(typestring)<4 %If a numbered key is pressed and not too 
        typestring = strcat(typestring,key); %Add the number to the string typed              %many have already been pressed
        if (gca == axial), set(axtext,'String',['Number of slice in axial plane: ' typestring '/' num2str(R)]);
          elseif (gca == sagittal), set(sagtext,'String',['Sagittal: ' typestring '/' num2str(Q)]);
         elseif (gca == coronal), set(cortext,'String',['Coronal: ' typestring '/' num2str(P)]);
        end
    elseif strcmp(key,'return') && ~isempty(typestring) %If a return is pressed then update the current cross section
        if (gca == axial)
            curz = round(str2double(typestring));
            if curz>R, curz=R;
            elseif curz<1, curz=1;   
            end
            set(axtext,'String',['Axial: ' num2str(curz) '/' num2str(R)]);
            display_axial(curz);
        elseif (gca == sagittal)
            cury = round(str2double(typestring));
            if cury>P, cury=P;
            elseif cury<1, cury=1;   
            end
            set(sagtext,'String',['Sagittal: ' num2str(cury) '/' num2str(Q)]);
            display_sagittal(cury);
        elseif (gca == coronal)
            curx = round(str2double(typestring));
            if curx>Q, curx=Q;
            elseif curx<1, curx=1;   
            end
            set(cortext,'String',['Coronal: ' num2str(curx) '/' num2str(P)]);
            display_coronal(curx);
        end
        typestring = '';
    else %If the wrong key was pressed act is if no button had ever been pressed
        typestring = '';
        if (gca == axial), set(axtext,'String',['Axial: ' num2str(curz) '/' num2str(R)]);
          elseif (gca == sagittal), set(sagtext,'String',['Sagittal: ' num2str(cury) '/' num2str(Q)]);
         elseif (gca == coronal), set(cortext,'String',['Coronal: ' num2str(curx) '/' num2str(P)]);
        end
    end
end
function [threedarray xthickness ythickness zthickness] = gatherImages(folder)
%GATHERIMAGES looks through a folder, gets all DICOM files and assembles
%them into a viewable 3d format.

d = sortDirectory(folder); %Sort in ascending order of instance number
topimage = dicomread(d(1,:));
metadata = dicominfo(d(1,:));

[group1 element1] = dicomlookup('PixelSpacing');
[group2 element2] = dicomlookup('SliceThickness');

resolution = metadata.(dicomlookup(group1, element1));
xthickness = resolution(1); 
ythickness = resolution(2);
zthickness = metadata.(dicomlookup(group2, element2));

threedarray = zeros(size(topimage,1),size(topimage,2),size(d,1));
threedarray(:,:,1) = topimage;


for i = 2:size(d,1)
 
 threedarray(:,:,i) = dicomread(d(i,:));
 
end

end %end gatherImages(folder)

function d = sortDirectory(folder)
%SORTDIRECTORY sorts based on instance number

cd(folder);
d = ls('*.dcm');
m = size(d,1);

[group, element] = dicomlookup('InstanceNumber');
sdata(m) = struct('imagename','','instance',0);

for i = 1:m
    metadata = dicominfo(d(i,:));
    position = metadata.(dicomlookup(group, element));
    sdata(i) = struct('imagename',d(i,:),'instance',position);
end

[unused order] = sort([sdata(:).instance],'ascend');
sorted = sdata(order).';

for i = 1:m
    d(i,:) = sorted(i).imagename;
end

end %end sortDirectory(dir)

function bone = find_bone(current_image)
[level em] = graythresh(current_image);
level=0.57;
bone = im2bw(current_image,level);
end

%multithreshold 
    function bone = find_bone_with_multithresholding(current_image)
    
    end


function s = get_contour(c)

    sz = size(c,2);     % Size of the contour matrix c
    ii = 1;             % Index to keep track of current location
    jj = 1;             % Counter to keep track of # of contour lines

    while ii < sz       % While we haven't exhausted the array
        n = c(2,ii);    % How many points in this contour?
        s(jj).v = c(1,ii);        % Value of the contour
        s(jj).x = c(1,ii+1:ii+n); % X coordinates
        s(jj).y = c(2,ii+1:ii+n); % Y coordinates
        ii = ii + n + 1;          % Skip ahead to next contour line
        jj = jj + 1;              % Increment number of contours
    end

end




end %end dicom viewer
