#class TwoVariablesObject { 
# Object var0
# Object var1
#}

def vm_getivar(cache, obj)
  if cache.id == obj.getMetaClass().getRealClass().id 
    obj[cache.index]
  else 
    # slow path
  end
end
