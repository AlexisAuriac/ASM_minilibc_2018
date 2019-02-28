##
## EPITECH PROJECT, 2018
## minilibc
## File description:
## Makefile for unitests.
##

ASM		?=	nasm

ASFLAGS	+=	-f elf64

SRC		=	strlen.asm

SRC_UT	=	test_strlen.c

SRC		:=	$(addprefix ../src/, $(SRC))

SRC_UT	:=	$(addprefix tests/, $(SRC_UT))

OBJ		=	$(SRC:.asm=.o)		\
			$(SRC_UT:.c=.o)

CFLAGS		+=	-Wall -Wextra --coverage

LDFLAGS		+=	-lcriterion -lgcov

LIB			=	libasm.so

NAME		=	units

all:	$(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

$(NAME): $(OBJ)
		$(CC) -fno-builtin -o $(NAME) $(OBJ) $(LDFLAGS)
		./$(NAME)

clean:
		$(RM) $(OBJ)
		$(RM) $(SRC:.asm=.gcda)
		$(RM) $(SRC:.asm=.gcno)
		$(RM) $(SRC_UT:.c=.gcda)
		$(RM) $(SRC_UT:.c=.gcno)

fclean: clean
		$(RM) $(NAME)

re: fclean all

.PHONY: all lib clean fclean re
