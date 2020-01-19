/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   main.c                                           .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: jacens <jacens@student.le-101.fr>          +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2020/01/17 12:15:46 by jacens       #+#   ##    ##    #+#       */
/*   Updated: 2020/01/19 12:16:31 by jacens      ###    #+. /#+    ###.fr     */
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

t_list		*ft_lstnew(void *content)
{
	t_list	*list;

	list = malloc(sizeof(*list));
	if (list == NULL)
		return (NULL);
	list->data = content;
	list->next = NULL;
	return (list);
}

void		ft_lstadd_back(t_list **alst, t_list *new)
{
	t_list *tmp;

	if	 (!alst || !new)
		return ;
	if (!(*alst))
	{
		new->next = NULL;
		*alst = new;
		return ;
	}
	tmp = *alst;
	while (tmp->next != NULL)
		tmp = tmp->next;
	tmp->next = new;
}

int		main(void)
{
	char	*str;
	char	*str2;
	// char	*str4;
	// char	*str5;
	t_list	*lst = NULL;
	char 	*str3;
	// int 	i;
	// int 	fdread = open("test", O_RDONLY);
	// int 	fdwrite = open("test", O_WRONLY);
	t_list	*temp = NULL;
	
	// dprintf(1, "strcmp : %i MOI\n", ft_strcmp("1", "2"));
	// dprintf(1, "strcmp : %i LUI\n", strcmp("2", "1"));

	int		fd = open("test", O_RDONLY);
	char	*buffer = calloc(sizeof(char), 100);

	// printf("\n~ Test write bad fd ~\n");
	// int p =  ft_write(open("fake", O_RDONLY), "bonjour", 7);
	// printf("\nret write-> %d", p);

	printf("\n~ Test write ~\n");
	int p =  ft_write(1, "bonjour", 7);
	printf("\nret write-> %d", p);

	printf("\n\n~ Test read bad fd~\n");
	p = ft_read(open("fake", O_RDONLY), buffer, 1000);
	printf("Retour read-> %d", p);
	printf("\n|%s| = read", buffer);

	printf("\n\n~ Test read ~\n");
	p = ft_read(fd, buffer, 1000);
	printf("Retour read-> %d", p);
	printf("\n|%s| = read", buffer);

	printf("\n~Test strlen~\n");
	printf("%lu\n", ft_strlen(buffer));

	char *s1 = strdup("Si au bout de cette phrase il y a un point, ceci est strcpy valide.");
	char s2[100];
	printf("\n~Test strcpy~\n");
	printf("%s\n", ft_strcpy(s2, s1));
	free(s1);

	const char *s3 = "bonjour, ceci est un strdup";
	printf("\n~Test strdup~\n");
	char *s4 = ft_strdup((char*)s3);
	printf("%s\n", s4);
	free(s4);

	printf("\n~Test atoi_base~\n");
	printf("%d\n", ft_atoi_base("+2", "00123456789"));
	printf("%d\n", ft_atoi_base("+w", "01w3456789"));
	printf("%d\n", ft_atoi_base("+2", "0123456789"));
	printf("%d\n", ft_atoi_base("-48", "0123456789"));
	printf("%d\n", ft_atoi_base(" -+--2147448", "0123456789"));
	printf("%d\n", ft_atoi_base("    ++---222", "012"));
	printf("%d\n", ft_atoi_base(" -333f", "0123"));
	printf("%d\n", ft_atoi_base("04f4", "01234"));
	printf("%d\n", ft_atoi_base("-55+5", "012345"));
	printf("%d\n", ft_atoi_base("6641-6", "0123456"));
	printf("%d\n", ft_atoi_base("777", "01234567"));
	printf("%d\n", ft_atoi_base("888", "012345678"));
	printf("%d\n", ft_atoi_base("99", "0123456789"));
	printf("%d\n", ft_atoi_base("aaa", "0123456789a"));
	printf("%d\n", ft_atoi_base("bbb", "0123456789ab"));
	printf("%d\n", ft_atoi_base("ccc", "0123456789abc"));
	printf("%d\n", ft_atoi_base("ddd", "0123456789abcd"));
	printf("%d\n", ft_atoi_base("eee", "0123456789abcde"));
	printf("%d\n", ft_atoi_base("ff", "0123456789abcdef"));
	printf("%d\n", ft_atoi_base("ggg", "0123456789abcdefg"));

	printf("\n~Test strcmp~\n");
	s3 = strdup("oOoOoOoOoOoOoOo");
	const char *s5 = strdup("oOoOoOoOoOoOoOo");
	printf("%d", strcmp(s3, s5));
	printf(" | %d\n", ft_strcmp(s3, s5));

	t_list		**deb;
	t_list		*first;
	t_list		*second;
	t_list		*third;
	t_list		*fourth;

	printf("\n~Test list_size~\n");
	if (!(deb = malloc(sizeof(t_list**))))
		return (0);
	first = ft_lstnew(strdup("bonjour"));
	second = ft_lstnew(strdup("good morming"));
	third = ft_lstnew(strdup("guten tag"));
	fourth = ft_lstnew(strdup("buongiorno"));
	*deb = first;
	ft_lstadd_back(deb, second);
	ft_lstadd_back(deb, third);
	ft_lstadd_back(deb, fourth);
	printf("%d\n", ft_list_size(*deb));


	printf("\n~Test ft_print_data~\n");
	ft_print_data(*deb);

	printf("\n~Test lst push front~\n");
	str3 = strdup("1");
	ft_list_push_front(&lst, (void *)str3);
	str3 = strdup("4");
	ft_list_push_front(&lst, (void *)str3);
	str3 = strdup("3");
	ft_list_push_front(&lst, (void *)str3);
	str3 = strdup("2");
	ft_list_push_front(&lst, (void *)str3);
	temp = lst;
	while (temp)
	{
		dprintf(1, "\n%s",temp->data);
		temp = temp->next;
	}

	printf("\n~Test lst sort~\n");
	ft_list_sort(&lst, ft_strcmp);
	temp = lst;
	while (temp)
	{
		dprintf(1, "\n%s",temp->data);
		temp = temp->next;
	}
	// dprintf(1, "\nAP\nDATA      1: %s\n",lst->data);
	// dprintf(1, "DATA next 2: %s\n",lst->next->data);
	// dprintf(1, "DATA next 3: %s\n",lst->next->next->data);
	// dprintf(1, "DATA next 4: %s\n",lst->next->next->next->data);
	// dprintf(1, "AV\n");
	// temp = lst;
	// while (temp)
	// {
	// 	dprintf(1, "\n%s",temp->data);
	// 	temp = temp->next;
	// }



	ft_list_remove_if(&lst,	"3", ft_strcmp, balec);
	dprintf(1, "\n\nAP remove 3 (3nd carac)");
	ft_list_remove_if(&lst,	"2", ft_strcmp, balec);
	dprintf(1, "\n\nAP remove 2 (2nd carac)\n");
	temp = lst;
	while (temp)
	{
		dprintf(1, "\n%s",temp->data);
		temp = temp->next;
	}

	ft_list_remove_if(&lst,	"1", ft_strcmp, balec);
	dprintf(1, "\nAP remove 1 (first carac)\n");
	temp = lst;
	while (temp)
	{
		dprintf(1, "\n%s",temp->data);
		temp = temp->next;
	}

	ft_list_remove_if(&lst,	"4", ft_strcmp, balec);
	dprintf(1, "\nAP remove 4 (last carac)\n");
	temp = lst;
	while (temp)
	{
		dprintf(1, "\n%s",temp->data);
		temp = temp->next;
	}
	
	// ft_list_remove_if(&lst,	"4", ft_strcmp, balec);
	// dprintf(1, "\nAP remove 4 (last carac)\n");
	// temp = lst;
	// while (temp)
	// {
	// 	dprintf(1, "\n%s",temp->data);
	// 	temp = temp->next;
	// }

	// dprintf(1, "!!!!!   WRITE   !!!!!\n");
	// dprintf(1, "RET write = |%d|\n", i = write(fdwrite, "THIS IS BANANAS\n", 16));
	// dprintf(1, "RET write = |%d|\n", i = write(1, "THIS IS BANANAS\n", 16));
	// dprintf(1, "!!!!!   READ    !!!!!\n");
	// str = malloc(sizeof(char) * 21);
	// dprintf(1, "RET read = |%d|\n", i = ft_read(fdread, str, 16));
	// str[i] = '\0';
	// dprintf(1, "str is |%s|\n", str);
	// dprintf(1, "!!!!!  STRLEN   !!!!!\n");
	// dprintf(1, "str : %shas length = %zu\n", str, ft_strlen(str));
	// dprintf(1, "!!!!!  STRCMP   !!!!!\n");
	// dprintf(1, "cmp str & banana\\n :%d\n", ft_strcmp(str, str2));
	// dprintf(1, "!!!!!  STRDUP   !!!!!\n");
	// dprintf(1, "address of str = %p\n", str);
	// dprintf(1, "address of str duplicate = %p\n", str2 = ft_strdup(str));
	// dprintf(1, "str = %sstr2 = %s", str, str2);

	// close(fdwrite);
	// close(fdread);
	close(fd);
	return (0);
}
