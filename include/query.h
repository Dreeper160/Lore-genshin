#ifndef _QUERY_H_
#define _QUERY_H_
#include <stdio.h>
#include <stdlib.h>
#include <mysql/mysql.h>
/**
 * @brief Show how many entity is in the table entity.
 *
 * @param conn Mysql connection
 */
void nombre_entite(MYSQL *conn);
/**
 * @brief print the name of a specified language and the language
 *
 * @param conn Mysql connection
 */
void print_name_language(MYSQL *conn);

void print_res(MYSQL_RES *res);
#endif