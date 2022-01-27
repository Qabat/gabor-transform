% This function plots the transient absorption map.

function mapPlot = plotMap(mapVector, rangeVector, plottingVector, fileLocation)

    TAmap = mapVector{1};
    delays = mapVector{2};
    lambdas = mapVector{3};
    
    delayRange = rangeVector{1};
    lambdaRange = rangeVector{2};
    intensityRange = rangeVector{3};

%     delays = delays/1000;
%     delayRange = delayRange/1000;
    
    xAxis = plottingVector{2};
    mainFontsize = plottingVector{4};
    linewidth = plottingVector{7};
    cmap = plottingVector{8};
    
    mapPlot = figure('Position', [175 75 900 800], 'Name', 'TAmap', 'NumberTitle', 'off');

    hold all

    set(findall(mapPlot, '-property', 'TickLength'), 'LineWidth', linewidth)
    set(findall(mapPlot, '-property', 'FontSize'), 'FontName', 'Arial', 'FontSize', mainFontsize)

%     TAmap = real(TAmap);


    pcolor(delays, lambdas, TAmap)
     
%     contour(delays, lambdas, TAmap, [0.1, 0.1])
    
%     pbaspect([1 1 1]);
    caxis(intensityRange);
    numColor = 1024;
    if strcmp(cmap, 'jet')
        colormap((jet(numColor)));
    elseif strcmp(cmap, 'gray')
        colormap('gray');
    elseif strcmp(cmap, 'flipudjet')
        colormap(flipud(jet(numColor)));
    elseif strcmp(cmap, 'bwr')
        colormap((bluewhitered(numColor)));
    elseif strcmp(cmap, 'bwre')
        colormap((bluewhitered_enhanced(numColor)));
    elseif strcmp(cmap, 'bwrjet')
        colormap((bluewhitered_jet(numColor)));
    elseif strcmp(cmap, 'mattia')
        colormap(MattiaMap(intensityRange(1), intensityRange(2)))
    elseif strcmp(cmap, 'andrea')
        colormap(NegativeEnhancingColormap(numColor, intensityRange, [0 0 102]/255, [153 0 0]/255, 1));
    elseif strcmp(cmap, 'inferno')
        colormap(inferno(64));
	elseif strcmp(cmap, 'finferno')
        colormap(flipud(inferno(32)));
    end
    colorbarHandle = colorbar;
    set(colorbarHandle, 'position', [.9 .12 .04 .72])
    set(get(colorbarHandle, 'Title'), 'String', {'\DeltaA','[mOD]'});
    shading interp
 
    % plot bandgap level
%     plot([-100 100000], [3.43, 3.43], 'k--', 'Linewidth', 2);
    
%     for i = 0:22.5:1000
%         plot([90 90] + i, [0 1000], 'w-', 'Linewidth', 2);
%     end


    % find center of the fourer peak and mark it
%     [~, max_id] = max(max(TAmap));
%     disp(max_id)
%     plot([delays(max_id) delays(max_id)], [0 1000], 'w--', 'Linewidth', 5);
    
    % plot position of the node
    
    
    xlim(delayRange);
    ylim(lambdaRange);

    xlabel(xAxis);
    ylabel('Probe wavelength [nm]');
    
    title('');
    
%         ylabel('Photon energy [eV]');

%     yticks([310 350 400 450 500 550 600 650]);
% 
%     sampleName = cellstr(fileLocation);
%     sampleName = sampleName{1};
%     [~, sampleName] = strtok(sampleName, '1');
%     [~, sampleName] = strtok(sampleName, 'd');
%     sampleName = erase(sampleName, '.dat');
%     sampleName = strrep(sampleName, '_', ' ');
%     sampleName = strcat('\fontsize{14}', sampleName);
%     title(sampleName);

    box on

%     hold off
    
end