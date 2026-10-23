#include <stdio.h>
#include <stdlib.h>

#include <openssl/evp.h>
#include <openssl/rsa.h>
#include <openssl/bn.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <openssl/core_names.h>
#include <openssl/param_build.h>

int main(int argc, char const *argv[])
{
    if (argc != 4) {
        printf("Usage: ./gen_rsa_file FILE_PATH PUBLIC_KEY_PATH OUTPUT_FILE_NAME");
    }

    FILE* original_file = fopen(agrv[1], "rb");
    FILE* publickey_file = fopen(agrv[2], "rb");
    FILE* output_file = fopen(agrv[3], "wb");

    if (original_file == NULL || publickey_file == NULL) {
        printf("Error!\n");
        return -1;
    }
    

    EVP_PKEY *pub_key = PEM_read_PUBKEY(publickey_file, NULL, NULL, NULL);

    EVP_PKEY_CTX *ctx = EVP_PKEY_CTX_new(pub_key, NULL);

    fclose(original_file);
    fclose(publickey_file);
    fclose(output_file);

    return 0;
}
