import matplotlib.pyplot as plt

plt.plot([1 / 6 * 100, 1 / 3 * 100, 2 / 3 * 100, 1 / 3 * 100, 2 / 3 * 100, 1 * 100],
         [307, 607, 1049, 2326, 18180, 32529])
plt.xlabel('percentage of correctly found keyword symbols')
plt.ylabel('message length')
plt.show()

plt.plot([1 / 3 * 100, 2 / 3 * 100, 3 / 4 * 100, 4 / 5 * 100, 5 / 8 * 100, 3 / 5 * 100, 8 / 11 * 100],
         [3, 3, 4, 5, 8, 10, 11])
plt.xlabel('percentage of correctly found keyword symbols')
plt.ylabel('keyword length')
plt.show()
