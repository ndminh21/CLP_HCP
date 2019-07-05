import glpk

def hamiltonian(edges):
    node2colnums = {}  # Maps node to col indices of incident edges.
    for colnum, edge in enumerate(edges):
        n1, n2 = edge
        node2colnums.setdefault(n1, []).append(colnum)
        node2colnums.setdefault(n2, []).append(colnum)

    lp = glpk.LPX()  # A new empty linear program
    glpk.env.term_on = False  # Stop annoying messages.
    lp.cols.add(len(edges))  # A struct var for each edge
    lp.rows.add(len(node2colnums) + 1)  # Constraint for each node

    for col in lp.cols:  # Go over all struct variables
        col.kind = bool  # Make binary, not continuous

    # For each node, select at least 1 and at most 2 incident edges.
    for row, edge_column_nums in zip(lp.rows, node2colnums.values()):
        row.matrix = [(cn, 1.0) for cn in edge_column_nums]
        row.bounds = 1, 2

    # We should select exactly (number of nodes - 1) edges total
    lp.rows[-1].matrix = [1.0] * len(lp.cols)
    lp.rows[-1].bounds = len(node2colnums) - 1

    assert lp.simplex() == None  # Should not fail this way.
    if lp.status != 'opt': return None  # If no relaxed sol., no exact sol.

    assert lp.integer() == None  # Should not fail this way.
    if lp.status != 'opt': return None  # Count not find integer solution!

    # Return the edges whose associated struct var has value 1.
    return [edge for edge, col in zip(edges, lp.cols) if col.value > 0.99]
