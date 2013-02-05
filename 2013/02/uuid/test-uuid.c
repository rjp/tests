#include <stdio.h>
#include <uuid/uuid.h>

int main(void)
{
    uuid_t test;
    uuid_string_t out;

    uuid_generate_time(test);
    uuid_unparse_lower(test, out);
    printf("UUID=%s\n", out);
}
