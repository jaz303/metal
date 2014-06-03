#ifndef __META_INTERNAL_H__
#define __META_INTERNAL_H__

#include "metal/metal.h"

#include <pthread.h>

// Memory pool associated with each thread
extern pthread_key_t mt_tk_mem_pool;

#endif