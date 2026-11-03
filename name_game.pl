
% Lab 9 - Name Game

% Start the game.
start :-
    nl,
    writeln('Hi, This is the Name Game.'),
    writeln('Create your name using letters.'),
    menu([a,b,c]).

% Display the main menu.
menu(Letters) :-
    nl,
    writeln('** NAME GAME **'),
    writeln('1 - Display current letters'),
    writeln('2 - Add a letter at a position'),
    writeln('3 - Add a letter at the top'),
    writeln('4 - Add a letter at the bottom'),
    writeln('5 - Delete a letter'),
    writeln('6 - Delete all letters'),
    writeln('7 - Exit'),
    write('Enter your choice: '),
    read(Choice),
    action(Choice, Letters).

% Option 1: Display letters.
action(1, Letters) :-
    !,
    write('Current letters: '),
    writeln(Letters),
    menu(Letters).

% Option 2: Insert at a selected position.
action(2, Letters) :-
    !,
    write('Enter a letter: '),
    read(Letter),
    write('Enter position: '),
    read(Position),
    ( integer(Position),
      Position >= 1,
      Before is Position - 1,
      length(Prefix, Before),
      append(Prefix, Suffix, Letters)
    ->
      append(Prefix, [Letter|Suffix], NewLetters),
      writeln('Letter added.'),
      menu(NewLetters)
    ;
      writeln('Invalid position.'),
      menu(Letters)
    ).

% Option 3: Add at the top.
action(3, Letters) :-
    !,
    write('Enter a letter: '),
    read(Letter),
    menu([Letter|Letters]).

% Option 4: Add at the bottom.
action(4, Letters) :-
    !,
    write('Enter a letter: '),
    read(Letter),
    append(Letters, [Letter], NewLetters),
    menu(NewLetters).

% Option 5: Delete one letter.
action(5, Letters) :-
    !,
    write('Enter the letter to delete: '),
    read(Letter),
    ( select(Letter, Letters, NewLetters)
    ->
      writeln('Letter deleted.'),
      menu(NewLetters)
    ;
      writeln('Letter not found.'),
      menu(Letters)
    ).

% Option 6: Delete all letters.
action(6, _) :-
    !,
    writeln('All letters deleted.'),
    menu([]).

% Option 7: Exit.
action(7, _) :-
    !,
    writeln('Goodbye!').

% Invalid menu choice.
action(_, Letters) :-
    writeln('Invalid choice.'),
    menu(Letters).
