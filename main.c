#include <stdio.h>
#include <string.h>

int main(void)
{
    char *str = strdup("hello\n");

    // printf("len: %d\n", my_strlen("hello"));
    // printf("from chr: %s", my_strchr("hello?", 'l'));
    // printf("from rindex: %s", my_rindex("hello!", 'l'));
    printf("str before memset: %s", str);
    printf("str after memset: %s", my_memset(str, 'h', 5));
    return (0);
}
