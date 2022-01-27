close all

% [file, path] = uigetfile('C:\PhD\UV TA\samples\nucleosides\*.dat');        
% fileLocation = [path file];

fileLocation = 'C:\Users\Piotr\OneDrive - Politecnico di Milano\PhD\papers\ultrafast tryptophan paper\vishal magic noise removal\SVD_1_6_284_oscillations';
mapVector = readMap(fileLocation, '');

delayRange = [75 1500];
lambdaRange = [315 400];
intensityRange = 0.05 * [-1 1];

rangeVectorOsc = {delayRange, lambdaRange, intensityRange};

intensityAxis = '\DeltaA [mOD]';
xAxisTA = 'Time delay [fs]';
intensityOffset = 0;
mainFontsize = 20;
legendFontsize = 14;
legendLocation = 'northwest';
linewidth = 2;
cmapOsc = 'bwr';

plottingVector = {intensityAxis, xAxisTA, intensityOffset, mainFontsize, legendFontsize, legendLocation, linewidth, cmapOsc};
plotMap(mapVector, rangeVectorOsc, plottingVector, fileLocation);

% lambdas = mapVector{3};
% lambdaGabor = 600;
% indexLambdaGabor = find(lambdas >= lambdaGabor, 1);
% 
% gaborMatrix = [];
% tauMatrix = [];
% 
% % gaussian gating
% % alpha = 50000;
% alpha = 400; %fs
% for tau = 100:10:1200
% 
%     tauMatrix = [tauMatrix tau];
%     
%     [TAmapFFT, TAmapOscillation, frequencyFFT, lambdasFFT, delaysFFT] = gaborTransform(mapVector, delayRange(1), delayRange(2), alpha, tau);
% 
%     frequencyGabor = 950;
%     indexFrequencyGabor = find(frequencyFFT >= frequencyGabor, 1);
%     
%     % for specific wavelength
%     gaborMatrix = [gaborMatrix TAmapFFT(indexLambdaGabor,:)'];
%     
% %     % for specific vibration frequency
% %     gaborMatrix = [gaborMatrix TAmapFFT(:,indexFrequencyGabor)];
% 
%     
% %     figure()
% %     subplot(1,2,1)
% %         pcolor(delaysFFT, lambdasFFT, TAmapOscillation)
% %     shading interp
% %     pbaspect([1 1 1]);
% %     colormap((bluewhitered(1024)));
% %     
% %         subplot(1,2,2)
% %                 pcolor(frequencyFFT, lambdasFFT, TAmapFFT)
% %     shading interp
% %     pbaspect([1 1 1]);
% %     colormap((jet(1024)));
% %         caxis([0 0.2]);
% end
% 
% % for specific wavelength
% figure()
% pcolor(tauMatrix, frequencyFFT, (gaborMatrix))
% hold on
% contour(tauMatrix, frequencyFFT, (gaborMatrix), 10, 'Color', 'white', 'Linewidth', 1)
%     shading interp
%     colormap((inferno(256)));
%     xlabel('delay [fs]');
%     ylabel('frequency [cm-1]');
%     title(['' 'wavelength: ' num2str(lambdaGabor) ' nm']);
% %     caxis([0 0.5]);
% %     ylim([600 800]);
%     
% % for specific frequency
% % figure()
% % pcolor(tauMatrix, lambdas, (gaborMatrix))
% % hold on
% % contour(tauMatrix, lambdas, (gaborMatrix), 10, 'Color', 'white', 'Linewidth', 1)
% %     shading interp
% %     colormap((inferno(256)));
% %     xlabel('delay [fs]');
% %     ylabel('lambda [nm]');
% %     title(['' 'frequency: ' num2str(frequencyGabor) ' cm-1']);
% %         caxis([0 0.2]);
