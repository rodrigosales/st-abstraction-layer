# st-abstraction-layer
R Spatiotemporal Abstraction Layer
Usage:

1. Include Classes:
* source("C:\\Users\\Rodrigo\\main.windows.r") or
* source("/home/rodrigos/main.linux.r")

2. Create a Data Source Info:
* dataSourceInfo <- FileDataSourceInfo(type = "kml", path = "/home/rodrigos/elephant_tracking_40_41.kml") or
* dataSourceInfo <- DBMSDataSourceInfo(type = "postgis", host="192.168.1.103", port="5432", dbname="sample_trajectory", username="postgres", password="postgres")

3. Create a Data Set Info:
* dataSetInfo <- DataSetInfo(spatialColumn = "obs_loc", timeColumn = "obs_date", dataColumn = "temper")

4. Create an Adapter:
* adapter <- setDataSourceInfo(Adapter(), dataSourceInfo)

5. Create a Translator:
* translator <- Translator(adapter = adapter, dataSetInfo = dataSetInfo)

6. Retrieve Data:
* track <- getTrajectory(translator, layer = "argo_profiles_geom", objectId = 46027) or
* coverage <- getCoverage(translator, layer = "argo_profiles_geom", timeframe = "2017/01/01 09:14:12")
