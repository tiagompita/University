#ifndef __DIGEST_FILE_H__
#define __DIGEST_FILE_H__

#include "digest_file.h"

int digest_file( int fd, EVP_MD * digest_func, uint8_t * digest );

#endif // __DIGEST_FILE_H__
