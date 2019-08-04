#! Сelsius_Fahrenheit_Kelvin
'''
Temperature converter: 
Сelsius to Fahrenheit and Kelvin
(Attention!!! Enter integers only! C and F tempratures.)
'''
print("Temperature converter: \nСelsius to Fahrenheit and Kelvin\n")
while True:
	try:
		m=int(input("Menu: 1 - Start, 2 - Exit.\n",))
		if m == 1:
			print ("Attention!!! Enter integers only! C and F tempratures.\n")
			print("C to F and K\n=============")
			c=float(input("Input C: \n",)) 
			print("C=", int(c))
			a=round((c*1.8)+32) # c*(9/5)+32, C to F
			b=round(c+273.15) # C to K
			print("F=", a)
			print("K=", b)
			print("")
			print("F to C and K\n=============")
			f=float(input("Input F: \n",))
			print("F=", int(f))
			x=round((f-32)/1.8) # (f-32)*(5/9), F to C
			z=round((f+459.67)/1.8) # (F + 459,67) / 1,8, F to K
			print("C=", x)
			print("K=", z)
			continue
		elif m == 2:
			print("Program finished!")
		break
	except ValueError:
			print("\"ValueError - Please enter integers only!\nProgram finished!\"")
	break
			
		
