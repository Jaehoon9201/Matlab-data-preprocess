clear all; clc;

dt = 0.2;
t = 0:dt:10;

Nsamp = length(t);

Xbuf = zeros(Nsamp, 2);
Zbuf = zeros(Nsamp, 1);
VelTrue_buf = zeros(Nsamp, 1);

for k = 1: Nsamp
    [z, vel_true] = AnalogSignalSensing();  % pos sensing

    [pos, vel] = SimpleKalman(z); 
    % pos : from measured
    % vel: from estimated. equal to the derivatives of x1.

    Zbuf(k) = z;
    Xbuf(k, :) = [pos vel];
    VelTrue_buf(k, :) = vel_true;
end

subplot(2,1,1);
plot(t, Xbuf(:,1), 'b--'); grid on; hold on;
plot(t, Zbuf, 'r--');
xlabel('Time[sec]'); ylabel('Pos');legend('Kalman Filt Pos', 'Measured Pos');

subplot(2,1,2);
plot(t, Xbuf(:,2), 'b--'); grid on; hold on;
plot(t, VelTrue_buf, 'r--');legend('Kalman Filt Vel(est)', 'Real Vel');