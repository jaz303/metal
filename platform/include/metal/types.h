#ifndef __METAL_TYPES_H__
#define __METAL_TYPES_H__

typedef struct mt_obj mt_obj_t;

typedef void (*mt_obj_free_f)(mt_obj_t *obj);

typedef struct mt_pool {
	int 				something;
} mt_pool_t;

typedef struct mt_thread_local {
	int 				something;
} mt_thread_local_t;

typedef struct mt_meta {
	mt_obj_free_f		free;
} mt_meta_t;

struct mt_obj {
	mt_meta_t			*meta;
	int					ref_count;
};

#endif