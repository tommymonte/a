        .data
v1:    	.double		8.90, 9.12, 10.23, 11.34, 12.45, 13.56, 14.67, 58.56
		.double		15.78, 16.89, 17.90, 18.12, 19.23, 20.34, 21.45, 59.67
        .double     36.12, 37.23, 38.34, 39.45, 40.56, 41.67, 42.78, 62.90
		.double		43.89, 44.90, 45.12, 46.23, 47.34, 48.45, 49.56, 63.12  

v2:     .double		8.90, 9.12, 10.23, 11.34, 12.45, 13.56, 14.67, 58.56
		.double		15.78, 16.89, 17.90, 18.12, 19.23, 20.34, 21.45, 59.67
        .double     36.12, 37.23, 38.34, 39.45, 40.56, 41.67, 42.78, 62.90
		.double		43.89, 44.90, 45.12, 46.23, 47.34, 48.45, 49.56, 63.12  
   
v3:     .double		8.90, 9.12, 10.23, 11.34, 12.45, 13.56, 14.67, 58.56
		.double		15.78, 16.89, 17.90, 18.12, 19.23, 20.34, 21.45, 59.67
        .double     36.12, 37.23, 38.34, 39.45, 40.56, 41.67, 42.78, 62.90
		.double		43.89, 44.90, 45.12, 46.23, 47.34, 48.45, 49.56, 63.12  
     
v4:     .space 256
v5:     .space 256
v6:     .space 256


.text
main: 
    daddi R1, R0, 31 # index for loop

loop: 
    bne R1, R0, END
    l.d f1, v1(R1)
    l.d f2, v2(R1)
    l.d f3, v3(R1)

    j FORLOOP

FORLOOP:
FORLOOP:
    mul.d f4 f1 f1 # store the v1[i]*v1[i]
    sub.d f5 f4 f2 # store in f5 the sub aka v4[i]
    div.d f6 f5 f3 # div between v4[i]/v3[i]
    sub.d f7 f6 f2 # store in f7 v5[i]
    sub.d f8 f5 f1 # v4[i]-v1[i]
    mul.d f9 f8 f7 

STORE:
    s.d f5, v4[R1]
    s.d f7, v5[R1]
    s.d f9, v6[R1]

    daddi R1, R1, -1
    j loop

END:
    HALT
