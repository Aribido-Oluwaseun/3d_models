% READ ME
% Adjust the individual ROIs to get the desired VOI
% Then use the IMtools->ExtractVOI submenu to extract VOI
% Please note that the extracted VOI may be required to rotate to get it in
% the right orientation

function VOI_example()

% Load MAtlab MRI image
load mri
img = squeeze(D);
img1 = img(:,:,15); % extract an axial slice
img2 = rot90(squeeze(img(70,:,:))); % extract a coronal slice
img3 = rot90(squeeze(img(:,60,:))); % extract a sagittal slice

f = myfigure;
figure(f); colormap gray
ax(1)= subplot(131);imagesc(double(img1));axis image; title ('Transaxial');axis off
ax(2)= subplot(132);imagesc(double(img2));axis image; title ('Coronal'); axis off
ax(3)= subplot(133);imagesc(double(img3));axis image; title ('Sagittal'); axis off

% default Axial ROI
aROI = [10 10 10 10];
% default Coronal ROI
cROI = [aROI(1),10, aROI(3),10];
% Default Sagittal ROI
sROI = [10, aROI(2),aROI(4),10];    

h(1) = imrect(ax(1),aROI);
setColor(h(1),'blue');
h(2) = imrect(ax(2),cROI);
setColor(h(2),'green');
h(3) = imrect(ax(3),sROI);
setColor(h(3),'red');

% Contrain the ROIs
fcn1 = makeConstrainToRectFcn('imrect',get(ax(1),'XLim'),get(ax(1),'YLim'));
setPositionConstraintFcn(h(1),fcn1);
fcn2 = makeConstrainToRectFcn('imrect',get(ax(2),'XLim'),get(ax(2),'YLim'));
setPositionConstraintFcn(h(2),fcn2);
fcn3 = makeConstrainToRectFcn('imrect',get(ax(3),'XLim'),get(ax(3),'YLim'));
setPositionConstraintFcn(h(3),fcn3);

% Callbacks for the ROIs
addNewPositionCallback(h(1),@(p) AxialROIaction(p,h));
addNewPositionCallback(h(2),@(p) CoronalROIaction(p,h));
addNewPositionCallback(h(3),@(p) SagittalROIaction(p,h));

% This is to save the ROI definitions
setappdata(0,'hmaingui',gcf);
setappdata(gcf,'recthandle',h);

% Callback when transaxial ROI is changed.
function AxialROIaction(p,h)
p2 = getPosition(h(2)); % get coronal
p3 = getPosition(h(3)); % get sagittal
p2(1) = p(1); 
p2(3) = p(3);
p3(1) = p(2);
p3(3) = p(4);
setPosition(h(2),p2); % set coronal
setPosition(h(3),p3); % set sagital
% Callback when Coronal ROI is changed.
function CoronalROIaction(p,h)
p1 = getPosition(h(1)); % get axial
p3 = getPosition(h(3)); % get sagittal
p1(1) = p(1); p1(3) = p(3);
p3(2) = p(2); p3(4) = p(4);
setPosition(h(1),p1); % set axial
setPosition(h(3),p3); % set sagital
% Callback when sagittal ROI is changed.
function SagittalROIaction(p,h)
p1 = getPosition(h(1)); % get axial
p2 = getPosition(h(2)); % get coronal
p1(2) = p(1); 
p1(4) = p(3);
p2(2) = p(2);
p2(4) = p(4);
setPosition(h(1),p1); % set coronal
setPosition(h(2),p2); % set sagital

% This creates the figure
function myfig = myfigure(img);
myfig = figure;
imto = uimenu(myfig,'Label','ImTools');
uimenu(imto,'Label','Pixval','Callback','impixelinfo');
uimenu(imto,'Label','Extract VOI','Callback','extractVOI(img);');


