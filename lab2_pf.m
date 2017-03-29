%%% Lab 2 PF %%%

%% 1 %%
clear

filename='birthday_78469.wav';
window_length=0.02;
shift_length=0.01;

[y,Fs] = audioread(filename);
samples_window=shift_length*Fs;

num_of_windows=length(y)/samples_window;

num_of_windows=floor(num_of_windows);

Fs=16000;

for i = 0:num_of_windows-3
    F0_vector(1+i)=pitch_detect(y,Fs,window_length,i*shift_length);
end

fileID = fopen('birthdate_78469.myf0','w');
fprintf(fileID,'%17.14f\r\n',F0_vector);
fclose(fileID);








