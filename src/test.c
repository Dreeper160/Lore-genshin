#include <stdio.h>
#include <stdlib.h>
#include "mysql/mysql.h"

void nombre_entite(MYSQL *conn)
{
    char query[1024];
    int len = snprintf(query, sizeof(query),
                       "SELECT count(id) FROM entite");

    if (mysql_real_query(conn, query, len) != 0)
    {
        fprintf(stderr, "Unable to execute the query (%d) : %s", mysql_errno(conn), mysql_error(conn));
        return;
    }
    MYSQL_RES *result = mysql_store_result(conn);
    if (result == NULL)
    {
        if (mysql_field_count(conn) > 0)
        {
            fprintf(stderr, "Error during query : (%d) %s\n", mysql_errno(conn), mysql_error(conn));
        }
        else
        {
            printf("Query excecuted with success (none line return).\n");
        }
        return;
    }
    MYSQL_ROW line;

    while ((line = mysql_fetch_row(result)))
    {
        printf("entity Number : %s", line[0]);
    }
}

int main(void)
{
    const char *mot_de_passe = getenv("GENSHINLORE_PASSWORD");
    if (mot_de_passe == NULL)
    {
        fprintf(stderr, "Variable GENSHINLORE_PASSWORD not defined\n");
        return 1;
    }
    MYSQL *conn = mysql_init(NULL);
    mysql_options(conn, MYSQL_SET_CHARSET_NAME, "utf8mb4");
    if (mysql_real_connect(conn, "localhost", "Ulrich", mot_de_passe, "genshinlore", 0, NULL, 0) == NULL)
    {
        fprintf(stderr, "Error: Unable to connect as Ulrich : (%d): %s\n", mysql_errno(conn), mysql_error(conn));
        mysql_close(conn);
        return 1;
    }
    printf("Connection as Ulrich Success \n");

    nombre_entite(conn);
    mysql_close(conn);
    return 0;
}
