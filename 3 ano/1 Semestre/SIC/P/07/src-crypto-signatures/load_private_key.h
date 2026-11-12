#ifndef __LOAD_PRIVATE_KEY_H__
#define __LOAD_PRIVATE_KEY_H__

#include "load_private_key.h"

EVP_PKEY * load_private_key( const char * path, const char * type );

#endif // __LOAD_PRIVATE_KEY_H__
