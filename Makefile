##
## EPITECH PROJECT, 2018
## minilibc
## File description:
## Makefile for libasm.
##

ASM		?=	nasm

ASFLAGS	+=	-f elf64

LD		?=	ld

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
			strcspn.asm		\
			toupper.asm		\
			tolower.asm

SRC		:=	$(addprefix src/, $(SRC))

OBJ		=	$(SRC:.asm=.o)

NAME	=	libasm.so

all:	$(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

$(NAME):	$(OBJ)
	$(LD) --exclude-libs libc -shared -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean	all

.PHONY:	all clean fclean re
