% Please insert the names and email addresses of the group members:
% Yoann Brillant | yoann.brillant@uni-potsdam.de

subgrid_size(3).

% Hints:
% - For subgrid_size(s), subgrids can be identified by labels 0..s*s-1
% - A cell (x,y) can be mapped to the subgrid labeled (((x-1)/s)*s + (y-1)/s)

% Your implementation please...
% -------------------------------------------------------------- %
% Index Values
n(1..S**2) :- subgrid_size(S).

% We take the initial values
sudoku(X, Y, V) :- initial(X, Y, V).

% Each pair (x,y) must appear exactly once with a single value
1 { sudoku(X, Y, V) : n(V) } 1 :- n(X), n(Y).

% A value cannot appear twice in the same line
:- sudoku(X, Y1, V), sudoku(X, Y2, V), Y1 != Y2.

% A value cannot appear twice in the same column
:- sudoku(X1, Y, V), sudoku(X2, Y, V), X1 != X2.

% A value cannot appear twice in the same subgrid
:- subgrid_size(S), sudoku(X1, Y1, V), sudoku(X2, Y2, V),
   (X1, Y1) != (X2, Y2),
   ((X1-1)/S)*S + (Y1-1)/S == ((X2-1)/S)*S + (Y2-1)/S.
% -------------------------------------------------------------- %

#show sudoku/3.