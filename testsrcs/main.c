/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   main.c                                           .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: jacens <jacens@student.le-101.fr>          +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2020/01/17 12:15:46 by jacens       #+#   ##    ##    #+#       */
/*   Updated: 2020/01/17 15:18:29 by jacens      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */


#include "main.h"

void	balec(void	*viteeff)
{
	if (viteeff)
		free (viteeff);
}

int		balec2(char *s1, char *s2)
{
	return(0);
}

int		main(void)
{
	char	*str;
	// char	*str2;
	// char	*str4;
	// char	*str5;
	// t_list	*lst;
	// char 	*str3;
	int 	i;
	int 	fdread = open("test", O_RDONLY);
	int 	fdwrite = open("test", O_WRONLY);
	// t_list	*temp;
	
	// dprintf(1, "strcmp : %i MOI\n", ft_strcmp("test", "text"));
	// dprintf(1, "strcmp : %i LUI\n", strcmp("test", "text"));
	// dprintf(1, "strcmp : %i MOI\n", ft_strcmp("text", "text"));
	// dprintf(1, "strcmp : %i LUI\n", strcmp("text", "text"));
	// dprintf(1, "strcmp : %i MOI\n", ft_strcmp("text", "test"));
	// dprintf(1, "strcmp : %i LUI\n", strcmp("text", "test"));
	// str3 = ft_strdup("str");
	// str2 = malloc(4);
	// ft_strcpy(str2, str3);
	// dprintf(1, "str2 : %s has length = %zu\n", str2, ft_strlen(str2));
	// dprintf(1, "str3 : %s has length = %zu\n", str3, ft_strlen(str3));
	// free(str3);
	// free(str2);
	// str2 = strdup("banana\n");
	// dprintf(1, "str2 : %shas length = %zu\n", str2, ft_strlen(str2));
	// ft_list_push_front(&lst, (void *)str3);
	// dprintf(1, "DATA : %s\n",lst->data);
	// dprintf(1, "%p\n",lst);
	// str3 = strdup("str1");
	// ft_list_push_front(&lst, (void *)str3);
	// dprintf(1, "DATA : %s\n",lst->data);
	// dprintf(1, "%p\n",lst);
	// str3 = strdup("str2");
	// ft_list_push_front(&lst, (void *)str3);
	// dprintf(1, "DATA : %s\n",lst->data);
	// dprintf(1, "%p\n",lst);
	// str3 = strdup("str3");
	// ft_list_push_front(&lst, (void *)str3);
	// dprintf(1, "DATA : %s\n",lst->data);
	// dprintf(1, "%p\n",lst);
	// str3 = strdup("str4");
	// ft_list_push_front(&lst, (void *)str3);
	// dprintf(1, "DATA : %s\n",lst->data);
	// dprintf(1, "%p\n",lst);
	// str3 = strdup("str5");
	// ft_list_push_front(&lst, (void *)str3);
	// dprintf(1, "DATA : %s\n",lst->data);
	// dprintf(1, "%p\n",lst);
	// dprintf(1, "number of maillon = %d\n", ft_list_size(lst));
	// ft_list_sort(&lst, ft_strcmp);
	// dprintf(1,"\nSort lst");
	// temp = lst;
	// while (temp)
	// {
	// 	dprintf(1, "\n%s",temp->data);
	// 	temp = temp->next;
	// }
	// ft_list_remove_if(&lst,	"str4", ft_strcmp, balec);
	// dprintf(1,"\n\nRemove str4");
	// temp = lst;
	// while (temp)
	// {
	// 	dprintf(1, "\n%s",temp->data);
	// 	temp = temp->next;
	// }
	// ft_list_remove_if(&lst,	"str", ft_strcmp, balec);
	// dprintf(1,"\n\nRemove str");
	// temp = lst;
	// while (temp)
	// {
	// 	dprintf(1, "\n%s",temp->data);
	// 	temp = temp->next;
	// }
	// ft_list_remove_if(&lst,	0, ft_strcmp, balec);
	// dprintf(1,"\n\nRemove 0");
	// temp = lst;
	// while (temp)
	// {
	// 	dprintf(1, "\n%s",temp->data);
	// 	temp = temp->next;
	// }
	// ft_list_remove_if(&lst,	"ble", balec2, balec);
	// dprintf(1,"\n\nRemove all");
	// temp = lst;
	// while (temp)
	// {
	// 	dprintf(1, "\n%s",temp->data);
	// 	temp = temp->next;
	// }
	// str3 = strdup("Surprise");
	// ft_list_push_front(&lst, (void *)str3);
	// ft_list_remove_if(&lst,	"str", ft_strcmp, balec);
	// dprintf(1,"\n\nRemove str");
	// temp = lst;
	// while (temp)
	// {
	// 	dprintf(1, "\n%s",temp->data);
	// 	temp = temp->next;
	// }
	// ft_list_sort(&lst, ft_strcmp);
	// dprintf(1,"\n\nRemove str");
	// temp = lst;
	// while (temp)
	// {
	// 	dprintf(1, "\n%s",temp->data);
	// 	temp = temp->next;
	// }
	dprintf(1, "!!!!!   WRITE   !!!!!\n");
	dprintf(1, "RET write = |%d|\n", i = write(fdwrite, "THIS IS BANANAS\n", 16));
	dprintf(1, "RET write = |%d|\n", i = write(1, "THIS IS BANANAS\n", 16));
	dprintf(1, "!!!!!   READ    !!!!!\n");
	str = malloc(sizeof(char) * 21);
	dprintf(1, "RET read = |%d|\n", i = ft_read(fdread, str, 16));
	str[i] = '\0';
	dprintf(1, "str is |%s|\n", str);
	// dprintf(1, "!!!!!  STRLEN   !!!!!\n");
	// dprintf(1, "str : %shas length = %zu\n", str, ft_strlen(str));
	// dprintf(1, "!!!!!  STRCMP   !!!!!\n");
	// dprintf(1, "cmp str & banana\\n :%d\n", ft_strcmp(str, str2));
	// dprintf(1, "!!!!!  STRDUP   !!!!!\n");
	// dprintf(1, "address of str = %p\n", str);
	// dprintf(1, "address of str duplicate = %p\n", str2 = ft_strdup(str));
	// dprintf(1, "str = %sstr2 = %s", str, str2);
	// printf("!!!!! ATOI_BASE !!!!!\n");
	// printf("%d\n", ft_atoi_base("+2", "00123456789"));
	// printf("%d\n", ft_atoi_base("+w", "01w3456789"));
	// printf("%d\n", ft_atoi_base("+2", "0123456789"));
	// printf("%d\n", ft_atoi_base("-48", "0123456789"));
	// printf("%d\n", ft_atoi_base(" -+--2147448", "0123456789"));
	// printf("%d\n", ft_atoi_base("    ++---222", "012"));
	// printf("%d\n", ft_atoi_base(" -333f", "0123"));
	// printf("%d\n", ft_atoi_base("04f4", "01234"));
	// printf("%d\n", ft_atoi_base("-55+5", "012345"));
	// printf("%d\n", ft_atoi_base("6641-6", "0123456"));
	// printf("%d\n", ft_atoi_base("777", "01234567"));
	// printf("%d\n", ft_atoi_base("888", "012345678"));
	// printf("%d\n", ft_atoi_base("99", "0123456789"));
	// printf("%d\n", ft_atoi_base("aaa", "0123456789a"));
	// printf("%d\n", ft_atoi_base("bbb", "0123456789ab"));
	// printf("%d\n", ft_atoi_base("ccc", "0123456789abc"));
	// printf("%d\n", ft_atoi_base("ddd", "0123456789abcd"));
	// printf("%d\n", ft_atoi_base("eee", "0123456789abcde"));
	// printf("%d\n", ft_atoi_base("ff", "0123456789abcdef"));
	// printf("%d\n", ft_atoi_base("ggg", "0123456789abcdefg"));

	// close(fdwrite);
	// close(fdread);
	
	// return (0);
}
