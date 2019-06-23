f = open("alb1000.hcp", "r")
for x in f:
    input = x.strip().split()
    print("next_node("+input[0]+","+input[1]+").")
    print("next_node("+input[1]+","+input[0]+").")