function extractVOI(img)

hMainGui = getappdata(0,'hmaingui');
h = getappdata(hMainGui,'recthandle');
    
p1 = getPosition(h(1)); % get axial
p2 = getPosition(h(2)); % get coronal
p3 = getPosition(h(3)); % get sagittal

VOIdefs= [p1(1),p1(1)+p1(3),p1(2),p1(2)+p1(4),p2(2),p2(2)+p2(4)];

[x,y,z,svol] = subvolume(img,VOIdefs);

imlook3d(svol); % This gui is available in Matlab file exchange