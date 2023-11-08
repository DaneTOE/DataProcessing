clear all; close all; clc
% Developed by: MS and RH
% Date: 3-Nov-2023
% Purpose: Process Signal Data
% Given: 
% Input Unconditioned (Raw) Signal Data

Data ='C:\Users\dlals\OneDrive\Desktop\Sensor 3 Data Collection.xlsx';
S_names = sheetnames(Data);   % Recommended fcn: sheetnames()
for ii=1:numel(S_names)
    D{ii}=readtable(Data, 'Sheet', S_names(ii));  % Recommended fcn: readtable()  or readmatrix() or readcell()
end

%Time Array
t=[0	4.13907E-05	8.27814E-05	0.000124172	0.000165563	0.000206954	0.000248344	0.000289735	0.000331126	0.000372516	0.000413907	0.000455298	0.000496688	0.000538079	0.00057947	0.000620861	0.000662251	0.000703642	0.000745033	0.000786423	0.000827814	0.000869205	0.000910595	0.000951986	0.000993377	0.001034768	0.001076158	0.001117549	0.00115894	0.00120033	0.001241721	0.001283112	0.001324502	0.001365893	0.001407284	0.001448675	0.001490065	0.001531456	0.001572847	0.001614237	0.001655628	0.001697019	0.001738409	0.0017798	0.001821191	0.001862582	0.001903972	0.001945363	0.001986754	0.002028144	0.002069535	0.002110926	0.002152316	0.002193707	0.002235098	0.002276489	0.002317879	0.00235927	0.002400661	0.002442051	0.002483442	0.002524833	0.002566223	0.002607614	0.002649005	0.002690396	0.002731786	0.002773177	0.002814568	0.002855958	0.002897349	0.00293874	0.00298013	0.003021521	0.003062912	0.003104302	0.003145693	0.003187084	0.003228475	0.003269865	0.003311256	0.003352647	0.003394037	0.003435428	0.003476819	0.003518209	0.0035596	0.003600991	0.003642382	0.003683772	0.003725163	0.003766554	0.003807944	0.003849335	0.003890726	0.003932116	0.003973507	0.004014898	0.004056289	0.004097679	0.00413907	0.004180461	0.004221851	0.004263242	0.004304633	0.004346024	0.004387414	0.004428805	0.004470196	0.004511586	0.004552977	0.004594368	0.004635758	0.004677149	0.00471854	0.004759931	0.004801321	0.004842712	0.004884103	0.004925493	0.004966884	0.005008275	0.005049665	0.005091056	0.005132447	0.005173838	0.005215228	0.005256619	0.00529801	0.0053394	0.005380791	0.005422182	0.005463572	0.005504963	0.005546354	0.005587745	0.005629135	0.005670526	0.005711917	0.005753307	0.005794698	0.005836089	0.005877479	0.00591887	0.005960261	0.006001652	0.006043042	0.006084433	0.006125824	0.006167214	0.006208605	0.006249996	0.006291386	0.006332777	0.006374168	0.006415559	0.006456949	0.00649834	0.006539731	0.006581121	0.006622512	0.006663903	0.006705293	0.006746684	0.006788075	0.006829466	0.006870856	0.006912247	0.006953638	0.006995028	0.007036419	0.00707781	0.0071192	0.007160591	0.007201982	0.007243373	0.007284763	0.007326154	0.007367545	0.007408935	0.007450326	0.007491717	0.007533107	0.007574498	0.007615889	0.00765728	0.00769867	0.007740061	0.007781452	0.007822842	0.007864233	0.007905624	0.007947014	0.007988405	0.008029796	0.008071187	0.008112577	0.008153968	0.008195359	0.008236749	0.00827814	0.008319531	0.008360921	0.008402312	0.008443703	0.008485094	0.008526484	0.008567875	0.008609266	0.008650656	0.008692047	0.008733438	0.008774828	0.008816219	0.00885761	0.008899001	0.008940391	0.008981782	0.009023173	0.009064563	0.009105954	0.009147345	0.009188735	0.009230126	0.009271517	0.009312908	0.009354298	0.009395689	0.00943708	0.00947847	0.009519861	0.009561252	0.009602642	0.009644033	0.009685424	0.009726815	0.009768205	0.009809596	0.009850987	0.009892377	0.009933768	0.009975159	0.010016549	0.01005794	0.010099331	0.010140722	0.010182112	0.010223503	0.010264894	0.010306284	0.010347675	0.010389066	0.010430456	0.010471847	0.010513238	0.010554629	0.010596019	0.01063741	0.010678801	0.010720191	0.010761582	0.010802973	0.010844363	0.010885754	0.010927145	0.010968536	0.011009926	0.011051317	0.011092708	0.011134098	0.011175489	0.01121688	0.01125827	0.011299661	0.011341052	0.011382443	0.011423833	0.011465224	0.011506615	0.011548005	0.011589396	0.011630787	0.011672177	0.011713568	0.011754959	0.01179635	0.01183774	0.011879131	0.011920522	0.011961912	0.012003303	0.012044694	0.012086084	0.012127475	0.012168866	0.012210257	0.012251647	0.012293038	0.012334429	0.012375819	0.01241721	0.012458601	0.012499991	0.012541382	0.012582773	0.012624164	0.012665554	0.012706945	0.012748336	0.012789726	0.012831117	0.012872508	0.012913898	0.012955289	0.01299668	0.013038071	0.013079461	0.013120852	0.013162243	0.013203633	0.013245024	0.013286415	0.013327805	0.013369196	0.013410587	0.013451977	0.013493368	0.013534759	0.01357615	0.01361754	0.013658931	0.013700322	0.013741712	0.013783103	0.013824494	0.013865884	0.013907275	0.013948666	0.013990057	0.014031447	0.014072838	0.014114229	0.014155619	0.01419701	0.014238401	0.014279791	0.014321182	0.014362573	0.014403964	0.014445354	0.014486745	0.014528136	0.014569526	0.014610917	0.014652308	0.014693698	0.014735089	0.01477648	0.014817871	0.014859261	0.014900652	0.014942043	0.014983433	0.015024824	0.015066215	0.015107605	0.015148996	0.015190387	0.015231778	0.015273168	0.015314559	0.01535595	0.01539734	0.015438731	0.015480122	0.015521512	0.015562903	0.015604294	0.015645685	0.015687075	0.015728466	0.015769857	0.015811247	0.015852638	0.015894029	0.015935419	0.01597681	0.016018201	0.016059592	0.016100982	0.016142373	0.016183764	0.016225154	0.016266545	0.016307936	0.016349326	0.016390717	0.016432108	0.016473499	0.016514889	0.01655628	0.016597671	0.016639061	0.016680452	0.016721843	0.016763234	0.016804624	0.016846015	0.016887406	0.016928796	0.016970187	0.017011578	0.017052968	0.017094359	0.01713575	0.017177141	0.017218531	0.017259922	0.017301313	0.017342703	0.017384094	0.017425485	0.017466875	0.017508266	0.017549657	0.017591048	0.017632438	0.017673829	0.01771522	0.01775661	0.017798001	0.017839392	0.017880782	0.017922173	0.017963564	0.018004955	0.018046345	0.018087736	0.018129127	0.018170517	0.018211908	0.018253299	0.018294689	0.01833608	0.018377471	0.018418862	0.018460252	0.018501643	0.018543034	0.018584424	0.018625815	0.018667206	0.018708596	0.018749987	0.018791378	0.018832769	0.018874159	0.01891555	0.018956941	0.018998331	0.019039722	0.019081113	0.019122503	0.019163894	0.019205285	0.019246676	0.019288066	0.019329457	0.019370848	0.019412238	0.019453629	0.01949502	0.01953641	0.019577801	0.019619192	0.019660583	0.019701973	0.019743364	0.019784755	0.019826145	0.019867536	0.019908927	0.019950317	0.019991708	0.020033099	0.02007449	0.02011588	0.020157271	0.020198662	0.020240052	0.020281443	0.020322834	0.020364224	0.020405615	0.020447006	0.020488397	0.020529787	0.020571178	0.020612569	0.020653959	0.02069535	0.020736741	0.020778131	0.020819522	0.020860913	0.020902304	0.020943694	0.020985085	0.021026476	0.021067866	0.021109257	0.021150648	0.021192038	0.021233429	0.02127482	0.021316211	0.021357601	0.021398992	0.021440383	0.021481773	0.021523164	0.021564555	0.021605945	0.021647336	0.021688727	0.021730118	0.021771508	0.021812899	0.02185429	0.02189568	0.021937071	0.021978462	0.022019852	0.022061243	0.022102634	0.022144025	0.022185415	0.022226806	0.022268197	0.022309587	0.022350978	0.022392369	0.022433759	0.02247515	0.022516541	0.022557932	0.022599322	0.022640713	0.022682104	0.022723494	0.022764885	0.022806276	0.022847666	0.022889057	0.022930448	0.022971839	0.023013229	0.02305462	0.023096011	0.023137401	0.023178792	0.023220183	0.023261573	0.023302964	0.023344355	0.023385746	0.023427136	0.023468527	0.023509918	0.023551308	0.023592699	0.02363409	0.02367548	0.023716871	0.023758262	0.023799653	0.023841043	0.023882434	0.023923825	0.023965215	0.024006606	0.024047997	0.024089387	0.024130778	0.024172169	0.02421356	0.02425495	0.024296341	0.024337732	0.024379122	0.024420513	0.024461904	0.024503294	0.024544685	0.024586076	0.024627467	0.024668857	0.024710248	0.024751639	0.024793029];


%Variables for 1000Hz
DC_Raw= D{1,1}(3:602,"AmpOn");
D1000Hz100mV_raw= D{1,2}(:,"x1000Hz");
D1000Hz500mV= D{1,3}(:,"x1000Hz");
D1000Hz1V= D{1,4}(:,"x1000Hz");
D1000Hz1p5V= D{1,5}(:,"x1000Hz");
D1000Hz2V= D{1,6}(:,"x1000Hz");
D1000Hz2p5V= D{1,7}(:,"x1000Hz");
D1000Hz3V= D{1,8}(:,"x1000Hz");
D1000Hz3p5V= D{1,9}(:,"x1000Hz");
D1000Hz4V= D{1,10}(:,"x1000Hz");
D1000Hz4p5V= D{1,11}(:,"x1000Hz");
D1000Hz5V= D{1,12}(:,"x1000Hz");


DCRaw = DC_Raw.AmpOn
OnekHz100mV_raw = D1000Hz100mV_raw.x1000Hz
OnekHz500mV_raw = D1000Hz500mV.x1000Hz
OnekHz1V_raw = D1000Hz1V.x1000Hz
OnekHz1p5V_raw = D1000Hz1p5V.x1000Hz
OnekHz2V_raw = D1000Hz2V.x1000Hz
OnekHz2p5V_raw = D1000Hz2p5V.x1000Hz
OnekHz3V_raw = D1000Hz3V.x1000Hz
OnekHz3p5V_raw = D1000Hz3p5V.x1000Hz
OnekHz4V_raw = D1000Hz4V.x1000Hz
OnekHz4p5V_raw = D1000Hz4p5V.x1000Hz
OnekHz5V_raw = D1000Hz5V.x1000Hz


%Variables for 2000Hz
D2000Hz100mV_raw= D{1,2}(:,"x2000Hz");
D2000Hz500mV= D{1,3}(:,"x2000Hz");
D2000Hz1V= D{1,4}(:,"x2000Hz");
D2000Hz1p5V= D{1,5}(:,"x2000Hz");
D2000Hz2V= D{1,6}(:,"x2000Hz");
D2000Hz2p5V= D{1,7}(:,"x2000Hz");
D2000Hz3V= D{1,8}(:,"x2000Hz");
D2000Hz3p5V= D{1,9}(:,"x2000Hz");
D2000Hz4V= D{1,10}(:,"x2000Hz");
D2000Hz4p5V= D{1,11}(:,"x2000Hz");
D2000Hz5V= D{1,12}(:,"x2000Hz");

TwokHz100mV_raw = D2000Hz100mV_raw.x2000Hz
TwokHz500mV_raw = D2000Hz500mV.x2000Hz
TwokHz1V_raw = D2000Hz1V.x2000Hz
TwokHz1p5V_raw = D2000Hz1p5V.x2000Hz
TwokHz2V_raw = D2000Hz2V.x2000Hz
TwokHz2p5V_raw = D2000Hz2p5V.x2000Hz
TwokHz3V_raw = D2000Hz3V.x2000Hz
TwokHz3p5V_raw = D2000Hz3p5V.x2000Hz
TwokHz4V_raw = D2000Hz4V.x2000Hz
TwokHz4p5V_raw = D2000Hz4p5V.x2000Hz
TwokHz5V_raw = D2000Hz5V.x2000Hz



%Variables for 3000Hz
%Variables for 4000Hz
%Variables for 5000Hz
%Variables for 6000Hz
%Variables for 7000Hz
%Variables for 8000Hz
%Variables for 9000Hz
%Variables for 10000Hz



%Unconditioned Signal at 1kHz
figure()
plot(t,OnekHz100mV_raw)
hold on
plot(t,OnekHz500mV_raw)
plot(t,OnekHz1V_raw)
plot(t,OnekHz1p5V_raw)
plot(t,OnekHz2V_raw)
plot(t,OnekHz2p5V_raw)
plot(t,OnekHz3V_raw)
plot(t,OnekHz3p5V_raw)
plot(t,OnekHz4V_raw)
plot(t,OnekHz4p5V_raw)
plot(t,OnekHz5V_raw)
title ('Unconditioned Signal at 1kHz')
legend ('100mV','500mV','1V','1.5V','2V','2.5V','3V','3.5V','4V','4.5V','5V')
hold off


%Moving Average Signal at 1kHz
plot(t,sgolayfilt(OnekHz100mV_raw,1,83),'DisplayName','100mV')
hold on
plot(t,sgolayfilt(OnekHz500mV_raw,1,83),'DisplayName','500mV')
plot(t,sgolayfilt(OnekHz1V_raw,1,83),'DisplayName','1V')
plot(t,sgolayfilt(OnekHz1p5V_raw,1,83),'DisplayName','1.5V')
plot(t,sgolayfilt(OnekHz2V_raw,1,83),'DisplayName','2V')
plot(t,sgolayfilt(OnekHz2p5V_raw,1,83),'DisplayName','2.5V')
plot(t,sgolayfilt(OnekHz3V_raw,1,83),'DisplayName','3V')
plot(t,sgolayfilt(OnekHz3p5V_raw,1,83),'DisplayName','3.5V')
plot(t,sgolayfilt(OnekHz4V_raw,1,83),'DisplayName','4V')
plot(t,sgolayfilt(OnekHz4p5V_raw,1,83),'DisplayName','4.5V')
plot(t,sgolayfilt(OnekHz5V_raw,1,83),'DisplayName','5V')
title ('Moving Average at 1kHz')
legend;
hold off


% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Compute FFT (no signal data)
DC_Raw_ff = fft(DC_Raw.AmpOn);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_dc_raw = abs(DC_Raw_ff/N);                  %two-sided spectrum
P1_dc_raw = P2_dc_raw(1:N/2+1);               %Single-sided spectrum
P1_dc_raw(2:end-1) = 2*P1_dc_raw(2:end-1);    %even-valued signal length N

%Plot Frequency Spectrum (no signal data)
figure()
plot(f,P1_dc_raw) 
title("Single-Sided Amplitude Spectrum of y(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_dc_raw)*1.2])
legend('No signal (DC)')


%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 100mV
% Complute FFT
OnekHz100mV_raw_ff = fft(OnekHz100mV_raw);

P2_1k_100mV_raw = abs(OnekHz100mV_raw_ff/N);                  %two-sided spectrum
P1_1k_100mV_raw = P2_1k_100mV_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_100mV_raw(2:end-1) = 2*P1_1k_100mV_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz100mV_raw = filtfilt(b,a,OnekHz100mV_raw); %Filtered signal

figure()
plot(t,ROnekHz100mV_raw)
title("Filtered Signal (100mV, 1kHz)")

% Complute FFT with filtered data
ROnekHz100mV_new = fft(ROnekHz100mV_raw);

P2_1k_100mV_new = abs(ROnekHz100mV_new/N);                  %two-sided spectrum
P1_1k_100mv_new = P2_1k_100mV_new(1:N/2+1);               %Single-sided spectrum
P1_1k_100mv_new(2:end-1) = 2*P1_1k_100mv_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_100mv_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_100mv_new)*1.2])
legend('Filtered Signal (100mV, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz100mV_raw,t,ROnekHz100mV_raw)
legend('Raw Signal (100mV, 1kHz); Filtered Signal (100mV, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_100mV_raw, f,P1_1k_100mv_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_100mV_raw)*1.1])
legend('Raw Signal (100mV, 1kHz)', 'Filtered Signal (100mV, 1kHz)')


%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) %%%%%%%%%%%%%%% 500mV
% Complute FFT
OnekHz500mV_raw_ff = fft(OnekHz500mV_raw);


P2_1k_500mV_raw = abs(OnekHz500mV_raw_ff/N);                  %two-sided spectrum
P1_1k_500mV_raw = P2_1k_500mV_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_500mV_raw(2:end-1) = 2*P1_1k_500mV_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz500mV_raw = filtfilt(b,a,OnekHz500mV_raw); %Filtered signal

figure()
plot(t,ROnekHz500mV_raw)
title("Filtered Signal (500mV, 1kHz)")

% Complute FFT with filtered data
ROnekHz500mV_new = fft(ROnekHz500mV_raw);

P2_1k_500mV_new = abs(ROnekHz500mV_new/N);                  %two-sided spectrum
P1_1k_500mV_new = P2_1k_500mV_new(1:N/2+1);               %Single-sided spectrum
P1_1k_500mV_new(2:end-1) = 2*P1_1k_500mV_new(2:end-1);    %even-valued signal length N


figure()
plot(f,P1_1k_500mV_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_500mV_new)*1.2])
legend('Filtered Signal (500mV, 1kHz)')


figure()
subplot(2,1,1);
plot(t,OnekHz500mV_raw,t,ROnekHz500mV_raw)
legend('Raw Signal (5V, 1kHz); Filtered Signal (5V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_500mV_raw, f,P1_1k_500mV_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_500mV_raw)*1.1])
legend('Raw Signal (500mV, 1kHz)', 'Filtered Signal (500mV, 1kHz)')



%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 1V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
OnekHz1V_raw_ff = fft(OnekHz1V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_1k_1V_raw = abs(OnekHz1V_raw_ff/N);                  %two-sided spectrum
P1_1k_1V_raw = P2_1k_1V_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_1V_raw(2:end-1) = 2*P1_1k_1V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz1V_raw = filtfilt(b,a,OnekHz1V_raw); %Filtered signal

figure()
plot(t,ROnekHz1V_raw)
title("Filtered Signal (1V, 1kHz)")

% Complute FFT with filtered data
ROnekHz1V_new = fft(ROnekHz1V_raw);

P2_1k_1V_new = abs(ROnekHz1V_new/N);                  %two-sided spectrum
P1_1k_1V_new = P2_1k_1V_new(1:N/2+1);               %Single-sided spectrum
P1_1k_1V_new(2:end-1) = 2*P1_1k_1V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_1V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_1V_new)*1.2])
legend('Filtered Signal (1V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz1V_raw,t,ROnekHz1V_raw)
legend('Raw Signal (1V, 1kHz); Filtered Signal (1V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_1V_raw, f,P1_1k_1V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_1V_raw)*1.1])
legend('Raw Signal (1V, 1kHz)', 'Filtered Signal (1V, 1kHz)')

%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 1.5V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
OnekHz1p5V_raw_ff = fft(OnekHz1p5V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_1k_1p5V_raw = abs(OnekHz1p5V_raw_ff/N);                  %two-sided spectrum
P1_1k_1p5V_raw = P2_1k_1p5V_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_1p5V_raw(2:end-1) = 2*P1_1k_1p5V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz1p5V_raw = filtfilt(b,a,OnekHz1p5V_raw); %Filtered signal

figure()
plot(t,ROnekHz1p5V_raw)
title("Filtered Signal (1.5V, 1kHz)")

% Complute FFT with filtered data
ROnekHz1p5V_new = fft(ROnekHz1p5V_raw);

P2_1k_1p5V_new = abs(ROnekHz1p5V_new/N);                  %two-sided spectrum
P1_1k_1p5V_new = P2_1k_1p5V_new(1:N/2+1);               %Single-sided spectrum
P1_1k_1p5V_new(2:end-1) = 2*P1_1k_1p5V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_1p5V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_1p5V_new)*1.2])
legend('Filtered Signal (1p5V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz1p5V_raw,t,ROnekHz1p5V_raw)
legend('Raw Signal (1.5V, 1kHz); Filtered Signal (1.5V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_1p5V_raw, f,P1_1k_1p5V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_1p5V_raw)*1.1])
legend('Raw Signal (1.5V, 1kHz)', 'Filtered Signal (1.5V, 1kHz)')

%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 2V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
OnekHz2V_raw_ff = fft(OnekHz2V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_1k_2V_raw = abs(OnekHz2V_raw_ff/N);                  %two-sided spectrum
P1_1k_2V_raw = P2_1k_2V_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_2V_raw(2:end-1) = 2*P1_1k_2V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz2V_raw = filtfilt(b,a,OnekHz2V_raw); %Filtered signal

figure()
plot(t,ROnekHz2V_raw)
title("Filtered Signal (2V, 1kHz)")

% Complute FFT with filtered data
ROnekHz2V_new = fft(ROnekHz2V_raw);

P2_1k_2V_new = abs(ROnekHz2V_new/N);                  %two-sided spectrum
P1_1k_2V_new = P2_1k_2V_new(1:N/2+1);               %Single-sided spectrum
P1_1k_2V_new(2:end-1) = 2*P1_1k_2V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_2V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_2V_new)*1.2])
legend('Filtered Signal (2V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz2V_raw,t,ROnekHz2V_raw)
legend('Raw Signal (2V, 1kHz); Filtered Signal (2V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_2V_raw, f,P1_1k_2V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_2V_raw)*1.1])
legend('Raw Signal (2V, 1kHz)', 'Filtered Signal (2V, 1kHz)')

%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 2.5V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
OnekHz2p5V_raw_ff = fft(OnekHz2p5V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_1k_2p5V_raw = abs(OnekHz2p5V_raw_ff/N);                  %two-sided spectrum
P1_1k_2p5V_raw = P2_1k_2p5V_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_2p5V_raw(2:end-1) = 2*P1_1k_2p5V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz2p5V_raw = filtfilt(b,a,OnekHz2p5V_raw); %Filtered signal

figure()
plot(t,ROnekHz2p5V_raw)
title("Filtered Signal (2.5V, 1kHz)")

% Complute FFT with filtered data
ROnekHz2p5V_new = fft(ROnekHz2p5V_raw);

P2_1k_2p5V_new = abs(ROnekHz2p5V_new/N);                  %two-sided spectrum
P1_1k_2p5V_new = P2_1k_2p5V_new(1:N/2+1);               %Single-sided spectrum
P1_1k_2p5V_new(2:end-1) = 2*P1_1k_2p5V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_2p5V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_2p5V_new)*1.2])
legend('Filtered Signal (2p5V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz2p5V_raw,t,ROnekHz2p5V_raw)
legend('Raw Signal (2.5V, 1kHz); Filtered Signal (2.55V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_2p5V_raw, f,P1_1k_2p5V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_2p5V_raw)*1.1])
legend('Raw Signal (2p5V, 1kHz)', 'Filtered Signal (2p5V, 1kHz)')

%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 3V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
OnekHz3V_raw_ff = fft(OnekHz3V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_1k_3V_raw = abs(OnekHz3V_raw_ff/N);                  %two-sided spectrum
P1_1k_3V_raw = P2_1k_3V_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_3V_raw(2:end-1) = 2*P1_1k_3V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz3V_raw = filtfilt(b,a,OnekHz3V_raw); %Filtered signal

figure()
plot(t,ROnekHz3V_raw)
title("Filtered Signal (3V, 1kHz)")

% Complute FFT with filtered data
ROnekHz3V_new = fft(ROnekHz3V_raw);

P2_1k_3V_new = abs(ROnekHz3V_new/N);                  %two-sided spectrum
P1_1k_3V_new = P2_1k_3V_new(1:N/2+1);               %Single-sided spectrum
P1_1k_3V_new(2:end-1) = 2*P1_1k_3V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_3V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_3V_new)*1.2])
legend('Filtered Signal (3V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz3V_raw,t,ROnekHz3V_raw)
legend('Raw Signal (3V, 1kHz); Filtered Signal (3V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_3V_raw, f,P1_1k_3V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_3V_raw)*1.1])
legend('Raw Signal (3V, 1kHz)', 'Filtered Signal (3V, 1kHz)')

%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 3.5V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
OnekHz3p5V_raw_ff = fft(OnekHz3p5V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_1k_3p5V_raw = abs(OnekHz3p5V_raw_ff/N);                  %two-sided spectrum
P1_1k_3p5V_raw = P2_1k_3p5V_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_3p5V_raw(2:end-1) = 2*P1_1k_3p5V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz3p5V_raw = filtfilt(b,a,OnekHz3p5V_raw); %Filtered signal

figure()
plot(f,P1_1k_3p5V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_3p5V_new)*1.2])
legend('Filtered Signal (3p5V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz3p5V_raw,t,ROnekHz3p5V_raw)
legend('Raw Signal (3.5V, 1kHz); Filtered Signal (3.5V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_3p5V_raw, f,P1_1k_3p5V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_3p5V_raw)*1.1])
legend('Raw Signal (3p5V, 1kHz)', 'Filtered Signal (3p5V, 1kHz)')

%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 4V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
OnekHz4V_raw_ff = fft(OnekHz4V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_1k_4V_raw = abs(OnekHz4V_raw_ff/N);                  %two-sided spectrum
P1_1k_4V_raw = P2_1k_4V_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_4V_raw(2:end-1) = 2*P1_1k_4V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz4V_raw = filtfilt(b,a,OnekHz4V_raw); %Filtered signal

figure()
plot(t,ROnekHz4V_raw)
title("Filtered Signal (4V, 1kHz)")

% Complute FFT with filtered data
ROnekHz4V_new = fft(ROnekHz4V_raw);

P2_1k_4V_new = abs(ROnekHz4V_new/N);                  %two-sided spectrum
P1_1k_4V_new = P2_1k_4V_new(1:N/2+1);               %Single-sided spectrum
P1_1k_4V_new(2:end-1) = 2*P1_1k_4V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_4V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_4V_new)*1.2])
legend('Filtered Signal (4V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz4V_raw,t,ROnekHz4V_raw)
legend('Raw Signal (4V, 1kHz); Filtered Signal (4V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_4V_raw, f,P1_1k_4V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_4V_raw)*1.1])
legend('Raw Signal (4V, 1kHz)', 'Filtered Signal (4V, 1kHz)')
plot(t,ROnekHz4V_raw)
title("Filtered Signal (4V, 1kHz)")

% Complute FFT with filtered data
ROnekHz4V_new = fft(ROnekHz4V_raw);

P2_1k_4V_new = abs(ROnekHz4V_new/N);                  %two-sided spectrum
P1_1k_4V_new = P2_1k_4V_new(1:N/2+1);               %Single-sided spectrum
P1_1k_4V_new(2:end-1) = 2*P1_1k_4V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_4V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_4V_new)*1.2])
legend('Filtered Signal (4V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz4V_raw,t,ROnekHz4V_raw)
legend('Raw Signal (4V, 1kHz); Filtered Signal (4V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_4V_raw, f,P1_1k_4V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_4V_raw)*1.1])
legend('Raw Signal (4V, 1kHz)', 'Filtered Signal (4V, 1kHz)')

%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 4.5V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
OnekHz4p5V_raw_ff = fft(OnekHz4p5V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_1k_4p5V_raw = abs(OnekHz4p5V_raw_ff/N);                  %two-sided spectrum
P1_1k_4p5V_raw = P2_1k_4p5V_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_4p5V_raw(2:end-1) = 2*P1_1k_4p5V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz4p5V_raw = filtfilt(b,a,OnekHz4p5V_raw); %Filtered signal

figure()
plot(t,ROnekHz4p5V_raw)
title("Filtered Signal (4.5V, 1kHz)")

% Complute FFT with filtered data
ROnekHz4p5V_new = fft(ROnekHz4p5V_raw);

P2_1k_4p5V_new = abs(ROnekHz4p5V_new/N);                  %two-sided spectrum
P1_1k_4p5V_new = P2_1k_4p5V_new(1:N/2+1);               %Single-sided spectrum
P1_1k_4p5V_new(2:end-1) = 2*P1_1k_4p5V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_4p5V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_4p5V_new)*1.2])
legend('Filtered Signal (4.5V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz4p5V_raw,t,ROnekHz4p5V_raw)
legend('Raw Signal (4.5V, 1kHz); Filtered Signal (4.5V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_4p5V_raw, f,P1_1k_4p5V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_4p5V_raw)*1.1])
legend('Raw Signal (4.5V, 1kHz)', 'Filtered Signal (4.5V, 1kHz)')

%%%%%%%%%%%%%%%%%% 1000 Hz Signal Frequency Spectrum (FFT) @ 5V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
OnekHz5V_raw_ff = fft(OnekHz5V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_1k_5V_raw = abs(OnekHz5V_raw_ff/N);                  %two-sided spectrum
P1_1k_5V_raw = P2_1k_5V_raw(1:N/2+1);               %Single-sided spectrum
P1_1k_5V_raw(2:end-1) = 2*P1_1k_5V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 1 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_1k = 700 %Low cutoff frequency, Hz
f_high_1k = 1500 %High cutoff frequency, Hz
Wn_1k = [f_low_1k, f_high_1k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_1k,ftype); 
ROnekHz5V_raw = filtfilt(b,a,OnekHz5V_raw); %Filtered signal

figure()
plot(t,ROnekHz5V_raw)
title("Filtered Signal (5V, 1kHz)")

% Complute FFT with filtered data
ROnekHz5V_new = fft(ROnekHz5V_raw);

P2_1k_5V_new = abs(ROnekHz5V_new/N);                  %two-sided spectrum
P1_1k_5V_new = P2_1k_4p5V_new(1:N/2+1);               %Single-sided spectrum
P1_1k_5V_new(2:end-1) = 2*P1_1k_5V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_1k_5V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_5V_new)*1.2])
legend('Filtered Signal (5V, 1kHz)')

figure()
subplot(2,1,1);
plot(t,OnekHz5V_raw,t,ROnekHz5V_raw)
legend('Raw Signal (5V, 1kHz); Filtered Signal (5V, 1kHz)')
subplot(2,1,2); 
plot(f,P1_1k_5V_raw, f,P1_1k_5V_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_5V_raw)*1.1])
legend('Raw Signal (5V, 1kHz)', 'Filtered Signal (5V, 1kHz)')

figure()
plot(t,ROnekHz100mV_raw)
hold on
%plot(t,ROnekHz500mV_raw)
plot(t,ROnekHz1V_raw)
%plot(t,ROnekHz1p5V_raw)
plot(t,ROnekHz2V_raw)
%plot(t,ROnekHz2p5V_raw)
plot(t,ROnekHz3V_raw)
%plot(t,ROnekHz3p5V_raw)
plot(t,ROnekHz4V_raw)
%plot(t,ROnekHz4p5V_raw)
plot(t,ROnekHz5V_raw)
title("Filtered Signal for 1kHz for Various Voltage)")

hold off


figure()
plot(f,P1_1k_100mv_new)
title("Single-Sided Amplitude Spectrum of y(t), 1kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_1k_5V_new)*1.2])
hold on
plot(f,P1_1k_500mV_new)
plot(f,P1_1k_1V_new)
plot(f,P1_1k_1p5V_new)
plot(f,P1_1k_2V_new)
plot(f,P1_1k_2p5V_new)
plot(f,P1_1k_3V_new)
plot(f,P1_1k_3p5V_new)
plot(f,P1_1k_4V_new)
plot(f,P1_1k_4p5V_new)
plot(f,P1_1k_5V_new)
legend('Filtered Signal (5V, 1kHz)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%2000Hz%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Unconditioned Signal at 2kHz
figure()
plot(t,TwokHz100mV_raw)
hold on
plot(t,TwokHz500mV_raw)
plot(t,TwokHz1V_raw)
plot(t,TwokHz1p5V_raw)
plot(t,TwokHz2V_raw)
plot(t,TwokHz2p5V_raw)
plot(t,TwokHz3V_raw)
plot(t,TwokHz3p5V_raw)
plot(t,TwokHz4V_raw)
plot(t,TwokHz4p5V_raw)
plot(t,TwokHz5V_raw)
title ('Unconditioned Signal at 2kHz')
legend ('100mV','500mV','1V','1.5V','2V','2.5V','3V','3.5V','4V','4.5V','5V')
hold off


%Moving Average Signal at 2kHz
plot(t,sgolayfilt(TwokHz100mV_raw,1,83),'DisplayName','100mV')
hold on
plot(t,sgolayfilt(TwokHz500mV_raw,1,83),'DisplayName','500mV')
plot(t,sgolayfilt(TwokHz1V_raw,1,83),'DisplayName','1V')
plot(t,sgolayfilt(TwokHz1p5V_raw,1,83),'DisplayName','1.5V')
plot(t,sgolayfilt(TwokHz2V_raw,1,83),'DisplayName','2V')
plot(t,sgolayfilt(TwokHz2p5V_raw,1,83),'DisplayName','2.5V')
plot(t,sgolayfilt(TwokHz3V_raw,1,83),'DisplayName','3V')
plot(t,sgolayfilt(TwokHz3p5V_raw,1,83),'DisplayName','3.5V')
plot(t,sgolayfilt(TwokHz4V_raw,1,83),'DisplayName','4V')
plot(t,sgolayfilt(TwokHz4p5V_raw,1,83),'DisplayName','4.5V')
plot(t,sgolayfilt(TwokHz5V_raw,1,83),'DisplayName','5V')
title ('Moving Average at 2kHz')
legend;
hold off

%%%%%%%%%%%%%%%%%% 2000 Hz Signal Frequency Spectrum (FFT) @ 100mV
% Complute FFT
TwokHz100mV_raw_ff = fft(TwokHz100mV_raw);

P2_2k_100mV_raw = abs(TwokHz100mV_raw_ff/N);                  %two-sided spectrum
P1_2k_100mV_raw = P2_2k_100mV_raw(1:N/2+1);               %Single-sided spectrum
P1_2k_100mV_raw(2:end-1) = 2*P1_2k_100mV_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 2 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_2k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_2k = 700 %Low cutoff frequency, Hz
f_high_2k = 1500 %High cutoff frequency, Hz
Wn_2k = [f_low_2k, f_high_2k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_2k,ftype); 
RTwokHz100mV_raw = filtfilt(b,a,TwokHz100mV_raw); %Filtered signal

figure()
plot(t,RTwokHz100mV_raw)
title("Filtered Signal (100mV, 2kHz)")

% Complute FFT with filtered data
RTwokHz100mV_new = fft(RTwokHz100mV_raw);

P2_2k_100mV_new = abs(RTwokHz100mV_new/N);                  %two-sided spectrum
P1_2k_100mv_new = P2_2k_100mV_new(1:N/2+1);               %Single-sided spectrum
P1_2k_100mv_new(2:end-1) = 2*P1_2k_100mv_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_2k_100mv_new) 
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_100mv_new)*1.2])
legend('Filtered Signal (100mV, 2kHz)')

figure()
subplot(2,1,1);
plot(t,TwokHz100mV_raw,t,RTwokHz100mV_raw)
legend('Raw Signal (100mV, 2kHz); Filtered Signal (100mV, 2kHz)')
subplot(2,1,2); 
plot(f,P1_2k_100mV_raw, f,P1_2k_100mv_new)
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_100mV_raw)*1.1])
legend('Raw Signal (100mV, 2kHz)', 'Filtered Signal (100mV, 2kHz)')



%%%%%%%%%%%%%%%%%% 2000 Hz Signal Frequency Spectrum (FFT)500mV%%%%%
% Complute FFT
TwokHz500mV_raw_ff = fft(TwokHz500mV_raw);


P2_2k_500mV_raw = abs(TwokHz500mV_raw_ff/N);                  %two-sided spectrum
P1_2k_500mV_raw = P2_2k_500mV_raw(1:N/2+1);               %Single-sided spectrum
P1_2k_500mV_raw(2:end-1) = 2*P1_2k_500mV_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 2 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_2k = 700 %Low cutoff frequency, Hz
f_high_2k = 1500 %High cutoff frequency, Hz
Wn_2k = [f_low_2k, f_high_2k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_2k,ftype); 
RTwokHz500mV_raw = filtfilt(b,a,TwokHz500mV_raw); %Filtered signal

figure()
plot(t,RTwokHz500mV_raw)
title("Filtered Signal (500mV, 2kHz)")

% Complute FFT with filtered data
RTwokHz500mV_new = fft(RTwokHz500mV_raw);

P2_2k_500mV_new = abs(RTwokHz500mV_new/N);                  %two-sided spectrum
P1_2k_500mV_new = P2_2k_500mV_new(1:N/2+1);               %Single-sided spectrum
P1_2k_500mV_new(2:end-1) = 2*P1_2k_500mV_new(2:end-1);    %even-valued signal length N


figure()
plot(f,P1_2k_500mV_new) 
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_500mV_new)*1.2])
legend('Filtered Signal (500mV, 2kHz)')


figure()
subplot(2,1,1);
plot(t,TwokHz500mV_raw,t,RTwokHz500mV_raw)
legend('Raw Signal (5V, 2kHz); Filtered Signal (5V, 2kHz)')
subplot(2,1,2); 
plot(f,P1_2k_500mV_raw, f,P1_2k_500mV_new)
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_500mV_raw)*1.1])
legend('Raw Signal (500mV, 2kHz)', 'Filtered Signal (500mV, 2kHz)')


%%%%%%%%%%%%%%%%%% 2000 Hz Signal Frequency Spectrum (FFT) @ 1V
% Complute FFT
TwokHz1V_raw_ff = fft(TwokHz1V_raw);


P2_2k_1V_raw = abs(TwokHz1V_raw_ff/N);                  %two-sided spectrum
P1_2k_1V_raw = P2_2k_1V_raw(1:N/2+1);               %Single-sided spectrum
P1_2k_1V_raw(2:end-1) = 2*P1_2k_1V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 2 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_2k = 700 %Low cutoff frequency, Hz
f_high_2k = 1500 %High cutoff frequency, Hz
Wn_2k = [f_low_2k, f_high_2k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_2k,ftype); 
RTwokHz1V_raw = filtfilt(b,a,TwokHz1V_raw); %Filtered signal

figure()
plot(t,RTwokHz1V_raw)
title("Filtered Signal (1V, 2kHz)")

% Complute FFT with filtered data
RTwokHz1V_new = fft(RTwokHz1V_raw);

P2_2k_1V_new = abs(RTwokHz1V_new/N);                  %two-sided spectrum
P1_2k_1V_new = P2_2k_1V_new(1:N/2+1);               %Single-sided spectrum
P1_2k_1V_new(2:end-1) = 2*P1_2k_1V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_2k_1V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_1V_new)*1.2])
legend('Filtered Signal (1V, 2kHz)')

figure()
subplot(2,1,1);
plot(t,TwokHz1V_raw,t,RTwokHz1V_raw)
legend('Raw Signal (1V, 2kHz); Filtered Signal (1V, 2kHz)')
subplot(2,1,2); 
plot(f,P1_2k_1V_raw, f,P1_2k_1V_new)
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_1V_raw)*1.1])
legend('Raw Signal (1V, 2kHz)', 'Filtered Signal (1V, 2kHz)')

%%%%%%%%%%%%%%%%%% 2000 Hz Signal Frequency Spectrum (FFT) @ 1.5V

% Complute FFT
TwokHz1p5V_raw_ff = fft(TwokHz1p5V_raw);

P2_2k_1p5V_raw = abs(TwokHz1p5V_raw_ff/N);                  %two-sided spectrum
P1_2k_1p5V_raw = P2_2k_1p5V_raw(1:N/2+1);               %Single-sided spectrum
P1_2k_1p5V_raw(2:end-1) = 2*P1_2k_1p5V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 2 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_2k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_2k = 700 %Low cutoff frequency, Hz
f_high_2k = 1500 %High cutoff frequency, Hz
Wn_2k = [f_low_2k, f_high_2k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_2k,ftype); 
RTwokHz1p5V_raw = filtfilt(b,a,TwokHz1p5V_raw); %Filtered signal

figure()
plot(t,RTwokHz1p5V_raw)
title("Filtered Signal (1.5V, 2kHz)")

% Complute FFT with filtered data
RTwokHz1p5V_new = fft(RTwokHz1p5V_raw);

P2_2k_1p5V_new = abs(RTwokHz1p5V_new/N);                  %two-sided spectrum
P1_2k_1p5V_new = P2_2k_1p5V_new(1:N/2+1);               %Single-sided spectrum
P1_2k_1p5V_new(2:end-1) = 2*P1_2k_1p5V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_2k_1p5V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_1p5V_new)*1.2])
legend('Filtered Signal (1p5V, 2kHz)')

figure()
subplot(2,1,1);
plot(t,TwokHz1p5V_raw,t,RTwokHz1p5V_raw)
legend('Raw Signal (1.5V, 2kHz); Filtered Signal (1.5V, 2kHz)')
subplot(2,1,2); 
plot(f,P1_2k_1p5V_raw, f,P1_2k_1p5V_new)
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_1p5V_raw)*1.1])
legend('Raw Signal (1.5V, 2kHz)', 'Filtered Signal (1.5V, 2kHz)')


%%%%%%%%%%%%%%%%%% 2000 Hz Signal Frequency Spectrum (FFT) @ 2V

% Complute FFT
TwokHz2V_raw_ff = fft(TwokHz2V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_2k_2V_raw = abs(TwokHz2V_raw_ff/N);                  %two-sided spectrum
P1_2k_2V_raw = P2_2k_2V_raw(1:N/2+1);               %Single-sided spectrum
P1_2k_2V_raw(2:end-1) = 2*P1_2k_2V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 2 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_1k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_2k = 700 %Low cutoff frequency, Hz
f_high_2k = 1500 %High cutoff frequency, Hz
Wn_2k = [f_low_2k, f_high_2k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_2k,ftype); 
RTwokHz2V_raw = filtfilt(b,a,TwokHz2V_raw); %Filtered signal

figure()
plot(t,RTwokHz2V_raw)
title("Filtered Signal (2V, 2kHz)")

% Complute FFT with filtered data
RTwokHz2V_new = fft(RTwokHz2V_raw);

P2_2k_2V_new = abs(RTwokHz2V_new/N);                  %two-sided spectrum
P1_2k_2V_new = P2_2k_2V_new(1:N/2+1);               %Single-sided spectrum
P1_2k_2V_new(2:end-1) = 2*P1_2k_2V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_2k_2V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_2V_new)*1.2])
legend('Filtered Signal (2V, 2kHz)')

figure()
subplot(2,1,1);
plot(t,TwokHz2V_raw,t,RTwokHz2V_raw)
legend('Raw Signal (2V, 2kHz); Filtered Signal (2V, 2kHz)')
subplot(2,1,2); 
plot(f,P1_2k_2V_raw, f,P1_2k_2V_new)
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_2V_raw)*1.1])
legend('Raw Signal (2V, 2kHz)', 'Filtered Signal (2V, 2kHz)')

%%%%%%%%%%%%%%%%%% 2000 Hz Signal Frequency Spectrum (FFT) @ 2.5V
% Data Attributes
T = (t(10) - t(1))/9; % Sample Period
Fs = 1/T; % Sample Frequency
N = length(t); % Data length

% Complute FFT
TwokHz2p5V_raw_ff = fft(TwokHz2p5V_raw);

% Frequency vector
f = Fs*(0:(N/2))/N; 

P2_2k_2p5V_raw = abs(TwokHz2p5V_raw_ff/N);                  %two-sided spectrum
P1_2k_2p5V_raw = P2_2k_2p5V_raw(1:N/2+1);               %Single-sided spectrum
P1_2k_2p5V_raw(2:end-1) = 2*P1_2k_2p5V_raw(2:end-1);    %even-valued signal length N

%%%%%%%%%%%%%%%%%%%% 2 kHz signal with Bandpass Filter (Remove DC and Harmonics)
%highpass(y,400,Fs/2);
%y_2k_new = highpass(y,400,Fs/2);

% Butterworth Filter Transfer Function design
order = 3;
f_sample = Fs; %sample frequency
f_low_2k = 700 %Low cutoff frequency, Hz
f_high_2k = 1500 %High cutoff frequency, Hz
Wn_2k = [f_low_2k, f_high_2k]/(f_sample/2);
ftype = 'bandpass';
[b,a] = butter(order,Wn_2k,ftype); 
RTwokHz2p5V_raw = filtfilt(b,a,TwokHz2p5V_raw); %Filtered signal

figure()
plot(t,RTwokHz2p5V_raw)
title("Filtered Signal (2.5V, 2kHz)")

% Complute FFT with filtered data
RTwokHz2p5V_new = fft(RTwokHz2p5V_raw);

P2_2k_2p5V_new = abs(RTwokHz2p5V_new/N);                  %two-sided spectrum
P1_2k_2p5V_new = P2_2k_2p5V_new(1:N/2+1);               %Single-sided spectrum
P1_2k_2p5V_new(2:end-1) = 2*P1_2k_2p5V_new(2:end-1);    %even-valued signal length N

figure()
plot(f,P1_2k_2p5V_new) 
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_2p5V_new)*1.2])
legend('Filtered Signal (2p5V, 2kHz)')

figure()
subplot(2,1,1);
plot(t,TwokHz2p5V_raw,t,RTwokHz2p5V_raw)
legend('Raw Signal (2.5V, 2kHz); Filtered Signal (2.55V, 2kHz)')
subplot(2,1,2); 
plot(f,P1_2k_2p5V_raw, f,P1_2k_2p5V_new)
title("Single-Sided Amplitude Spectrum of y(t), 2kHz")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 5500])
ylim([-0.001 max(P1_2k_2p5V_raw)*1.1])
legend('Raw Signal (2p5V, 2kHz)', 'Filtered Signal (2p5V, 2kHz)')



