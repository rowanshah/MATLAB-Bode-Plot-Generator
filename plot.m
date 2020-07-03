PlotWindowSize = [1400,600]; % plot window size in pixels
figure('Position',[10 10 PlotWindowSize(1) PlotWindowSize(2)])
N=[]; X=[]; Y=[]; x=10^-2; % initialize variables
while x < 10^8, % repeat for values of x start : increment : end
s = i*x; % get the j-omega
% ***************** THE EQUATION: ***************************************************
y = (10000+s) / (50+s);
X = [X,x]; N = [N,y]; % form matrices for X and complex Y values
x = x*1.05; % controls the resolution of the plots
end % end of "while" statements
% **************** THE AMPLITUDE PLOT ************************************************
Y = 20*log10(abs(N)); % get the Y-matrix in dB
semilogx(X,Y); % variables to plot
set(gca,'FontSize',16)
grid on % make the grid visible
xlimits = get(gca,'Xlim');
ylimits = get(gca,'Ylim');
ylimits = [ylimits(1),ylimits(2)+10]; % add 10 dB headroom to the graph
set(gca,'Ylim',ylimits); % set the new y-limit
yinc = 20; % y-axis increments are 20 dB
set(gca,'Xtick',[10^-2 10^-1 10^0 10^1 10^2 10^3 10^4 10^5 10^6 10^7 10^8])
set(gca,'Ytick',[ylimits(1):yinc:ylimits(2)])
title('Bode Amplitude Plot','FontSize',18,'Color',[0 0 0])
xlabel('Frequency [rad/sec]','FontSize',16, 'Color',[0 0 0])
ylabel('Amplitude [dB]','FontSize',16, 'Color',[0 0 0])
% ************* THE PHASE PLOT ******************************************************
figure('Position',[10 60 PlotWindowSize(1) PlotWindowSize(2)])
Y = angle(N)*180/pi; % get the angles of the complex matrix in degrees
semilogx(X,Y); % variables to plot
set(gca,'FontSize',16)
grid on % make the grid visible
xlimits = get(gca,'Xlim');
ylimits = get(gca,'Ylim');
testY = fix(ylimits(1)/45); % series of steps to make y-axis label values
if testY < 0 % to be multiples of 45 degrees.
 testY = testY - 1;
else
 testY = testY + 1;
end
ylimits = [testY*45,ylimits(2)+20]; % add 10 dB headroom to the graph
set(gca,'Ylim',ylimits); % set the new y-limit
yinc = 45; % y-axis increments are 45°
set(gca,'Xtick',[10^-2 10^-1 10^0 10^1 10^2 10^3 10^4 10^5 10^6 10^7 10^8])
set(gca,'Ytick',[ylimits(1):yinc:ylimits(2)])
title('Bode Phase Plot','FontSize',18,'Color',[0 0 0])
xlabel('Frequency [rad/sec]','FontSize',16, 'Color',[0 0 0])
ylabel('Phase Angle [degrees]','FontSize',16, 'Color',[0 0 0])