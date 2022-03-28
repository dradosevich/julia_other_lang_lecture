#Danny Radosevich
#https://github.com/JuliaInterop/Cxx.jl

import Pkg #import package for our use

Pkg.add("Cxx") #Make sure we have Cxx
Pkg.build("Cxx") #Build it
using Cxx  #Say we're using it

cxx"""
#include <iostream>
#include <math.h>
#include <string>
using namespace std; // Sorry Dr. Buckner I know I shouldn't do this
void cpp_math(int x, int y)
{
    cout<< to_string(x+y)<<endl;
    cout<< to_string(pow(x,y))<<endl;
}
"""
cxx"""
class Uwyo
{
    public:
        string name = "University of Wyoming";
        void getName()
        {
            cout<< name<<endl;
        }
        void goPokes()
        {
            cout<<"Go Pokes!"<<endl;
        }
        void setName(string n)
        {
            name = n;
        }
    
};
"""

function cpp_in_function()
    for i = 0:4
        icxx"""
            string name = "";
            cout<<"Please enter your name"<<endl;
            cin>> name;
            cout<<endl<<"How do you do, "<<name<<endl;
        """
    end
end


#@cxx cpp_math(10,3)
#cpp_in_function()


wyo_class = @cxxnew Uwyo()
@cxx wyo_class -> goPokes()
getName() = @cxx wyo_class -> getName()
getName()
@cxx wyo_class -> setName(pointer("UWYO"))
getName()

#julia_call()