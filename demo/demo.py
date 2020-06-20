#!/usr/bin/env python
"""This is a demo file that illustrates my coding ability and preferences. Specifically, this is a
"The big brown fox jumped over the lazy dog" kind of module. It should give you an idea of what I can do in about 2-3
hours with a cup of tea.

if you want more: look at
https://github.com/appetrosyan
and
https://gitlab.com/a-p-petrosyan

--------------------------------
This module is solving a simple graph theory problem. People playing volleyball form a graph based on visibility. Naturally you
can only pass a ball to someone you can see, and the question that this program solves is how to determine the maximum
number of people that can touch a ball during one game. If this is shipped with the readme.org and readme.pdf, this
should also tell you a bit about my work ethic, documentation style and overall attitude to rigour in proof of
asymptotic complexity.


"""
import argparse
import re
from collections import defaultdict
import sys


class PlayerRedefinitionError(Exception):
    pass


class UnknownVertexInAdjacencyList(Exception):
    pass


def adj_list_file_read(file_name):
    """
    Read an adjacency list graph from disk to a hashMap (dictionary).

    Parameters
    ----------
    file_name : str
        file name containing the visibility graph

    Raises
    ------
    PlayerRedefinitionError
        if a name appears twice in the first column of the file.

    Returns
    -------
    out : dict(str, set(str))
        Adjacency list representing the graph

    """
    with open(file_name) as file:
        content = file.readlines()
    # The rstrip is necessary to make sure that a lone comma at
    # the end of the file doesn't result in a whitespace only name
    names = [re.split(r"\s*,\s*", x.rstrip()) for x in content]
    visibility_graph = defaultdict(set)
    for row in names:
        if row[0] in visibility_graph:
            raise PlayerRedefinitionError(
                {"message":
                 "Player appeared twice in the first column of input file.",
                 "filename": file_name, "duplicatedPlayer": row[0]
                 })
        else:
            visibility_graph[row[0]].update(row[1:])
    return visibility_graph


def symmetric_subgraph(graph):
    """Find the symmetric subgraph of a directed graph.  I.e. get the
    subset of a graph that's bidirectionally linked.

    Parameters
    ----------
    graph : dict(str, set(str))
        Adjacency list representing the graph in the form of a dict.

    Raises
    ------
    UnknownVertexInAdjacencyList
        When one of the adjacency list elements is not present as a
        key in the dictionary. this usually means that the file has a
        typo in the name of the player in one of the adjacency lists.

    Returns
    -------
    out : dict

        Adjacency list representing the symmetric sub-graph of the
        given graph.

    """
    _symmetric_subgraph = defaultdict(set)
    inverse_graph = defaultdict(set)  # adj.T
    for player in graph.keys():
        try:
            for visible_player in graph[player]:
                if visible_player in inverse_graph.get(player, set()):
                    # Bingo! We found a bidirectional edge.
                    _symmetric_subgraph[player].add(visible_player)
                    _symmetric_subgraph[visible_player].add(player)
                inverse_graph[visible_player].add(player)
        except KeyError as e:
            # Strictly speaking there could be concurrent
            # modification, which could also cause KeyError to be
            # raised. However in that case, as in this case, this will
            # signal data corruption of a specific sort.
            raise UnknownVertexInAdjacencyList(
                {"message": "A name appeared in the visibility list, but"
                 "does not appear to be a vertex of the visibility graph.",
                 "unknown_player": e.message()})
    return _symmetric_subgraph


def max_connected_graph(graph):
    """Find the size (in number of vertices) of largest connected region
    using Depth first search.

    Earlier versions returned the list of vertices belonging to said subgraph,
    but gave the wrong impression to the reader.

    Parameters
    ----------
    graph : dict(str, set(str))
        Graph in adjacency list representation.

    Returns
    -------
    out : int
        Size of the largest connected region inside the graph.

    """
    untraversed = set(graph.keys())
    max_size = 0
    # Simple DFS. We want to make sure thaTwe traverse all the
    # disjointed regions too, so we don't terminate when the stack is
    # empty, but when we have traversed the graph
    while untraversed:
        stack = [untraversed.pop()]
        currentSize = 1
        while stack:
            vertex = stack.pop()
            for child in graph[vertex]:
                if child in untraversed:
                    stack.append(child)
                    untraversed.remove(child)
                    currentSize += 1
                # When stack is empty, we've exhausted this connected region.
        max_size = max(max_size, currentSize)
    return max_size


def solve(input_file_name):
    """This function is to compensate for the lack of scoping operators and manual memory management in python.
    A C++ style solution would be to call .del() on the no longer needed object. However, this function can be used to
    neatly wrap the demo into a moneyfunc (pardon my jargon). Looking at this function, the business logic is obvious,
    and the boilerplate that has to exist for the program to behave, is out of the way. """
    graph = read_adjacency_list_graph_from_file(input_file_name)
    if len(graph) == 1:
        return 1
    else:
        return largest_connected_subgraph_size(symmetric_subgraph(graph))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="""
This is a Demo of my coding style in python. 
    
The task was to wrtie a program that counts the number of players that
could pass the ball between each other subject to visibility
constraints. The following program was tested on the attached sample
cases (my own test cases included and clearly labelled). Proof of
asymptotic complexity is given in proof.org which can be viewed with
an org-mode plugin of your choosing in your text editor. (also a PDF is rendered). 
""")

    parser.add_argument(
        'input_file', help='input file, containing the visibility'
        'graph in adjacency list representation')
    args = parser.parse_args()
    try:
        print(solve(args.input_file))
    except PlayerRedefinitionError as e:
        # See Graceful behaviour and data corruption in readme.org
        print("PlayerAppearsTwiceInFirstColumn_Error")
        sys.exit(1)
    except UnknownVertexInAdjacencyList as e:
        print("PlayerNameDoesntAppearInFirstColumn_Error")
        sys.exit(2)
    except FileNotFoundError as e:
        print("File {} not found.".format(e.filename))
        sys.exit(3)
    except Exception as e:
        print(e.with_traceback)
        sys.exit(4)
