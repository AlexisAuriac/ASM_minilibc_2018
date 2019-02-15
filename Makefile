##
## EPITECH PROJECT, 2018
## minilibc
## File description:
## Makefile for libasm.
##

CC		?=	gcc

CFLAGS	+=	-Wall -Wextra -fPIC

ASM		?=	nasm

ASFLAGS	+=	-f elf64

RM		?=	rm -f

SRC		=	strlen.asm		\
			strchr.asm		\
			memset.asm		\
			memcpy.asm		\
			strcmp.asm

SRC		:=	$(addprefix src/, $(SRC))

OBJ		=	$(SRC:.asm=.o)

NAME		=	libasm.so

all:	$(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

$(NAME)	:	$(OBJ)
	$(CC) -shared -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean	all

.PHONY:	all clean fclean re
