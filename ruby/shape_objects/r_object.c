struct RObject {
  VALUE klass;
  int numiv; 
  VALUE[] ivptr;
};

struct RClass {
  struct st_table *iv_index_tbl; // Hash of symbol -> index
}

VALUE vm_getivar(VALUE obj, IVC inline_cache) {
  if (inline_cache && inline_cache->class_serial == obj->klass->class_serial) {
    int index = inline_cache->index; 
    if (obj-> type == T_OBJECT) && index < obj->numiv) {
      return obj->ivptr[index];
    } else {
      // slow path
    }
  } else {
    // slow path
  }
}

VALUE vm_setivar(VALUE obj, VALUE val, IVC inline_cache) {
  if (inline_cache && inline_cache->class_serial == obj->klass->class_serial) {
    int index = inline_cache->index; 
    if (obj->type == T_OBJECT) && index < obj->numiv) {
      obj->ivptr[index] = val;
    } else {
      // slow path
    } 
  } else {
    // slow path
  }
}
