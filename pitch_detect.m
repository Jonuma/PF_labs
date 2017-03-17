function pitch_detect(filename,window,shift)

clear y Fs
corr_shift = 0.005;


Fs=16000;
samples = [1,window*Fs];

[y,ff] = audioread(filename,samples);

autocorr(y,(Fs*window)-1)

Rx=autocorr(y,(Fs*window)-1);

a=corr_shift*Fs;

[max1,idx1] = max(Rx);
[max2,idx2] = max( Rx(a:end) );

idx2 = idx2 + corr_shift*Fs;

T0 = (idx2 - idx1)/Fs



end
