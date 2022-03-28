//Danny Radosevich

#ifndef PI_H
#define PI_H
class Pi 
{
    private:
        float pi;
        float* fArr;
        int size;
    public:
        Pi(int s);
        void approxPi();
        float* getArray();
        void printBest();

};
#endif