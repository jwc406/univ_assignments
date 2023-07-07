import numpkg.binToHex
import numpkg.setCal
import numpkg.fibonacci

if __name__== '__main__':

	while(True): 
		num1 = int(input("Select menu: 1) b2h 2) set 3) fibo 4) exit? "))
		if num1 == 1:
			numpkg.binToHex.b2h()
		elif num1 == 2:
			numpkg.setCal.setCal()
		elif num1 == 3:
			numpkg.fibonacci.fibo()
		else:
			break
	
	print("exit the program...")
		 
		

