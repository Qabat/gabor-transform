function [TAmapFFT, TAmapOscillation, frequencyFFT, lambdasFFT, delaysFFT] = gaborTransform(mapVector, rangeStart, rangeStop, alpha, tau)

    TAmapOscillation = mapVector{1};
    delays = mapVector{2};

	rangeStart = find(delays >= rangeStart, 1);
	rangeStop = find(delays >= rangeStop, 1);
    
    TAmapOscillation = TAmapOscillation(:,rangeStart:rangeStop);
    delaysFFT = delays(rangeStart:rangeStop);
    lambdasFFT = mapVector{3};

    % comment out do do fourier transform instead of gabor transform
    TAmapOscillation = TAmapOscillation .* exp(- ((delaysFFT - tau).^2) ./ (0.361 * alpha.^2));
    
    % 60 THz is 2000 cm-1   45 THZ is 1500 cm-1   1/fs is PHz
        frequencyFFT = linspace(0, 0.03, 2000);
%     frequencyFFT = linspace(0.015, 0.03, 2000);
%     frequencyFFT = linspace(0.0075, 0.0375, 2000);

    TAmapFFTfull = TAmapOscillation * exp(-1i * 2*pi * frequencyFFT .* delaysFFT');
    
    TAmapFFT = abs(TAmapFFTfull);
%     TAmapPhase = angle(TAmapFFTfull);
    
    % change to cm-1
    frequencyFFT = frequencyFFT * 33357;
    
    % normalize fft amplitude
    TAmapFFT = TAmapFFT / max(max(TAmapFFT));
end