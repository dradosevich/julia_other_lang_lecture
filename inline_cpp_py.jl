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

cxx"""
#include<iostream>
#include<string>
using namespace std;
class Pi
{
    private:
        float pi;
        float* fArr;
        int size;
    public:
        Pi(int s)
        {
            pi = 0;
            size = s;
            fArr = new float[s];
        }
        void approxPi()
        {
            //cout<<"Approx"<<endl;
            for(int i = 0; i < size; i++)
            {
                if (i %2 == 0)
                {
                    pi += (1.0/(2.0*1+1.0));
                }   
                else
                {
                    pi -= (1.0/(2.0*1+1.0));
                }
                cout<<to_string(pi*4.0)<<endl;
                fArr[i] = pi*4.0;
            }
        }
        float* getArray()
        {
            return fArr;
        }
};
"""

pi_arr = @cxxnew Pi(20)
@cxx pi_arr -> approxPi()

arr = @cxx pi_arr->getArray()
println(arr)
println(unsafe_wrap(Array, arr, 20))