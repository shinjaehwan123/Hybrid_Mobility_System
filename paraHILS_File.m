clear

% caution :less than 1e-3 of Ts cause count error in encoder
Ts = 1e-2; 
encoder_scale = 1/12/4;
EncoderCutOffFreq=48.1;
%Low pass filter for Speed
num = 1;
den = [0.05 1];

G = tf(num,den);
Gd = c2d(G, Ts);

num_Gd = Gd.Num{:};
den_Gd = Gd.Den{:};

% Voltage limit
Vlim = 12; %max voltage

%Control Mode
mode=0; % 0->Elec 1->Oil 2->none

%Temp reference
OverRunning=30;
LimitMotorSpd=0.8;

% Angular speed reference
%maximum motor speed=90.83 rad/s
MapVarRes2Pwm=0.25*90.83/255;

% Controller
Kp = 10.0;
Ki = 10.0;
Kd=100;
%sim('MotorControl_HILS.slx')
batteryUpdateTime=0.1;
batteryUseRate = 0.01;
batteryChargeRate = 0.0005;
oilUseRate = 0.01;
oilChargeRate = 2;
oilUpdateTime = 0.1;