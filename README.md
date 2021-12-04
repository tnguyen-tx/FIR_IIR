# FIR Implementation:
Used 2 flip flops to retain previous input values. Multiply operation is implemented by a seprate module.
![image](https://user-images.githubusercontent.com/57820377/144718705-7d8a4195-7b16-41a9-8974-3c385f23ad63.png)

Waveform:
8 bit wide of variables with last 4 bits are for decimals. 
a = 0.5, b=-1.5, c=2.
xn-2=-5, xn-1 = -4, xn=-3.
At 4th clock edge output of FIR = -5.5

![image](https://user-images.githubusercontent.com/57820377/144718602-225af7bd-3581-4c27-a0ea-9c34b86053b2.png)
