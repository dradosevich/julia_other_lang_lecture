#Danny Radosevich

import Pkg #import Pkg so that we can use it
Pkg.add("PyCall") #Add the the package
Pkg.build("PyCall") #Build/rebuild our stuff
using PyCall #Make sure we are using 
#https://github.com/JuliaPy/PyCall.jl

function python_imports_pi()
    math = pyimport("math")
    println(math.pi)
end

function python_imports_plt()
    plt = pyimport("matplotlib.pyplot")
    x = range(0;stop=2*pi,length=1000); y = sin.(3*x + 4*cos.(2*x));
    plt.plot(x, y, color="red", linewidth=2.0, linestyle="--")
    plt.savefig("plot.jpg")
end

function py_with()
    @pywith pybuiltin("open")("example.txt","w") as f begin
        f.write("Hello everyone!")
        f.close()
    end
end

py"""
def example_print():
    examp = open("example.txt")
    examp = examp.read()
    print(examp)
    
"""

#python_imports_pi()
#python_imports_plt()
#py_with()
#py"example_print"()
@pyinclude("python_for_julia.py")