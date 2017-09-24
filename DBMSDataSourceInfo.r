DBMSDataSourceInfo <- setClass(

	# Set the name for the class
	"DBMSDataSourceInfo",
	
	# Define the attributes
	slots = c(
		host = "character",
		port = "character",
		dbname = "character",
		username = "character",
		password = "character"
	),
	
	# Set default value for attributes
	prototype = list(
		host = NA_character_,
		port = NA_character_,
		dbname = NA_character_,
		username = NA_character_,
		password = NA_character_
	),
	
	# validate the slots
	validity = function(object) {
	
		if (is.na(object@host)){
			return("If source type is DBMS, you must provide a database host (dbhost)")
		}
		
		if (is.na(object@port)){
			return("If source type is DBMS, you must provide a database port (dbport)")
		}
		
		if (is.na(object@dbname)){
			return("If source type is DBMS, you must provide a database name (dbname)")
		}
		
		if (is.na(object@username)){
			return("If source type is DBMS, you must provide a database username (username)")
		}
		
		if (is.na(object@password)){
			return("If source type is DBMS, you must provide a database password (password)")
		}
		
		return(TRUE)
	},
	
	# inherit class DataSourceInfo
	contains = "DataSourceInfo"
)