function y = EEG_filt(data,stop1,pass1,pass2,stop2)
% Matthew McCann
% 28 July, 2015

% Partially generated by MATLAB(R) 8.3 and the Signal Processing Toolbox 6.21.
% Generated on: 28-Jul-2015 10:35:44
% Creates objects to bandpass filter data given stopband an passband
% frequencies.

% Last updated: 28/7/2015
% Changelog


persistent Hd;
global Fs_EEG

if isempty(Hd)
    
    Fstop1 = stop1;    % First Stopband Frequency
    Fpass1 = pass1;    % First Passband Frequency
    Fpass2 = pass2;   % Second Passband Frequency
    Fstop2 = stop2;   % Second Stopband Frequency
    Astop1 = 60;   % First Stopband Attenuation (dB)
    Apass  = 1;    % Passband Ripple (dB)
    Astop2 = 60;   % Second Stopband Attenuation (dB)
    Fs     = Fs_EEG;  % Sampling Frequency
    
    h = fdesign.bandpass('fst1,fp1,fp2,fst2,ast1,ap,ast2', Fstop1, Fpass1, ...
        Fpass2, Fstop2, Astop1, Apass, Astop2, Fs);
    
    Hd = design(h, 'equiripple', ...
        'MinOrder', 'any');
    
    
    
    set(Hd,'PersistentMemory',true);
    
end

y = filter(Hd,data);


