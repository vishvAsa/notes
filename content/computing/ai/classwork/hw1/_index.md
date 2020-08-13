+++
title = "+Homework Assignment #1: Search"
unicode_script = "devanagari"
+++

683 Homework Assignment
Due: September 26, 2007

My answers are italicized. - vishvAs vAsuki  

- (12%) Iterative lengthening search is an iterative analogue of uniform-cost search. The basic idea is to use increasing limits on path cost. If a node is generated whose path cost exceeds the current limit, it is immediately discarded. For each new iteration, the limit is set to the lowest path cost of any node discarded in the previous iteration.
    
    - (3%) Show that this algorithm is optimal for general path costs.
    
    - Suppose that N is the set of all nodes which are in the explored part of the search tree. (Every node belonging to the explored part of the search tree has undergone the "goal test".) Also, let NF stand for the set of all nodes in the fringe of the explored part of the search tree.
    - Initially, N and NF consist of only the node corresponding to the initial state. Initially, the limit used by iterative lengthening is 0.
    - Each successive iteration of Iterative lengthening works by generating all the successors of the fringe nodes, and discarding all nodes which exceed the current limit. Amongst those nodes which are discarded, the lowest path cost is set to be the limit used by iterative lengthening during the next iteration.
    - So, if the search progresses by one more iteration, N grows by the addition of the nodes with the least path cost, from amongst all the nodes which do not already belong to N. Thus, all nodes which are not part of N have a path cost greater than the maximum path cost for the nodes belonging to N. \[Observation 1.1.1\]
    - During each iteration of the algorithm, N grows by exactly by the number of nodes whose path cost equals the limit for the iteration. These nodes undergo the goal test. If one of these nodes is identified as a "goal node", the algorithm halts. So, whenever the algorithm proceeds to another iteration, it is implied that all nodes which have been previously added to N have undergone the goal test, and they are known to be non-goal nodes. \[Observation 1.1.2\]
    - Now, suppose that during some search iteration, the goal node is found. Considering \[Observation 1.1.2\] and \[Observation 1.1.1\], there does not exist another goal node with a lower path cost - because, if there were such a node, it would be part of N, and the algorithm would have halted. Hence, the algorithm is optimal.
    
    - (4%) Consider a uniform tree with branching factor _b_, solution depth _d_, and unit step costs (each action costs one unit). How many iterations will iterative lengthening require?
    
    - If d=0, then the initial state is also the goal state. The limit is initially 0. In the solution below, in counting the number of iterations required, I count the iteration described above.
    - In order to find the goal node, the algorithm, for this problem, will have to undergo d+1 iterations (including the first iteration, where the maximum path cost is 0).
    
    - (5%) Now consider step costs drawn from the continuous range \[e,1\] for some 0 < e < 1. How many iterations are required in the _worst case_?
    
    - Note that the question specifies the lower bound on the step size, e. Then, iterative lengthening will undergo at most d/e iterations.
    
- (12%) Suppose you were doing an A* search and there were a number of different ways that you could compute an admissible heuristic value. Suppose that some were very cheap to compute but also very inaccurate estimators while others were very expensive to compute but were very accurate estimators. How would you determine which computation to use for a given application?  
    
    - There are limitations on the space and time available to an agent for computation. This is especially true where the agent is required to respond in real-time. In dynamic environments, the situation may change during the time the agent spends in thought. If, for a given problem, an agent does not have the luxury computing a complex heuristic without incurring a penalty, the agent should choose the simple heuristic. Humans, for example, use simple heuristics in daily life.
    - On the other hand, if the agent were dealing with a static envronment, and if the agent had all the time it needed, it would use the more expensive, but accurate heuristic in the hopes of safely arriving at the solution faster. This, of course, assumes that the heuristic function is cheaper to compute than the problem of exploring the problem search tree directly. (That is, if the heuristic is not exponential in time.)
    - One would consider the reduction in the number of nodes expanded against the computational complexity of the expensive heuristic. If the more-accurate heuristic is accurate enough to guarantee subexponential growth in the number of nodes expanded with comparitively little computational cost, one would choose the more accurate heuristic. (This happens when the error in the heuristic function at node n <= O(log( actual cost to get to the goal from node n)).)
    
- (12%) Give an example of a search space in which A* would generate a node first with a _g_-value that is not the shortest distance between that node and the initial state. To do that, draw a small graph, designate one node as an initial state and one node as the goal state. Assign path costs to edges and an admissible heuristic estimate to each node.
    
    - (5%) Show the graph and trace the execution of A* until it terminates.
    
    - The graph is as follows:  
        ![diagram of the example for question 3](ai3.jpg)
    - The path taken by A* to the solution, with reference to the above diagram, is traced below:
    
    - A* starts at node A.
    - A* generates node B, using the longer, but direct, path. But, B is not expanded.
    - A* generates node C, whose f-value is equal to the F value of B, as generated above.
    - A* arbitrarily chooses to expand node C, and finds a shorter route to node B.
    - In the final step, A* expands node B to arrive at the goal, the node D.
    
    - (4%) Is your heuristic function consistent? Is it generally possible to create such an example when the heuristic is consistent?
    
    - In case of Consistent or monotonous heuristics, the f-value never decreases along a path in the search tree.
    - My heuristic function is not consisitent. It is not generally possible to create such an example when the heuristic is consistent. (A proof is not provided, as it was not asked for.)  
        
    
    - (3%) In general, will A* still find the optimal solution when this happens (i.e., a node is generated with a _g_-value greater than the shortest distance from the initial state)?
    
    - A* will still find the optimal solution when this happens! This happens because the algorithm will faithfully switch to using the shorter path, if necessary. The optimality of A* has been guaranteed and proved in the class.
    
- (16%) In this exercise, we consider the choice between two _admissible_ heuristic functions, one of which is always "at least as accurate" as the other. More precisely, for a fixed goal, let h1 and h2 be two admissible heuristic functions such that h1(n) <= h2(n) for every node n in the search tree.  
    Now recall that the A* algorithm expands nodes according to their f values, but the order in which nodes of equal f values are expanded can vary, depending on the implementation. For a given heuristic function h, we say that an ordering of the nodes in the search tree is h-legal if expanding the nodes in that order is consistent with A* search using h.  
    Let N denote the set of nodes expanded by an A* search using h1 (the "less accurate" heuristic function). Prove that there is always some search ordering that is h2-legal that expands only a (not necessarily strict) subset of the nodes in N.  
    That is, prove that it is always _possible_ that h2 leads to a smaller search space than h1. (Note that the question asks you to find _some_ search ordering such that certain properties hold. Do you see why it is not possible, in general, to show that these properties hold for an _arbitrary_ search ordering?)
    - Let C = optimum solution path cost. Also, let f1 and f2 be the f values corresponding to h1 and h2.
    - A* using h2 will never expand more nodes than A* using h1, except possibly for some nodes with f(n)=C. This is proved below.
    - It was proven in class that every node with f(n)<C is surely expanded. In other words, every node with h(n)<C-g(n) is expanded.
    - But, as h2 is at least as big as h1 for all nodes, every node which is surely expanded by h2 is also surely expanded by h1. In other words, all nodes for which f2<C are definitely expanded by both heuristics. \[Observation 4.1\]
    - But, consider the nodes for whom fn(n)=C. The set of these nodes will include the goal node, for which g=C and h=0. Let N1=set of such nodes for h1, and N2= set of such nodes for h2. It follows directly from the data that all nodes present in N2 are either present in N1, or f1(n)<C for them.
    - For nodes present in both N2 and N1, suppose that h1 arbitrarily chooses a node to expand, and that it turns out to be the goal node. In this case, h1 will immediately terminate. Also suppose that h2 were to expand the goal node only after it expanded every node present in N2. In this case, h2 will have expanded nodes which h1 did not have to expand! \[Observation 4.2\]
    - But, if both h2 and h1 were to follow the same ordering of nodes to expand when fn(n)=C for both heuristics, we can say that every node, for which f2(n)=C, which expanded by h2 is also expanded by h1. \[Observation 4.3\]
    - So, from \[Observation 4.1\] and \[Observation 4.3\], we conclude that for some search ordering, the set of nodes expanded by h2 is a subset of the set of nodes expanded by h1. Also, from \[Observation 4.2\], we see that this does not hold for any arbitrary ordering.
    
- (24%) A knight moves on a chessboard two squares up, down, left, or right followed by one square in one of the two directions perpendicular to the first part of the move (i.e., the move is L-shaped). Suppose the knight is on an unbounded board at square (0,0) and we wish to move it to square (x,y) in the smallest number of moves. (For example, to move from (0,0) to (1,1) requires two moves.)
    
    - (4%) Explain how to decide whether the required number of moves is even or odd without constructing a solution.
    
    - Consider a knight at the position (0,0). Suppose that the knight wanted to move either to (1,0) or to (0,1). This can be accomplished with 3 moves. Suppose instead that the knight wanted to move to (1,1). This can be accomplished with 2 moves. Suppose instead that the knight wanted to move to (1,2). This can be accomplished with 1 move.
    - From the above observations, we make the following generalization: If a "target square" can be reached from the origin-square by only making diagonal moves of arbitrary length and direction, then, a knight starting from the origin-square will be able to reach the "target square" using an even number of moves. Otherwise, the knight will only be able to reach the target square using an odd number of moves.
    - A proof of the above generalization is outlined here (A rigorous proof is not provided, as it was not asked for.): Color the unbounded chessboard such that all diagonally connected squares share the same color. An inescapable property of a knight's movement is that the "color" of its square changes with each move. Using this property, it may be proved by induction that to reach a square of the same color, a knight has to undertake an even number of moves, and to reach a square of the opposite color, the knight has to undertake an odd number of moves.
    
    - (6%) Design an admissible heuristic function for estimating the minimum number of moves required; it should be as accurate as you can make it. Prove rigorously that your heuristic is admissible.
    
    - I define the term "hvd distance from A to B" to mean the number of moves required by a King (a chess piece which can move diagonally, vertically or horizontally one square in any direction) to reach square A from square B. Consider all the squares surrounding a square (x,y), such that they fall within a hvd distance of 2. There are 9 such squares (including the original square).
    - The heuristic algorithm computes the hvd distance from the origin square to the target square. It then divides this number by 2 and rounds it off to the next highest natural number, to arrive at a number called "the ring ordinal". If the "the ring ordinal" is odd, but the expected actual number of moves is even, (or vice versa) the "ring ordinal" is incremented by 1. The value of the heuristic is the "ring ordinal" we finally reach. (One can decide whether even or odd number of moves are required for reaching the target square by using the reasoning provided in answer to the question 5.1.)
    - Rigorous proof of admissibility:
    
    - It immediately follows from the definition of the knight's move that a knight cannot travel more than 2 hvd distance units per move. So, at maximum, the knight can reach a square 2*"number of knight-moves" away in terms of hvd distance. In other words, "hvd distance" <= 2*"number of knight-moves".
    - From the above observation, it follows that ceil("hvd distance"/2) cannot be greater than the number of moves required by the knight. ceil("hvd distance"/2) represents the real number "hvd distance"/2 rounded off to the next highest natural number.
    - But, if one were to observe that ceil("hvd distance"/2), the lower bound on the number of knight-moves required, is odd, but knows that an even number of moves are required (as deduced using the reasoning provided in answer to the question 5.1.), one can safely increment the lower bound to ceil("hvd distance"/2) +1, with the guarantee that admissibility is maintained. This conclusion follows from the facts mentioned in the antecedent of the above sentence. One may similarly prove that ceil("hvd distance"/2) +1 remains admissible in the case where ceil("hvd distance"/2) is even and the number of knight-moves required is known to be odd.
    - Hence, we claim that the heuristic described has been proved.
    
    - (14%) Use your own implementation of A* to solve the problem using your heuristic; measure and plot the number of nodes expanded and computation time as a function of solution length for randomly generated problem instances.
    
    - I have written the program and gathered the data. The java program may be found in /courses/cs600/cs683/vvasuki/hw1ai/knightMoves , under the package "knightMoves". The object-oriented code is found among the files ChessBoard.java, ProblemSolvedException.java and Square.java.
    
     ![Graph of nodes expanded vs Solution Cost](knightMovesNodesVsCost.jpg) 
    
    ![Runtime vs Solution Cost plot](knightMovesRutimeVsCost.jpg)
    
- (24%) The traveling salesperson problem (TSP) can be solved via the minimum spanning tree (MST) heuristic, which is used to estimate the cost of completing the tour, given that a partial tour has already been constructed. The MST cost of a set of cities is the smallest sum of the link costs of any tree that connects all the cities.
    
    - (4%) Formulate the TSP as a search problem and show that the MST heuristic can be derived from a relaxed version of the TSP.
    
    - States: Each state corresponds to the path traced by the travelling salesperson so far. It is a sequence of verteces V eg: <v1, v4, v5, v2>. The verteces are numbered v1 to vx, where x is the number of verteces. The cost of the edge between any pair of verteces is known. Valid states do not contain repeated verteces, except when the circuit represented by the state contains all verteces.
    - Initial state: The salesperson has not visited any vertex.
    - Goal test: The salesperson has traced a circuit through all the nodes. The optimal goal state corresponds to the minimum cost circuit which can be traced by the salesperson.
    - Path cost: The total distance travelled by the salesperson in the path corresponding to the state the agent is exploring.
    - Successor function: The successor function generates a list of states, each of which corresponds to the addition of a particular city (say: city vx) to the path traversed, subject to the condition that the state generated is a valid state, as defined above.
    - Proof that MST heuristic can be derived from a relaxed version of the TSP:
    
    - Consider the TSP, as formulated above. Each state represents a path traversed by the travelling salesperson.
    - Suppose that N is the set of all cities. Suppose that the set G is the set of all cities which are part of a partially completed tour, which ends at node A and begins at O. The TSP problem, at each stage of the construction of the tour, would be to start from A and return to O after touring all nodes in N-G, with the minimum path-cost. This is the problem the salesperson has to face at each stage of the construction of the tour. We will relax this problem to obtain the MST heuristic.
    - Suppose that instead of having to find a tour through the cities in the set N-G to O, the salesperson were to find a minimum spanning tree through those nodes. By definition, a relaxed problem has fewer and/or relaxed constraints when compared with the original problem. Here we relax the original problem by asking the salesperson to find a MST through the cities, rather than asking him to find a \*minimal path\* through those nodes. (A path is a special kind of tree.) Hence, by virtue of relaxing the constraints on the TSP, we have arrived at the MST heuristic.
    
    - (6%) Write a problem generator for instances of TSP where cities are represented by random points in the unit square (i.e., each coordinate is between 0 and 1). The number of cities to be generated should be a parameter.
    
    - I have written a Java program, Landscape, to do this. It may be found in the edlab machine, at the path /courses/cs600/cs683/vvasuki/hw1ai/TSP, under the package tsp, as the file Landscape.java. Its results, for a given example, are shown below:
    
    - 25-Sep-07 11:47:22 AM tsp.Landscape main  
        INFO: Landscape is:  
        x:0.8188087348668529 y:0.8347283669342086  
        x:0.9157016699580921 y:0.07731264935036142  
        x:0.4308491888584558 y:0.884557718125406
    
    - (14%) Find an efficient algorithm in the literature for constructing the MST, and use it with A* search to solve instances of the TSP; measure and plot the number of nodes expanded and computation time as a fuction of the number of cities for randomly generated problem instances.
    
    - I have used the Kruskal algorithm for constructing MST's.
    - I have written a Java program, Landscape, to do this. It may be found in the edlab machine, at the path /courses/cs600/cs683/vvasuki/hw1ai/TSP, under the package tsp, as the classes Landscape, City, Edge and Tour.
    - ![Graph Size vs Nodes Expanded](graphSizeNodesExpanded.jpg)
    - ![Graph Size vs Runtime](graphSizeVsRuntime.jpg)