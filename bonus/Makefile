##
## EPITECH PROJECT, 2018
## minilibc
## File description:
## Makefile for libasm.
##

ASM		?=	as

LD		?=	ld

LD_FLAGS+=	-shared

RM		?=	rm -f

SRC		=	strlen.s	\
			strchr.s	\
			rindex.s

SRC		:=	$(addprefix src/, $(SRC))

OBJ		=	$(SRC:.s=.o)

NAME	=	libasm.so

all:	$(NAME)

%.o: %.s
	$(ASM) $< -o $@

$(NAME):	$(OBJ)
	$(LD) $(LD_FLAGS) -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean	all

tests_run:
	make -C ../tests

.PHONY:	all clean fclean re
