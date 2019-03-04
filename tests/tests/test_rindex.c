/*
** EPITECH PROJECT, 2017
** minilibc
** File description:
** Tests rindex.
*/

#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <criterion/criterion.h>

Test(test_rindex, base)
{
    void *lib = dlopen(LIB, RTLD_LAZY);
    char *(*my_rindex)(const char *, int c) = dlsym(lib, "rindex");
    const char *str = "Hello, World!";

    cr_assert_neq(my_rindex, NULL);
    cr_assert_eq(my_rindex(str, 'l'), str + 10);
    cr_assert_eq(my_rindex(str, 'H'), str);
    cr_assert_eq(my_rindex(str, '!'), str + 12);
    cr_assert_eq(my_rindex(str, 'z'), NULL);
    dlclose(lib);
}
