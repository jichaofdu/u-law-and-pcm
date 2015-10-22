t = 0:0.0001:2*pi;
y = cos(t);
z1 = u_pcm(y,64);
z2 = ula_pcm(y,64,255);
plot(t,y,'green',t,z1,'blue',t,z2,'red');