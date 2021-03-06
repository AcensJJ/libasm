.DEFAULT_GOAL := all
# Include file
# **************************************************************************** #
# 								Libft ASM									   #
# **************************************************************************** #
NAME = libasm.a

# Libft ASM project files
FILE_SRC = ./srcs/ft_strcmp.s ./srcs/ft_strcpy.s ./srcs/ft_write.s ./srcs/ft_strlen.s ./srcs/ft_strdup.s\
		  	./srcs/ft_list_remove_first_or_last_if.s ./srcs/ft_print_data.s ./srcs/ft_read.s\
			./srcs/ft_atoi_base.s ./srcs/ft_list_sort.s ./srcs/ft_list_push_front.s ./srcs/ft_list_size.s\
			./srcs/ft_list_remove_if.s

FILE_OBJ = $(FILE_SRC:.s=.o)
	OBJ = $(addprefix $(DIR_OBJ), $(FILE_OBJ))

# **************************************************************************** #
# 								Building Rules								   #
# **************************************************************************** #
# Rule to build both executables
all: $(NAME)

# Rule to build Nm
$(NAME):  ART $(OBJ)
	@[ -f ./libasm.a ] && echo "\033[1;32m[UPDATE] \033[0m \033[1;30m MODIFIED:\033[0m \033 \033[0m \033[3;36m libasm.a\033[0m    \033[3;40m at \033[0m \033 \033[0;33m[$(shell ls -la | grep libasm | rev | cut -d " " -f 4 | rev) $(shell ls -la | grep libasm | rev | cut -d " " -f 3 | rev) $(shell ls -la | grep libasm | rev | cut -d " " -f 2 | rev)] \033[0m \033" || echo "\033[0;32m[UPDATE] \033[0m \033[1;30m CREATED:\033[0m \033 \033[0m \033[0;36m libasm.a\033[0m"
	@ar rcs $(NAME) $(OBJ)

#nasm 64 bits
%.o: %.s
	@nasm -f macho64 $< -o $@ 
	@echo "\033[0;32m[OK] \033[0m \033[0;33m Compiling:\033[0m" $<

ART :
	@echo "\033[0;36m                        -------------------------------------------------------------------\033[0m"
	@echo "\033[1;31m               **        **   ******        **       ********  ****     ****\033[0m"
	@echo "\033[1;30m              /\033[0m\033[1;31m**       \033[1;30m/\033[0m\033[1;31m**  \033[1;30m/\033[0m\033[1;31m*\033[1;30m////\033[0m\033[1;31m**      ****     **\033[1;30m//////\033[0m\033[1;31m  \033[1;30m/\033[0m\033[1;31m**\033[1;30m/\033[0m\033[1;31m**   **\033[1;30m/\033[0m\033[1;31m**\033[0m"
	@echo "\033[1;30m              /\033[0m\033[1;31m**       \033[1;30m/\033[0m\033[1;31m**  \033[1;30m/\033[0m\033[1;31m*   \033[1;30m/\033[0m\033[1;31m**     **\033[1;30m//\033[0m\033[1;31m**   \033[1;30m/\033[0m\033[1;31m**        \033[1;30m/\033[0m\033[1;31m**\033[1;30m//\033[0m\033[1;31m** ** \033[1;30m/\033[0m\033[1;31m**\033[0m"
	@echo "\033[1;30m              /\033[0m\033[1;31m**       \033[1;30m/\033[0m\033[1;31m**  \033[1;30m/\033[0m\033[1;31m******     **  \033[1;30m//\033[0m\033[1;31m**  \033[1;30m/\033[0m\033[1;31m********  \033[1;30m/\033[0m\033[1;31m** \033[1;30m//\033[0m\033[1;31m***  \033[1;30m/\033[0m\033[1;31m**\033[0m"
	@echo "\033[1;30m              /\033[0m\033[1;31m**       \033[1;30m/\033[0m\033[1;31m**  \033[1;30m/\033[0m\033[1;31m*\033[1;30m////\033[0m\033[1;31m***  ********** \033[1;30m////////\033[0m\033[1;31m** \033[1;30m/\033[0m\033[1;31m**  \033[1;30m//\033[0m\033[1;31m*   \033[1;30m/\033[0m\033[1;31m**\033[0m"
	@echo "\033[1;30m              /\033[0m\033[1;31m**       \033[1;30m/\033[0m\033[1;31m**  \033[1;30m/\033[0m\033[1;31m*    \033[1;30m/\033[0m\033[1;31m** \033[1;30m/\033[0m\033[1;31m**\033[1;30m//////\033[0m\033[1;31m**        \033[1;30m/\033[0m\033[1;31m** \033[1;30m/\033[0m\033[1;31m**   \033[1;30m/\033[0m\033[1;31m    \033[1;30m/\033[0m\033[1;31m**\033[0m"
	@echo "\033[1;30m              /\033[0m\033[1;31m******** \033[1;30m/\033[0m\033[1;31m**  \033[1;30m/\033[0m\033[1;31m*******  \033[1;30m/\033[0m\033[1;31m**     \033[1;30m/\033[0m\033[1;31m**  ********  \033[1;30m/\033[0m\033[1;31m**        \033[1;30m/\033[0m\033[1;31m**\033[0m"
	@echo "\033[1;30m              ////////  //   ///////   //      //  ////////   //         // \033[0m"
	@echo "\033[1;36m-------------------------------------------------------------\033[0m"
	@echo

# **************************************************************************** #
# 								Cleaning Rules								   #
# **************************************************************************** #
clean:
	@rm -rf $(OBJ)
	@echo "\033[0;32m[UPDATE] \033[0m \033[1;30m REMOVED:\033[0m \033 \033[0m \033[3;31m *.o\033[0m \033"

fclean: clean
	@rm -rf $(NAME)
	@echo "\033[0;32m[UPDATE] \033[0m \033[1;30m REMOVED:\033[0m \033 \033[0m \033[3;31m libasm.a\033[0m \033"

re: fclean all

.PHONY: all clean fclean re ART
