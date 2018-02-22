import string
import random


password = ''.join([
    random.choice(string.ascii_letters + string.digits) for i in range(10)])
print(password)
