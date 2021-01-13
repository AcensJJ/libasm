# libasm

<img src="https://user-images.githubusercontent.com/45235527/96904473-76c26280-1497-11eb-808c-92feeb08040f.PNG" width="250" height="200" />

<strong>Description</strong>

Le but de ce projet est de se familiariser avec le langage assembleur.


# Partie obligatoire

- Votre librarie doit s’appeller libasm.a
- Vous devez rendre un main qui testera vos fonctions et compilera avec votre librairie montrer qu’elle fonctionne.
- Vous devez écrire les fonctions suivantes :
  - `ft_strlen` (man 3 strlen)
  - `ft_strcpy` (man 3 strcpy)
  - `ft_strcmp` (man 3 strcmp)
  - `ft_write` (man 2 write)
  - `ft_read` (man 2 read)
  - `ft_strdup` (man 3 strdup, malloc autorisé)
- Vous devez verifier les erreurs lors des syscalls et les renvoyer correctement
- Votre code doit permettre la lecture de la variable errno (de <errno.h>) depuis un fichier .c
- Pour cela, vous avez l’autorisation d’utiliser extern ___error


# Partie bonus

Vous pouvez réecrire les fonctions suivantes en asm. La liste chainée utilisera la structure suivante :

```
typedef struct s_list
{
  void *data;
  struct s_list *next;
} t_list;
```

- `ft_atoi_base` (Comme celui de piscine)
- `ft_list_push_front` (Comme celui de piscine)
- `ft_list_size` (Comme celui de piscine)
- `ft_list_sort` (Comme celui de piscine)
- `ft_list_remove_if` (Comme celui de piscine)
