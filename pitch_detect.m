function [F0] = pitch_detect(y,Fs,window,shift)

corr_shift = 0.005;

start_value=floor(1+shift*Fs);
end_value=floor((window+shift)*Fs);


samples = y(start_value:end_value);

num_Lags=end_value-start_value;


% autocorr(samples,num_Lags);

Rx=autocorr(samples,num_Lags);
    


% autocorr(samples,(Fs*window)-1)
% 
% Rx=autocorr(samples,(Fs*window)-1);


a=corr_shift*Fs;

[max1,idx1] = max(Rx);
[max2,idx2] = max( Rx(a:end) );

idx2 = idx2 + corr_shift*Fs;

if max2 >= 0.5
    T0 = (idx2 - idx1)/Fs;
else
    T0=0;
end    
    
if T0==0
    F0=0;
else
    F0 = 1/T0;
end
    
end
