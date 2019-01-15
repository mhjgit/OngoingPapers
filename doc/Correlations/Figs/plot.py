#!/usr/bin/python
from numpy import *
from pylab import *
from matplotlib import rc, rcParams
import matplotlib.units as units
import matplotlib.ticker as ticker
import sys
import os


rc('text',usetex=True)
rc('font',**{'family':'serif','serif':['New fits of nuclear forces']})

data = loadtxt("f72.dat")

l = len(data[:,0])

axis([39,61,-41, -24])
xlabel(r'$A$',fontsize=20)
ylabel(r'$\epsilon_{f_{7/2}}$',fontsize=20)
plot(data[:,0], data[:,1],'b-*', data[:,0], data[:,1]+data[:,2],'r:.', data[:,0], data[:,4], 'm:v',markersize=7)

#title(r'Proton single-particle energies for $A=40-60$', fontsize=20, horizontalalignment='center')
legend(('Central','Central+Spin-orbit','All terms'),
           'upper right', shadow=False, fancybox=False,prop={"size":18})
legend(loc='upper right')

xticks( [40,42,44,46,48,50,52,54,56,58,60])
# Save the figure in a separate file
savefig('protonf72.pdf', format='pdf')
# Draw the plot to screen
show()
