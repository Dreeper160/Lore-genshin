#include "../include/query.h"

int main(void)
{
    const char *mot_de_passe = getenv("GENSHINLORE_PASSWORD");
    if (mot_de_passe == NULL)
    {
        }
    MYSQL *conn = mysql_init(NULL);
    if ((conn) == NULL)
    {
        fprintf(stderr, "Unable to intitalize connection\n");
        return 1;
    }
    mysql_options(conn, MYSQL_SET_CHARSET_NAME, "utf8mb4");
    if (mysql_real_connect(conn, "localhost", "Ulrich", mot_de_passe, "genshinlore", 0, NULL, 0) == NULL)
    {
        fprintf(stderr, "Error: Unable to connect as Ulrich : (%d): %s\n", mysql_errno(conn), mysql_error(conn));
        mysql_close(conn);
        return 1;
    }
    printf("Connection as Ulrich Success \n");

    nombre_entite(conn);
    print_name_language(conn);
    mysql_close(conn);
    return 0;
}
