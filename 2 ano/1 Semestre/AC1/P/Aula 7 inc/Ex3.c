char *strcpy(char *dst, char *src)
{
    int i = 0;
    do
    {
        dst[i] = src[i];
    } while (src[i++] != '\0');
    return dst;
}