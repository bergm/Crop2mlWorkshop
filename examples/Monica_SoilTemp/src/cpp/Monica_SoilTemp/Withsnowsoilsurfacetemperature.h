#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
#include <vector>
#include <string>
#include "SoiltemperatureState.h"
#include "SoiltemperatureRate.h"
#include "SoiltemperatureAuxiliary.h"
#include "SoiltemperatureExogenous.h"
using namespace std;
class Withsnowsoilsurfacetemperature
{
    private:
    public:
        Withsnowsoilsurfacetemperature();
        void  Calculate_Model(SoiltemperatureState& s, SoiltemperatureState& s1, SoiltemperatureRate& r, SoiltemperatureAuxiliary& a, SoiltemperatureExogenous& ex);
        void  Init(SoiltemperatureState& s,SoiltemperatureState& s1, SoiltemperatureRate& r, SoiltemperatureAuxiliary& a, SoiltemperatureExogenous& ex);

};