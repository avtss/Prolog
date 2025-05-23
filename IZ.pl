% Main predicate to find graph base
find_graph_base :-
    write('Enter vertices (one per line, empty line to finish): '), nl,
    get_vertices(Vertices),
    
    write('Enter edges (one per line as "V1 V2", empty line to finish): '), nl,
    get_edges(Vertices, Edges),
    
    assert_vertices(Vertices),
    assert_edges(Edges),
    
    find_base(Vertices, Base),
    write('Graph base: '), write(Base), nl,
    
    retractall(vertex(_)),
    retractall(edge(_, _)).

% Read vertices until empty line
get_vertices(Vertices) :-
    read_line_to_string(user_input, Line),
    (Line == "" -> 
        Vertices = [] ;
        name(Vertex, Line),
        Vertices = [Vertex|Rest],
        get_vertices(Rest)
    ).

% Read edges until empty line
get_edges(Vertices, Edges) :-
    read_line_to_string(user_input, Line),
    (Line == "" -> 
        Edges = [] ;
        split_string(Line, " ", "", [V1Str,V2Str]),
        name(V1, V1Str),
        name(V2, V2Str),
        (member(V1, Vertices), member(V2, Vertices) ->
            Edges = [[V1,V2]|RestEdges] ;
            (write('Invalid edge, skipping.'), nl, Edges = RestEdges)
        ),
        get_edges(Vertices, RestEdges)
    ).

% Store vertices
assert_vertices([]).
assert_vertices([V|Vs]) :-
    assertz(vertex(V)),
    assert_vertices(Vs).

% Store edges (undirected)
assert_edges([]).
assert_edges([[V1,V2]|Es]) :-
    assertz(edge(V1, V2)),
    assertz(edge(V2, V1)),
    assert_edges(Es).

% Reachability check
reachable(Y, Base) :-
    member(Y, Base).
reachable(Y, Base) :-
    member(X, Base),
    path(X, Y, []).

% Path finding
path(X, Y, _) :- edge(X, Y).
path(X, Y, Visited) :-
    edge(X, Z),
    \+ member(Z, Visited),
    path(Z, Y, [X|Visited]).

% Coverage check
covers_all(Base, Vertices) :-
    forall(member(V, Vertices), reachable(V, Base)).

% Find minimal base
find_base(Vertices, Base) :-
    subset(Subset, Vertices),
    covers_all(Subset, Vertices),
    \+ (subset(Smaller, Vertices),
        length(Smaller, L1),
        length(Subset, L2),
        L1 < L2,
        covers_all(Smaller, Vertices)),
    Base = Subset.

% Subset generation
subset([], []).
subset([X|Xs], [X|Ys]) :- subset(Xs, Ys).
subset(Xs, [_|Ys]) :- subset(Xs, Ys).
