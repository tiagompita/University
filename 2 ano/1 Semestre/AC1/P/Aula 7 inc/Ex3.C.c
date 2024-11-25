char *strcpy(char *dst, char *src)
{
    char *p = dst;
    do
    {
        *p++ = *src;
    } while (*src++ != '\0');
    return dst;
}