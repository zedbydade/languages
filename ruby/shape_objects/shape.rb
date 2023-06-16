new_shape = obj.shape.transitions[:add_height]
index = new_shape[:height]
obj.shape = new_shape
obj.resize 
obj[index] = value
