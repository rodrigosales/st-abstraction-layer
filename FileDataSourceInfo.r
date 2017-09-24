FileDataSourceInfo <- setClass(

	# Set the name for the class
	"FileDataSourceInfo",
	
	# Define the attributes
	slots = c(
		path = "character"
	),
	
	# Set default value for attributes
	prototype = list(
		path = NA_character_
	),
	
	# validate the slots
	validity = function(object) {
	
		if (object@path == ""){
			return("If source type is File, you must provide a file path (path)")
		}
	
		return(TRUE)
	},
	
	# inherit class DataSourceInfo
	contains = "DataSourceInfo"
)