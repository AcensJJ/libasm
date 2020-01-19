#include "./main.h"
#include <string.h>
#include <limits.h>
#define STRCMP "hell", "hello"

void	add(int n1, int n2)
{
	printf("%d\n", n1+n2);
}

int		croissant(void *n1, void *n2)
{
	return (*(int*)n1 - *(int*)n2);
}

int		decroissant(void *n1, void *n2)
{
	return (*(int*)n2 - *(int*)n1);
}

int main(void)
{
    char    str[256];
	char	buf[256];
    char    *s = "oksalut";
	t_list	*a, *b, *c, *d, *e;
	int		da, db, dc, dd, de;
	int		dt = 42;
	da = 3;
	db = 7;
	dc = 2;
	dd = 4;
	de = 8;
	a = malloc(16);
	b = malloc(16);
	c = malloc(16);
	d = malloc(16);
	e = malloc(16);
	a->data = &da;
	b->data = &db;
	c->data = &dc;
	d->data = &dd;
	e->data = &de;
	a->next = b;
	b->next = c;
	c->next = d;
	d->next = e;
	e->next = NULL;
    //printf("%zd\n", ft_write(-1, "hello\n", 6));
	//printf("%zd\n", ft_read(-1, buf, 6));
	//printf("%zu\n", ft_strlen(""));
    //printf("%s\n", ft_strcpy(str, s));
	//printf("%s\n", strcpy(str, s));
    // printf("mine : %d\n", ft_strcmp(STRCMP));
	// printf("real : %d\n", strcmp(STRCMP));
    // char *dup;
    // dup = NULL;
	// printf("%14p = %s\n", dup, dup);
    // dup = ft_strdup("`l'asm c le feu`");
    // printf("%14p = %s\n", dup, dup);
    // free(dup);
	//ft_list_push_front(&a, &dt);
	// ft_list_sort(&a, croissant);
	// t_list *ptr = a;
	// while (ptr)
	// {
	// 	printf("%d\n", *(int*)ptr->data);
	// 	ptr = ptr->next;
	// }
	//printf("size = %d\n", ft_list_size(a));
	//printf("%d\n", ft_atoi_base("", "0123456789abcdef"));
    return (0);
}