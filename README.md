# FIR Implementation:
Used 2 flip flops to retain previous input values. Multiply operation is implemented by a seprate module.
![image](https://user-images.githubusercontent.com/57820377/144718705-7d8a4195-7b16-41a9-8974-3c385f23ad63.png)

Waveform:
8 bit wide of variables with last 4 bits are for decimals. 
a = 0.5, b=-1.5, c=2.
xn-2=-5, xn-1 = -4, xn=-3.
At 5th clock edge output of FIR = -5.5

![image](https://user-images.githubusercontent.com/57820377/144718602-225af7bd-3581-4c27-a0ea-9c34b86053b2.png)

# IIR Implementation:
![image](https://user-images.githubusercontent.com/57820377/144718757-79a05ff2-4317-4715-906a-42fe07a8c0ba.png)

- Output values are retained using flip flops.

Waveform:
+ a = 0.5 ('b0000.1000)
+ b = -1.5 ('b1110.0111)
+ c = 2 ('b0010.0000)
+ d = -1 ('b1111.0000)
- At 3rd clock cycle: x=1 ('b0001.0000) => y = a*x + b*0 + c*0 + d*0 = 0.5*1 = 0.5 ('b0000.1000)
- At 4th clock cycle: x=2 ('b0010.0000) => y = a*x + b*x1 + c*y1 + d*0 = 0.5*2 + (-1.5)*1 + 2*0.5= 0.5 ('b0000.1000)
- At 5th clock cycle: x=3 ('b0011.0000) => y = a*x + b*x1 + c*y1 + d*y2 = 0.5*3 + (-1.5)*2 + 2*0.5 + (-1*0.5)= -1 ('b1111.0000)

![image](https://user-images.githubusercontent.com/57820377/144723275-8b7edb8c-e6c2-474e-b817-8f53139e04d2.png)
