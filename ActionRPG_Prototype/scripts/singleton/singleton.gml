///@arg object

var _object = argument[0];

// If the object already exists, return its id
if (instance_exists(_object))
{
	return _object.id;
}
// If it doesn't exist, create it
else
{
	// Create the object
	var _instance = instance_create_layer(0, 0, "Instances", _object);
	
	// Set to persistent
	_instance.persistent = true;
	
	// Return the instance
	return _instance;
}