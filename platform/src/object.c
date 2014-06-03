#include "metal/internal.h"

void mt_obj_init(mt_obj_t *obj, mt_meta_t *meta) {
	obj->meta = meta;
	obj->ref_count = 1;
}

void mt_obj_ref(void *obj) {
	mt_obj_t *mobj = (mt_obj_t*)obj;
	mobj->ref_count++;
}

void mt_obj_unref(void *obj) {
	mt_obj_t *mobj = (mt_obj_t*)obj;
	if (--mobj->ref_count == 0) {
		mobj->meta->free(mobj);
	}
}