#include "../include/query.h"
void print_res(MYSQL_RES *result)
{
    if (result == NULL)
    {
        printf("No rows returned");
        return;
    }
    unsigned int field_nb = mysql_num_fields(result);
    MYSQL_FIELD *champs = mysql_fetch_fields(result);

    printf("\n=== HEADLINES ===\n");
    for (unsigned int i = 0; i < field_nb; i++)
    {
        printf("%-30s", champs[i].name);
    }
    printf("\n--------------------------------------------------------------------------------\n");
    MYSQL_ROW line;
    unsigned long total_lines = 0;

    while ((line = mysql_fetch_row(result)))
    {
        total_lines++;

        for (unsigned int i = 0; i < field_nb; i++)
        {

            if (line[i] == NULL)
            {
                printf("%-30s", "[NULL]t");
            }
            else
            {
                printf("%-30s", line[i]);
            }
        }
        printf("\n");
    }
    printf("--------------------------------------------------------\n");
    printf("Total : %lu line(s) returned .\n\n", total_lines);
}

void nombre_entite(MYSQL *conn)
{
    char query[1024];
    int len = snprintf(query, sizeof(query),
                       "SELECT count(*) AS nb_entite FROM entite");
    if (mysql_real_query(conn, query, len) != 0)
    {
        fprintf(stderr, "Unable to execute the query (%d) : %s\n", mysql_errno(conn), mysql_error(conn));
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

    print_res(result);

    mysql_free_result(result);
}

void print_name_language(MYSQL *conn)
{
    char query[1024];
    int len = snprintf(query, sizeof(query), "SELECT entiteNom, langue FROM nom WHERE langue = 'fr'");

    if (sizeof(len) >= sizeof(query))
    {
        fprintf(stderr, "Error: Query buffer overflow\n");
        return;
    }

    if (mysql_real_query(conn, query, len) != 0)
    {
        fprintf(stderr, "Unable to execute the query (%d) : %s\n", mysql_errno(conn), mysql_error(conn));
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
            printf("Query executed with success (no rows returned).\n");
        }
        return;
    }

    print_res(result);
    mysql_free_result(result);
}
