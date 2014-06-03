#ifndef __METAL_API_H__
#define __METAL_API_H__

//
// Initialisation

/**
 * Initialize metal
 */
int mt_init();

//
// Memory

//
// Objects

/**
 * Initalize a previous allocated object
 */
void mt_obj_init(mt_obj_t *obj, mt_meta_t *meta);

void mt_obj_ref(void *obj);
void mt_obj_unref(void *obj);

#endif