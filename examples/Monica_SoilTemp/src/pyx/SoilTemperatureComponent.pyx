from datetime import datetime
from math import *
from Monica_SoilTemp.soiltemperature import model_soiltemperature
from Monica_SoilTemp.nosnowsoilsurfacetemperature import model_nosnowsoilsurfacetemperature
from Monica_SoilTemp.withsnowsoilsurfacetemperature import model_withsnowsoilsurfacetemperature
def model_soiltemperature(float tmin,
      float tmax,
      float globrad,
      float dampingFactor,
      float soilCoverage,
      float prevDaySoilSurfaceTemperature,
      float soilSurfaceTemperatureBelowSnow,
      bool hasSnowCover,
      float timeStep,
      float soilMoistureConst,
      float baseTemp,
      float initialSurfaceTemp,
      float densityAir,
      float specificHeatCapacityAir,
      float densityHumus,
      float specificHeatCapacityHumus,
      float densityWater,
      float specificHeatCapacityWater,
      float quartzRawDensity,
      float specificHeatCapacityQuartz,
      float nTau,
      float soilAlbedo,
      int noOfTempLayers,
      int noOfSoilLayers,
      floatlist layerThickness,
      floatlist soilBulkDensity,
      floatlist saturation,
      floatlist soilOrganicMatter,
      floatlist prevDaySoilTemperature,
      floatlist V,
      floatlist B,
      floatlist volumeMatrix,
      floatlist volumeMatrixOld,
      floatlist matrixPrimaryDiagonal,
      floatlist matrixSecondaryDiagonal,
      floatlist heatConductivity,
      floatlist heatConductivityMean,
      floatlist heatCapacity,
      floatlist solution,
      floatlist matrixDiagonal,
      floatlist matrixLowerTriangle,
      floatlist heatFlow):
    cdef float soilSurfaceTemperature
    cdef floatlist soilTemperature
    cdef floatlist newSoilTemperature
    cdef float noSnowSoilSurfaceTemperature
    soilTemperature = prevDaySoilTemperature 
    soilSurfaceTemperature = model_nosnowsoilsurfacetemperature( tmin,tmax,globrad,soilCoverage,dampingFactor,prevDaySoilSurfaceTemperature)
    noSnowSoilSurfaceTemperature = soilSurfaceTemperature
    soilSurfaceTemperature = model_withsnowsoilsurfacetemperature( noSnowSoilSurfaceTemperature,soilSurfaceTemperatureBelowSnow,hasSnowCover)
    newSoilTemperature = model_soiltemperature( soilSurfaceTemperature,timeStep,soilMoistureConst,baseTemp,initialSurfaceTemp,densityAir,specificHeatCapacityAir,densityHumus,specificHeatCapacityHumus,densityWater,specificHeatCapacityWater,quartzRawDensity,specificHeatCapacityQuartz,nTau,soilAlbedo,noOfTempLayers,noOfSoilLayers,layerThickness,soilBulkDensity,saturation,soilOrganicMatter,soilTemperature,V,B,volumeMatrix,volumeMatrixOld,matrixPrimaryDiagonal,matrixSecondaryDiagonal,heatConductivity,heatConductivityMean,heatCapacity,solution,matrixDiagonal,matrixLowerTriangle,heatFlow)
    newSoilTemperature = soilTemperature 

    return soilSurfaceTemperature, soilTemperature