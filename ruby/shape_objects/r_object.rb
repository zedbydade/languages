def vm_getivar(cache, obj) 
  if cache.serial == obj.klass.serial && cache.index < obj.numiv 
    obj.ivptr[cache.index]
  else 
    # slow path 
  end
end

def vm_setivar(cache, obj, val)
  if cache.serial == obj.klass.serial && cache.index < obj.numiv 
    obj.ivptr[cache.index] = val 
  else 
    # slow path
  end
end
