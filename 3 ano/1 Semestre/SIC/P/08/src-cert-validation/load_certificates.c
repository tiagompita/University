#include <stdio.h>
#include <dirent.h>

#include <sys/stat.h>
#include <sys/param.h>

#include <openssl/x509.h>

#include "load_certificate.h"
#include "valid_certificate.h"

#include "load_certificates.h"

X509 **
load_certificates( const char * directory, int * len )
{
    DIR * dirp;
    X509 ** result = malloc( sizeof(X509 *) );
    struct dirent * entry;
    struct stat info;
    X509 * cert;
    char path[MAXPATHLEN];
    int dir_len = strlen( directory );

    strcpy( path, directory );
    if (path[dir_len - 1] != '/') {
        path[dir_len] = '/';
	path[dir_len + 1] = 0;
	dir_len++;
    }

    dirp = opendir( directory );

    if (dirp == 0) return 0;

    for (*len = 0;;) {
        entry = readdir( dirp );
	if (entry == 0) {
	    break;
	}

	strcpy( path + dir_len, entry->d_name );
	// printf( "%s\n", path );

	lstat( path, &info ); // Use lstat to follow symbolic links
	if (!(info.st_mode & S_IFMT)) { // Not a regular file
	    continue;
	}

// TODO - add your code here
// until here
    }

    closedir( dirp );

    result[*len] = 0;

    return result;
}
