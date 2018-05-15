%% -- Field after rotated retarder
waveplate_angle = 45;

[Ex, Ey] = rot_retard(                   ... %
            1,        ... % Ex
            0,        ... % Ey
            waveplate_angle.*pi/180, ... % Rotation angle
            pi/2             ... % Phase Retardance
          );
 
R = @(th) [cos(th) -sin(th);  sin(th) cos(th)];

E_rot =  R(waveplate_angle*pi/180)*[Ex, Ey]';
Ex = E_rot(1);
Ey = E_rot(2);

      
% disp([Ex, Ey])

vectarrow([0 0], real([Ex, Ey]), 'red')
hold on
vectarrow([0 0], imag([Ex, Ey]), 'blue')

xlim([-1 1])
ylim([-1 1])
title(['Laukas už \pi/2 plokštel?s, pasuktos ' num2str(waveplate_angle) '°'])



% Plot ellipse 
a = real([Ex, Ey]);
b = imag([Ex, Ey]);

if norm(a) > norm(b)
    ellipse_oriantation = atan2(a(2), a(1));
else
    ellipse_oriantation = atan2(b(2), b(1));
end

phi = linspace(0, 2*pi, 300);
x = real(Ex*exp(1i.*phi));
y = real(Ey*exp(1i.*phi));
hold on
plot(x, y);

pbaspect([1 1 1])
% x = norm(a).*cos(phi);
% y = norm(b).*cos(phi);


