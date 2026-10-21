#include <stdio.h>
#include "mysql/mysql.h"

int main(int argc, char const *argv[])
{
    printf(mysql_get_client_info());
    return 0;
}
