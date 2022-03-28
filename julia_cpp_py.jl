#Danny Radosevich
#Julia with other Languages

import Pkg
Pkg.add("PyCall")
Pkg.add("Cxx")
Pkg.add("Libdl")
Pkg.build("PyCall")
Pkg.build("Cxx")
Pkg.build("Libdl")
using PyCall
using Cxx
using Libdl

const path = pwd()

addHeaderDir(path,kind=C_System)
Libdl.dlopen(joinpath(path,"libPi.so"),Libdl.RTLD_GLOBAL)
cxxinclude("pi.h")

pi_arr = @cxxnew Pi(1000)

@cxx pi_arr -> approxPi()

arr = @cxx pi_arr->getArray()

#println(unsafe_wrap(Array, arr, 1000))
arr = unsafe_wrap(Array, arr, 1000)
#print(arr)
plt = pyimport("matplotlib.pyplot")
np = pyimport("numpy")
@cxx pi_arr -> printBest()
x = np.arange(1000)
plt.scatter(x,arr)
plt.savefig("pi_plot.jpg")
