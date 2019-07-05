MINH = [
    [7, 8],
    [7, 9],
    [8, 10],
    [9, 10],
    [9, 11],
    [10, 12],
    [11, 12],
    [11, 13],
    [12, 14],
    [13, 14],
    [13, 15],
    [14, 16],
    [15, 17],
    [15, 18],
    [16, 17],
    [16, 18],
    [17, 18],
]

for item in MINH:
    print("\path[->] (v{index1}) edge node (v{index2});".format(index1=item[0], index2=item[1]))


\path[->] (v11) edge node {}(v13);
\path[->] (v12) edge node {}(v14);
\path[->] (v13) edge node {}(v14);
\path[->] (v13) edge node {}(v15);
\path[->] (v14) edge node {}(v16);
\path[->] (v15) edge node {}(v17);
\path[->] (v15) edge node {}(v18);
\path[->] (v16) edge node {}(v17);
\path[->] (v16) edge node {}(v18);
\path[->] (v17) edge node {}(v18);