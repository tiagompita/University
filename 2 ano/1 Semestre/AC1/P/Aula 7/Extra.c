#include <stdio.h>

int insert(int *array, int value, int pos, int size);
void print_array(int *a, int n);
void print_string(const char *str);
int read_int();
void print_int10(int num);

int main(void)
{
    static int array[50];
    int i, array_size, insert_value, insert_pos;

    print_string("Size of array : ");
    array_size = read_int();

    for(i = 0; i < array_size; i++)
    {
        print_string("array[");
        print_int10(i);
        print_string("] = ");
        array[i] = read_int();
    }

    print_string("Enter the value to be inserted: ");
    insert_value = read_int();

    print_string("Enter the position: ");
    insert_pos = read_int();

    print_string("\nOriginal array: ");
    print_array(array, array_size);

    insert(array, insert_value, insert_pos, array_size);

    print_string("\nModified array: ");
    print_array(array, array_size + 1);

    return 0;
}

int insert(int *array, int value, int pos, int size)
{
    int i;
    if(pos > size)
        return 1;
    else
    {
        for(i = size - 1; i >= pos; i--)
            array[i + 1] = array[i];
        array[pos] = value;
        return 0;
    }
}

void print_array(int *a, int n)
{
    int *p = a + n;
    for(; a < p; a++)
    {
        print_int10(*a);
        print_string(", ");
    }
}

void print_string(const char *str)
{
    printf("%s", str);
}

int read_int()
{
    int num;
    scanf("%d", &num);
    return num;
}

void print_int10(int num)
{
    printf("%d", num);
}