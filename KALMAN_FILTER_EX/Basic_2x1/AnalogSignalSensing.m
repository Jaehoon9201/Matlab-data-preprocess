function [z, vel_true] = AnalogSignalSensing()

    persistent vel_ pos_ 

    if isempty(pos_)
        pos_ = 0;
        vel_ = 80;
    end

    dt = 0.1;

    w = 0+10*randn;
    v = 0+10*randn;

    z = pos_ + vel_*dt +v;

    pos_ = z-v; % true pos
    vel_true = vel_+w; % true vel