##
## EPITECH PROJECT, 2018
## minilibc
## File description:
## Makefile for libasm.
##

ASM		?=	nasm

ASFLAGS	+=	-f elf64

LD		?=	ld

LD_FLAGS+=	-shared

RM		?=	rm -f

SRC		=	strlen.asm		\
			strchr.asm		\
			memset.asm		\
			memcpy.asm		\
			strcmp.asm		\
			memmove.asm		\
			strncmp.asm		\
			rindex.asm		\
			strcasecmp.asm	\
			strstr.asm		\
			strpbrk.asm		\
			toupper.asm		\
			tolower.asm
			# strcspn.asm		\

SRC		:=	$(addprefix src/, $(SRC))

OBJ		=	$(SRC:.asm=.o)

NAME	=	libasm.so

all:	$(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

$(NAME):	$(OBJ)
	$(LD) $(LD_FLAGS) -o $(NAME) $(OBJ)

bonus:
	make -C bonus

clean:
	$(RM) $(OBJ)
	make clean -C bonus
	make clean -C tests

fclean:	clean
	$(RM) $(NAME)
	make fclean -C bonus
	make fclean -C tests

re:	fclean	all

tests_run:
	CFLAGS+=' -DLIB=\"../libasm.so\" ' make -C tests

bonus_tests_run:
	make bonus
	CFLAGS+=' -DLIB=\"../bonus/libasm.so\" ' make bonus -C tests

.PHONY:	all bonus tests_run bonus_tests_run clean fclean re
