def splitter(val):
	print 'va',val
	if ' ' in val:
		print '??',val(' ')
def reverse(a):
	if len(a) <= 25:
		x = splitter(a)		
		x = filter(None,a.split('.')[0].split(' '))
		val = '%s.' %' '.join(map(lambda y: x[y] if y % 2 == 0 else x[y][::-1],range(len(x))))
		# for i in range(len(x)):
		# 	if i % 2 == 0:
		# 		va+=x[i]+' '
		# 	else:
		# 		va+=x[i][::-1] +' '
		print 'val',val		
	else:
		print 'Your input Reached 15 character limit!'
				
if __name__ == '__main__':
	a = "Please Enter Your Word:"
	reverse(a)



# def reverse(a):
# 	if len(a) <= 15:		
# 		x = filter(None,a.split('.')[0].split(' '))
# 		val = '%s.' %' '.join(map(lambda y: x[y] if y % 2 == 0 else x[y][::-1],range(len(x))))
# 		# for i in range(len(x)):
# 		# 	if i % 2 == 0:
# 		# 		va+=x[i]+' '
# 		# 	else:
# 		# 		va+=x[i][::-1] +' '
# 		print 'val',val		
# 	else:
# 		print 'Your input Reached 15 character limit!'
				
# if __name__ == '__main__':
# 	a = raw_input("Please Enter Your Word:")
# 	reverse(a)


# def reverse(a):
# 	if len(a) <= 15:		
# 		x = filter(None,a.split('.')[0].split(' '))
# 		print '%s.' %' '.join(map(lambda y: x[y] if y % 2 == 0 else x[y][::-1],range(len(x))))		
# 	else:
# 		print 'Your input Reached 15 character limit!'
				
# if __name__ == '__main__':
# 	a = raw_input("Please Enter Your Word:")
# 	reverse(a)