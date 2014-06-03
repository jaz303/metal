#include "metal/internal.h"

pthread_key_t mt_tk_mem_pool;

int mt_init() {

	pthread_key_create(&mt_tk_mem_pool, NULL);

	return 0;

}