# Try running this program.
# Then change it to generate another subplot with the product of y1 and y2.

import numpy as np
import matplotlib.pyplot as plt

plt.figure(1)

t = np.arange(0.0, 5.0, 0.1)  # try printing t
print(t)
plt.subplot(2, 1, 1)
y1 = np.exp(-t)
plt.plot(t, y1, 'b')  # try 'g' or 'bo' or 'k+'

plt.subplot(2, 1, 2)
y2 = np.cos(2*np.pi*t)
plt.plot(t, y2, 'ro-')


plt.subplot(2, 3, 1)
y3 = y1*y2
plt.plot(t, y3, 'g-')

plt.show()

