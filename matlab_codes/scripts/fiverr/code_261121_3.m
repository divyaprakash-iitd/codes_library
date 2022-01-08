%Signal Generation and Sampling 
f=2; %max frequency
fs=20*f; %sampling rate
t=0:1/fs:1; %time
a=4; %Amplitude
s=a*sin(2*pi*f*t);

%Plot sinewave
figure;
plot(t,s); 
xlabel('time (in seconds)');
ylabel('Amplitude (in volts)');
title('Signal versus Time');
zoom xon;



 %Quantization
 n=3; 
 L=2^n; 
 vmax=8;
 vmin=-vmax;
 del=(vmax-vmin)/L;
 part=vmin:del:vmax;                   % level are between vmin and vmax with difference of del
 code=vmin-(del/2):del:vmax+(del/2);   % Contaion Quantized valuses 
 [ind,q]=quantiz(s,part,code);         % Quantization process
 
 figure
 plot(q)
 title('Quantized signal')
 
%  Encoding Process
figure
code=de2bi(ind,'left-msb');   % Cnvert the decimal to binary
%code=de2bi(ind);   % Cnvert the decimal to binary
k=1;
l1=length(ind);
l2=length(q);
for i=1:l1
    for j=1:n
        coded(k)=code(i,j);   % convert code matrix to a coded row vector
        j=j+1;
        k=k+1;
    end
    i=i+1;
end
 subplot(2,1,1); grid on;
 stairs(coded);               % Display the encoded signal
 axis([0 100 -2 3]);  title('Encoded Signal');
 ylabel('Amplitude--->');
 xlabel('Time--->');
 
 fprintf('Coded signal\n')
 coded
 
 %Demodulation Of PCM signal
 qunt=reshape(coded,n,length(coded)/n);
 index=bi2de(qunt','left-msb');                    % Getback the index in decimal form
 q=del*index+vmin+(del/2);                       % getback Quantized values
 subplot(2,1,2); grid on;
 plot(q);                                                        % Plot Demodulated signal
 title('Demodulated Signal');
 ylabel('Amplitude--->');
 xlabel('Time--->');
