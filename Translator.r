Translator <- setClass(
	
	# Set the name for the class
	"Translator",
	
	# Define the attributes
	slots = c(
		adapter = "Adapter",
		dataSetInfo = "DataSetInfo"
	)

)

# method getTrajectory
setGeneric (name="getTrajectory",
	def = function (object, layer, objectId) {
		standardGeneric("getTrajectory")
	}
)

setMethod (f = "getTrajectory", signature = "Translator",
	definition = function (object, layer, objectId) {
		rawData = loadData(object@adapter, layer = layer)
		
		spatialColumn = dataSetInfo@spatialColumn
		timeColumn = dataSetInfo@timeColumn
		dataColumn = dataSetInfo@dataColumn
		objectIdColumn = dataSetInfo@objectIdColumn
		
		filteredData = rawData[rawData[[objectIdColumn]] == objectId,]
		
		spValues <- SpatialPoints(filteredData@coords)
		
		timeValues = xts( 1:length(spValues),as.POSIXct(filteredData[[timeColumn]]))
		
		IDs = paste("ID",1:length(spValues))
		dataValues = filteredData[[dataColumn]]
		dataValues = data.frame(values = dataValues, ID=IDs)
		
		stidf <- STIDF (spValues, timeValues, dataValues)

		track <- Track(stidf)		
		
		return (track)
	}
)

# method getCoverage
setGeneric (name="getCoverage",
	def = function (object, layer, timeframe) {
		standardGeneric("getCoverage")
	}
)

setMethod (f = "getCoverage", signature = "Translator",
	definition = function (object, layer, timeframe) {
		rawData = loadData(object@adapter, layer = layer)
		
		spatialColumn = dataSetInfo@spatialColumn
		timeColumn = dataSetInfo@timeColumn
		dataColumn = dataSetInfo@dataColumn
		
		filteredData = rawData[rawData[[timeColumn]] == timeframe,]
		
		spValues <- SpatialPoints(filteredData@coords)
		
		timeValues = xts( 1:length(spValues),as.POSIXct(filteredData[[timeColumn]]))
		
		IDs = paste("ID",1:length(spValues))
		dataValues = filteredData[[dataColumn]]
		dataValues = data.frame(values = dataValues, ID=IDs)
		
		stidf <- STIDF (spValues, timeValues, dataValues)
		
		return (stidf)
	}
)