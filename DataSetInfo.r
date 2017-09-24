DataSetInfo <- setClass(

	# Set the name for the class
	"DataSetInfo",
	
	# Define the attributes
	slots = c(
		spatialColumn = "character",
		timeColumn = "character",
		dataColumn = "character",
		objectIdColumn = "character"
	)
)