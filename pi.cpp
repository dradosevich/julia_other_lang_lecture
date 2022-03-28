#include "pi.h"
#include <iostream>

using namespace std; 

Pi::Pi(int s)
{
    pi = 0;
    size = s;
    fArr = new float[s];
} 
void Pi::approxPi()
{
    for(int i = 0; i < size; i++)
    {
        if(i%2==0)
        {
            pi += 1/(2.0*i+1.0);
        }
        else
        {
           pi -= 1/(2.0*i+1.0);
        }
        
        fArr[i] = pi*4;
        //cout<<fArr[i]<<"\t";
        //if(i%5==0) cout<<endl;

    }
    cout<<endl;
}

float* Pi::getArray()
{
    return fArr;
}

void Pi::printBest()
{
    cout<<fArr[size-1]<<endl;
}