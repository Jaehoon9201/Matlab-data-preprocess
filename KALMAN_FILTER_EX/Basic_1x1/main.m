clear all; clc;

dt = 0.2;
t = 0:dt:10;

Nsamp = length(t);

Xbuf = zeros(Nsamp, 1);
Zbuf = zeros(Nsamp, 1);

for k = 1: Nsamp
    z = AnalogSignalSensing();
    ADCval = SimpleKalman(z);

    Zbuf(k) = z;
    Xbuf(k) = ADCval;

end

figure
plot(t, Xbuf, 'o-'); hold on;
plot(t, Zbuf, 'r:*');
xlabel('Time[sec]'); ylabel('ADCvals');legend('Kalman Filt', 'Measurements');