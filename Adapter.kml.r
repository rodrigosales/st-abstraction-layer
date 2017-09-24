KmlAdapter <- setClass(

	# Set the name for the class
	"KmlAdapter"
)

#method loadKmlData
setGeneric (name = "loadKmlData",
	def = function(object, layer) {
		standardGeneric("loadKmlData")
	}
)

setMethod(f = "loadKmlData", signature = "KmlAdapter",
	definition = function(object, layer) {
		return (readOGR(object@dataSourceInfo@path, layer))
	}
)