clear all; clc;

dt = 0.2;
t = 0:dt:10;

Nsamp = length(t);

Xbuf = zeros(Nsamp, 1);
Kbuf = zeros(Nsamp, 1);
Pbuf = zeros(Nsamp, 1);
Zbuf = zeros(Nsamp, 1);

for k = 1: Nsamp
    z = AnalogSignalSensing();
    [ADCval, P, K ]= SimpleKalman(z);

    Zbuf(k) = z;
    Xbuf(k) = ADCval;
    Pbuf(k) = P;
    Kbuf(k) = K;
end

subplot(3, 1, 1);
plot(t, Xbuf, 'o-'); hold on;grid on;
plot(t, Zbuf, 'r:*'); 
ylim([0, 10]);
xlabel('Time[sec]'); ylabel('ADCvals');legend('Kalman Filt', 'Measurements');

subplot(3, 1, 2);
plot(t, Pbuf, '--'); grid on;
legend('P');

subplot(3, 1, 3);
plot(t, Kbuf, '--'); grid on;
legend('Kalman Filt', 'Measurements');
legend('K');