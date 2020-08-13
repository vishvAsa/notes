+++
title = "Homework Assignment #2: Constraint Satisfaction"
+++
683 Homework Assignment

Due: October 15, 2007

My answers are in italics. All code may be found in the Edlab machines in the path /courses/cs600/cs683/vvasuki/hw2  
-- vishvAs vAsuki

- (12%) Show that any CSP that has a finite domain for each variable can be transformed into a CSP with only binary constraints. Follow these steps:
    
    - Show how a single ternary constraint such as "A+B=C" can be turned into three binary constraints by using an auxiliary variable. (_Hint:_ consider a new variable AB whose domain is _pairs_ of numbers.)
        - Consider a CSP with finite domains for each variable. Let T be the set of all constraints. Let V be the set of variables. Consider variables A, B and C, which are subject to the ternary constraint t(A,B,C). Let the domains of A, B and C be d(A), d(B) and d(C).
        - Now, alter the above CSP as follows:
            - Add an auxiliary variable, x(A,B). Its domain will be the product of the sets d(A) and d(B).
            - Remove the constraint t(A,B,C).
            - Add a binary constraint which connects x(A,B) and A, such that, if x(A,B) is assigned the value (a,b), then A will be assigned the value a.
            - Add a binary constraint which connects x(A,B) and B, such that, if x(A,B) is assigned the value (a,b), then B will be assigned the value b.
            - Add a binary constraint which connects x(A,B) and C, such that, if x(A,B) is assigned the value (a,b), then C will be allowed all values which would have been allowed by the constraint t(A,B,C).
        - Now, the altered CSP, is equivalent to the original CSP for the following reasons:
            - All variables remain subject to all constraints except t(A,B,C).
            - Also, the set of values from the cartesian product d(A)d(B)d(C) which satisfies t(A,B,C) remains exactly the same after CSP is altered, due to the creation of the new binary constraints.
            - Hence: Any assignment of values to V, which was admissible in the original CSP should be admissible in the new CSP. And, any assignment of values to V, which was inadmissible in the original CSP should be inadmissible in the new CSP.
        - Hence, we have shown that a single ternary constraint such as "A+B=C" can be turned into three binary constraints by using an auxiliary variable.
    - Next, show how constraints with more than three variables can be treated similarly.
        - Consider a CSP with finite domains for each variable. Let T be the set of all constraints. Let V be the set of variables. Consider n variables v1, v2, ... vn, which are subject to the n-ary constraint n(v1,v2,...vn). Let the domains of a variable vx be d(vx).
        - Arbitrarily select a subset of those variables, S, whose size is |n-1|. Let the variable included in n(v1,v2,...vn), but not in S, be vy.
        - Alter the CSP as follows:
            - Add an auxiliary variable, x(S). Its domain will be the cartesian product of the domains of all variables which belong to S.
            - Remove the constraint n(v1,v2,...vn).
            - For each variable vx in S, add a binary constraint which connects x(S) and vx, such that, vx will be constrained to take up whatever value vx holds in the assignment to the variable x(S).
            - Add a binary constraint which connects x(S) and vy, such that, if x(S) is assigned the value val(S), then vy will be allowed all values which would have been allowed by the constraint n(v1,v2,...vn).
        - Now, the altered CSP, is equivalent to the original CSP for the following reasons:
            - All variables remain subject to all constraints except n(v1,v2,...vn).
            - Also, the set of values from the cartesian product of the domains of all variables which belong to S, which satisfies n(v1,v2,...vn) remains exactly the same after CSP is altered, due to the creation of the new binary constraints.
            - Hence: Any assignment of values to V, which was admissible in the original CSP should be admissible in the new CSP. And, any assignment of values to V, which was inadmissible in the original CSP should be inadmissible in the new CSP.
        - Hence, we have shown that a single n-ary constraint can be turned into n binary constraints by using an auxiliary variable.
    - Finally, show how unary constraints can be eliminated by altering the domains of variables.
        - Consider a CSP with finite domains for each variable. Let C be the set of all constraints. Let V be the set of variables.
        - Consider a variable A, subject to a unary constraint u(A), with the finite domain d(A).
        - Now, alter the CSP as follows:
            
            - A unary constraint, by definition, restricts the value of a single variable.
            - For each value v in d(A), do the following:
                - If v violates u(A), remove it from d(A). Otherwise, keep it in d(A).
            
            - Now, remove u(A) from the set C.
        - We now have a CSP which is equivalent to the original CSP due to the following reasons:
            - All variables remain subject to all constraints except u(A). Also, the set of values from d(A) which satisfy u(A) remains exactly the same after the domain is altered.
            - Hence: Any assignment of values to V, which was admissible in the original CSP should be admissible in the new CSP. And, any assignment of values to V, which was inadmissible in the original CSP should be inadmissible in the new CSP.
        - Above, we described a procedure to eliminate a single unary constraint, and showed that the application of that procedure results in an equivalent CSP.
        - If we were to apply the above procedure to every unary constraint in a given CSP, we will be left with an equivalent CSP without any unary constraint.
    
      
We show that any CSP with finite domains for each variable can be transformed into a CSP with only binary constraints.

- Consider a CSP with finite domains for each variable.
- Eliminate unary constraints by using the procedure described in answer to question 1.3.
- Convert constraints which involve more than two variable into binary constraints using the procedure described in answer to question 1.2.
- We are now left with only binary constraints.

Hence, we have proved that, if the above procedure is applied, any CSP that has a finite domain for each variable can be transformed into a CSP with only binary constraints.
    
- (88%) Sudoku is a fairly old puzzle that is now a worldwide phenomenon. You can type "sudoku" into Google, or go to [www.sudoku.com](http://www.sudoku.com) for the basics (see "How to Play") and the [Wikipedia article](http://en.wikipedia.org/wiki/Sudoku) to get more information than you could possibly imagine. Key facts about standard Sudoku puzzles:
    
    - Every puzzle has a unique solution.
    - Every puzzle is solvable without trial-and-error, given suitable inference methods.
    - The designated difficulty of a puzzle is usually determined by the difficulty of the inference methods required to solve it.
    
    In addition to the rules, many web sites offer extensive discussion of methods that humans can use to solve Sudoku without using trial-and-error search.
    
    You need to write a program that can solve Sudoku problem instances. To test your program, you should apply it to the following 16 puzzles:
    
    Puzzle [001](sudoku/puz-001.txt)   
    
    Puzzle [002](sudoku/puz-002.txt)   
    
    Puzzle [010](sudoku/puz-010.txt)   
    
    Puzzle [015](sudoku/puz-015.txt)   
    
    Puzzle [025](sudoku/puz-025.txt)
    
    Puzzle [026](sudoku/puz-026.txt)
    
    Puzzle [048](sudoku/puz-048.txt)
    
    Puzzle [051](sudoku/puz-051.txt)
    
    Puzzle [062](sudoku/puz-062.txt)
    
    Puzzle [076](sudoku/puz-076.txt)
    
    Puzzle [081](sudoku/puz-081.txt)
    
    Puzzle [082](sudoku/puz-082.txt)
    
    Puzzle [090](sudoku/puz-090.txt)
    
    Puzzle [095](sudoku/puz-095.txt)
    
    Puzzle [099](sudoku/puz-099.txt)
    
    Puzzle [100](sudoku/puz-100.txt)
    
    These puzzles are from "Sudoku: Easy to Hard", by Will Shortz. The original collection includes 100 puzzles (from 1-25 are 'light and easy', 26-50 are 'moderate', 51-75 are 'demanding', and 76-100 are 'beware! very challenging'.  
    Each puzzle is stored in a file that looks as follows:
    
    - 1 9 - - - - - -  
    - - 8 - - 3 - 5 -  
    - 7 - 6 - - - 8 -  
    - - 1 - - 6 8 - 9  
    8 - - - 4 - - - 7  
    9 4 - - - - - 1 -  
    - - - - - 2 - - -  
    - - - - 8 - 5 6 1  
    - - 3 7 - - - 9 -  
    
    **Go through the following steps:**
    
    **1.** (5) Devise a suitable representation for binary CSPs with inequality constraints. A problem should be represented as (a) a list of variables; (b) a domain for each variable represented as a list of possible values; and (c) a list of constraints, each including two variables. Since the constraints are all inequality constraints, there is no need to explicitly represnt the type of constraint. Describe briefly your general representation.  
      
    I intend to program with Java, an object oriented programming language. The following general representaion for CSP's can be implemented with any similar language.  
    
    - Objects of the abtract class/ interface List will represent an arbitrary list of objects.
    - I represent each variable with an object of the class Variable. Every such object will include a List object which will hold a list of all values in the domain of that variable.
    - Every possible value will be represented by an object of the class Value.
    - Every constraint will be represented by an object of the class Constraint, which will contain Variable objects corresponding to the two variables being constrained.
    - Every instance of the CSP problem will be represented by an object of the class CSP. Every such object will contain references to a List object, which will hold a list of all Variable objects, and also another List object, which will hold a list of all Constraint objects.
    - Furthermore, for programming convenience, each Variable object will contain a List object, which will hold a list of constraints connected to the corresponding variable.
    - My code incorporates the classes described above, and some extensions.
    
    **2.** (9) Write code defining Sudoku as a CSP, such that the procedure make-sudoku-csp returns a Sudoku CSP for the case where no initial digits are supplied. Your CSP should have 9\*36 + 9\*36 + 9*18 = 810 unique binary constraints. Now write a procedure, make-sudoku-puzzle, that reads a puzzle represented as above and returns a corresponding CSP. This CSP should be similar to the one returned by make-sudoku-csp, except that the domains of variables that have an input value (other than -) should be restricted to that input value.  
      
    
- I have written code to do the above. The methods make\_sudoku\_puzzle and make\_sudoku\_csp may be found in the class Sudoku. Please note that, for the program to function in an arbitrary computer, Sudoku.FILE_PATH may need to be altered.

**3.** (24) Implement your own version of backtracking-search similar to the one shown in Figure 5.3 in the textbook. Try to solve a few of the Sudoku instances using this algorithm and make sure that it works.

Now instrument backtracking-search so that it counts the total number of _guesses_ made. Whenever the backtracking algorithm prepares to loop through a list of _k_>0 possible values, we will say that _k_-1 guesses are made. (This way, the algorithm is still charged for guessing even if it is lucky and its first value choice succeeds.) Show the numbers of guesses made for each of the 16 instances in the above collection. Try both plain backtracking and backtacking with the MRV (minimum remaining values) heuristic.  
  

- I have written code to do the above. The methods plain\_backtracking\_search and mrv\_backtracking\_search may be found in the class Sudoku.
- The following trace shows the number of guesses required by plain\_backtracking\_search and to solve the problem (As expected, the number of "guesses", remains the same for mrv\_backtracking\_search.):
    - Oct 14, 2007 4:10:30 PM csp.Sudoku runTests  
        INFO: puz-001.txt  
        Oct 14, 2007 4:10:31 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:632  
        Oct 14, 2007 4:10:31 PM csp.Sudoku runTests  
        INFO: puz-002.txt  
        Oct 14, 2007 4:10:31 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:1200  
        Oct 14, 2007 4:10:31 PM csp.Sudoku runTests  
        INFO: puz-010.txt  
        Oct 14, 2007 4:10:31 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:976  
        Oct 14, 2007 4:10:31 PM csp.Sudoku runTests  
        INFO: puz-015.txt  
        Oct 14, 2007 4:10:31 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:2832  
        Oct 14, 2007 4:10:31 PM csp.Sudoku runTests  
        INFO: puz-025.txt  
        Oct 14, 2007 4:10:35 PM csp.Sudoku solvePuzzletxt"  
        INFO: number of guesses:639880  
        Oct 14, 2007 4:10:35 PM csp.Sudoku runTests  
        INFO: puz-026.txt  
        Oct 14, 2007 4:10:35 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:18040  
        Oct 14, 2007 4:10:35 PM csp.Sudoku runTests  
        INFO: puz-048.txt  
        Oct 14, 2007 4:10:37 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:301728  
        Oct 14, 2007 4:10:37 PM csp.Sudoku runTests  
        INFO: puz-051.txt  
        Oct 14, 2007 4:10:38 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:92752  
        Oct 14, 2007 4:10:38 PM csp.Sudoku runTests  
        INFO: puz-062.txt  
        Oct 14, 2007 4:10:38 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:2864  
        Oct 14, 2007 4:10:38 PM csp.Sudoku runTests  
        INFO: puz-076.txt  
        Oct 14, 2007 4:10:38 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:40360  
        Oct 14, 2007 4:10:38 PM csp.Sudoku runTests  
        INFO: puz-081.txt  
        Oct 14, 2007 4:10:39 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:31328  
        Oct 14, 2007 4:10:39 PM csp.Sudoku runTests  
        INFO: puz-082.txt  
        Oct 14, 2007 4:10:40 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:101328  
        Oct 14, 2007 4:10:40 PM csp.Sudoku runTests  
        INFO: puz-090.txt  
        Oct 14, 2007 4:10:40 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:41744  
        Oct 14, 2007 4:10:40 PM csp.Sudoku runTests  
        INFO: puz-095.txt  
        Oct 14, 2007 4:10:40 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:21112  
        Oct 14, 2007 4:10:40 PM csp.Sudoku runTests  
        INFO: puz-099.txt  
        Oct 14, 2007 4:10:40 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:2360  
        Oct 14, 2007 4:10:40 PM csp.Sudoku runTests  
        INFO: puz-100.txt  
        Oct 14, 2007 4:10:42 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:184112  
              
            

**4.** (40) We would like our solver never to resort to guessing. For this to happen, we will need better inference methods. In this context, an _inference method_ is a function that examines the current state of the CSP and deduces additional facts about the remaining unassigned variables -- either ruling out one or more values for a variable or asserting a particular value. The method can then modify the current state accordingly. Notice that every time a method modifies the current state, other methods (or indeed the method itself) may become applicable again. A _waterfall_ is a set of methods that is applied repeatedly, until all the methods fail to do anything useful.

Modify backtracking-search so that it applies a waterfall to modify the current state before making a recursive call. (Be sure to have the program keep track of what the waterfall does so that it can be undone!)

Initially, your waterfall should contain no inference methods, so nothing will change. Then add as your first inference method the arc consistency algorithm AC-3 shown in Figure 5.7 in the textbook. Show the numbers of guesses made for each of the 16 instances when you use AC-3 as the only inference method.

Now, find some Sudoku inference methods on the web (ones written in English, of course, not programs!). For each, describe how it works with an example; explain whether it is already covered by AC-3 and using MRV; and, if it is not covered, implement it and add it to your waterfall. After each addition, check the number of guesses for each of the 16 puzzles. Ideally, you will be able to get the numbers to zero for all puzzles. If not, it may be possible to define your own inference methods by examining the current state at each point where a guess is made, to see what a smart human would do at that point (if one happens to be available).  
      
    
- I note that arc consistancy, in the case of sudoku, implies constriction of the domain of the tail of the arc only if the domain of the head of the arc is a singleton. I have implemented AC-3 specific to the class of problems specified by the question 2.1. I have also ensured the use of the MRV heuristic. The numbers of guesses made when AC-3 is the sole member of the waterfall is shown below:
    - Oct 14, 2007 10:25:00 PM csp.Sudoku runTests  
        INFO: puz-001.txt  
        Oct 14, 2007 10:25:00 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 10:25:00 PM csp.Sudoku runTests  
        INFO: puz-002.txt  
        Oct 14, 2007 10:25:01 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 10:25:01 PM csp.Sudoku runTests  
        INFO: puz-010.txt  
        Oct 14, 2007 10:25:01 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 10:25:01 PM csp.Sudoku runTests  
        INFO: puz-015.txt  
        Oct 14, 2007 10:25:01 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 10:25:01 PM csp.Sudoku runTests  
        INFO: puz-025.txt  
        Oct 14, 2007 10:25:02 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 10:25:02 PM csp.Sudoku runTests  
        INFO: puz-026.txt  
        Oct 14, 2007 10:25:02 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:4  
        Oct 14, 2007 10:25:02 PM csp.Sudoku runTests  
        INFO: puz-048.txt  
        Oct 14, 2007 10:25:02 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:5  
        Oct 14, 2007 10:25:02 PM csp.Sudoku runTests  
        INFO: puz-051.txt  
        Oct 14, 2007 10:25:02 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:2  
        Oct 14, 2007 10:25:02 PM csp.Sudoku runTests  
        INFO: puz-062.txt  
        Oct 14, 2007 10:25:03 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:1  
        Oct 14, 2007 10:25:03 PM csp.Sudoku runTests  
        INFO: puz-076.txt  
        Oct 14, 2007 10:25:03 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:2  
        Oct 14, 2007 10:25:03 PM csp.Sudoku runTests  
        INFO: puz-081.txt  
        Oct 14, 2007 10:25:04 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:5  
        Oct 14, 2007 10:25:04 PM csp.Sudoku runTests  
        INFO: puz-082.txt  
        Oct 14, 2007 10:25:04 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:6  
        Oct 14, 2007 10:25:04 PM csp.Sudoku runTests  
        INFO: puz-090.txt  
        Oct 14, 2007 10:25:04 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 10:25:04 PM csp.Sudoku runTests  
        INFO: puz-095.txt  
        Oct 14, 2007 10:25:04 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:2  
        Oct 14, 2007 10:25:04 PM csp.Sudoku runTests  
        INFO: puz-099.txt  
        Oct 14, 2007 10:25:04 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:4  
        Oct 14, 2007 10:25:04 PM csp.Sudoku runTests  
        INFO: puz-100.txt  
        Oct 14, 2007 10:25:05 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:6  
            
- Before I was formally introduduced to the notion of path consistancy, I used path consistancy in solving sudoku puzzles. I assume that it is a common trick used by Sudoku players. Path consistency, in the case of problems of the class specified by 2.1, works as follows: If two variables share an identical domain of size two, no third variable which is constrained by both these variables may include in its domain the members of the other two variables' domains. Sudoku example: If square (0,0) and (0,1) have the domain {1,9}, the square (0,5) cannot take either of the values 1 and 9. I tried implementing 4-consistency, but it did not result in any improvement. On the addition of path consistency to the waterfall, I note further decrease in the number of guesses required:
    - Oct 14, 2007 11:22:47 PM csp.Sudoku runTests  
        INFO: puz-001.txt  
        Oct 14, 2007 11:22:48 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 11:22:48 PM csp.Sudoku runTests  
        INFO: puz-002.txt  
        Oct 14, 2007 11:22:49 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 11:22:49 PM csp.Sudoku runTests  
        INFO: puz-010.txt  
        Oct 14, 2007 11:22:49 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 11:22:49 PM csp.Sudoku runTests  
        INFO: puz-015.txt  
        Oct 14, 2007 11:22:50 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 11:22:50 PM csp.Sudoku runTests  
        INFO: puz-025.txt  
        Oct 14, 2007 11:22:50 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 11:22:50 PM csp.Sudoku runTests  
        INFO: puz-026.txt  
        Oct 14, 2007 11:22:51 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 11:22:51 PM csp.Sudoku runTests  
        INFO: puz-048.txt  
        Oct 14, 2007 11:22:51 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:1  
        Oct 14, 2007 11:22:51 PM csp.Sudoku runTests  
        INFO: puz-051.txt  
        Oct 14, 2007 11:22:52 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 11:22:52 PM csp.Sudoku runTests  
        INFO: puz-062.txt  
        Oct 14, 2007 11:22:53 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:1  
        Oct 14, 2007 11:22:53 PM csp.Sudoku runTests  
        INFO: puz-076.txt  
        Oct 14, 2007 11:22:53 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:1  
        Oct 14, 2007 11:22:53 PM csp.Sudoku runTests  
        INFO: puz-081.txt  
        Oct 14, 2007 11:22:54 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 11:22:54 PM csp.Sudoku runTests  
        INFO: puz-082.txt  
        Oct 14, 2007 11:22:54 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:4  
        Oct 14, 2007 11:22:54 PM csp.Sudoku runTests  
        INFO: puz-090.txt  
        Oct 14, 2007 11:22:55 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:0  
        Oct 14, 2007 11:22:55 PM csp.Sudoku runTests  
        INFO: puz-095.txt  
        Oct 14, 2007 11:22:55 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:2  
        Oct 14, 2007 11:22:55 PM csp.Sudoku runTests  
        INFO: puz-099.txt  
        Oct 14, 2007 11:22:56 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:3  
        Oct 14, 2007 11:22:56 PM csp.Sudoku runTests  
        INFO: puz-100.txt  
        Oct 14, 2007 11:22:56 PM csp.Sudoku solvePuzzle  
        INFO: number of guesses:3  
          
        
    
**5.** (10) Design and implement a Sudoku puzzle generator that can generate puzzles of a desired difficulty. Explain your approach and provide sample puzzles of various degrees of difficulty. For extra fun, you may pass the hardest puzzles you can create to your friends to see if their solvers can solve them without guessing.

- I have implemented a Sudoku puzzle generator (Sudoku.makePuzzle method) with 4 difficulty levels ranging from 0 to 3. The 3rd level is the hardest. It is modelled after the puzzles and the difficulty levels provided with this assignment. I have observed that those 16 puzzles were of varying levels of difficulty and that their difficulty was related to the number of guesses a CSP solver with constraint propogration in the form of maintenance of arc-consistency and path-consistency had to make. I also think that since the puzzles were picked from a book meant for human solvers, they may more accurately reflect the level of difficulty perceived by humans.
- I generate puzzles by randomly picking a puzzle of the desired difficulty from the set of 16 puzzles provided with this paper, randomly changing the numbers filled therein, and then randomly reflecting the resultant puzzle accross the axes and the origin of a rectangular coordinate system centered at the middle of the puzzle.
- My puzzle generator is capable of generating 9!(4x) unique puzzles of a given difficulty level, where x is the number of examples of a particular difficulty class provided in this question paper.  
    
- Examples of puzzles of the four difficulty levels generated, with their solutions, are given below:

```
Oct 15, 2007 1:16:58 AM csp.Sudoku makePuzzle  
INFO:  
- - 5 3 6 7 - - 4  
- 3 - 4 - 9 - 5 -  
1 - 4 8 5 - - 6 -  
4 1 - 6 - - 7 - -  
7 5 2 9 - 3 - - -  
- - 9 1 - - - 2 3  
2 9 - - - - 6 3 -  
- - - - - - 8 7 -  
5 - 6 - - - 9 - -  
  
Oct 15, 2007 1:16:59 AM csp.Sudoku makePuzzle  
INFO:  
9 2 5 3 6 7 1 8 4  
6 3 8 4 1 9 2 5 7  
1 7 4 8 5 2 3 6 9  
4 1 3 6 2 5 7 9 8  
7 5 2 9 8 3 4 1 6  
8 6 9 1 7 4 5 2 3  
2 9 7 5 4 8 6 3 1  
3 4 1 2 9 6 8 7 5  
5 8 6 7 3 1 9 4 2  
  
Oct 15, 2007 1:16:59 AM csp.Sudoku makePuzzle  
INFO: number of guesses:0  
Oct 15, 2007 1:17:01 AM csp.Sudoku makePuzzle  
INFO:  
8 - - - - 9 - - -  
- - - 7 6 - - - -  
- 6 - - - - 3 - -  
- 4 3 8 - - 2 - -  
- - - 1 - 4 - - 9  
7 - - - - - - - -  
- 8 - - 9 - 6 4 -  
- - 1 - - - - - -  
- - - - 3 5 - 9 -  
  
Oct 15, 2007 1:17:02 AM csp.Sudoku makePuzzle  
INFO:  
8 2 7 3 1 9 4 5 6  
5 3 4 7 6 2 9 8 1  
1 6 9 5 4 8 3 7 2  
9 4 3 8 7 6 2 1 5  
6 5 8 1 2 4 7 3 9  
7 1 2 9 5 3 8 6 4  
3 8 5 2 9 1 6 4 7  
4 9 1 6 8 7 5 2 3  
2 7 6 4 3 5 1 9 8  
  
Oct 15, 2007 1:17:02 AM csp.Sudoku makePuzzle  
INFO: number of guesses:1  
Oct 15, 2007 1:17:03 AM csp.Sudoku makePuzzle  
INFO:  
- - 5 - - 3 9 - -  
7 - - - - - - - 6  
- - - 2 - - - - -  
1 - - - - 2 - - -  
8 - - - - 4 3 - -  
- - 3 - - - - - 1  
- - 9 - - - - - 7  
5 - - 4 1 - - 2 9  
- - 2 - - 8 6 - -  
  
Oct 15, 2007 1:17:03 AM csp.Sudoku makePuzzle  
INFO:  
2 6 5 7 8 3 9 1 4  
7 9 8 5 4 1 2 3 6  
3 4 1 2 6 9 7 8 5  
1 7 4 6 3 2 5 9 8  
8 5 6 1 9 4 3 7 2  
9 2 3 8 5 7 4 6 1  
6 8 9 3 2 5 1 4 7  
5 3 7 4 1 6 8 2 9  
4 1 2 9 7 8 6 5 3  
  
Oct 15, 2007 1:17:03 AM csp.Sudoku makePuzzle  
INFO: number of guesses:0  
Oct 15, 2007 1:17:05 AM csp.Sudoku makePuzzle  
INFO:  
6 - - - 1 3 - - -  
- - - 5 8 4 9 - -  
- 8 - 9 - - - - -  
7 - - - - - - - -  
- - 5 - - - 2 4 -  
- - - - - - - 8 6  
- 7 - - - - - - -  
8 - - - - 1 - - 3  
4 - 3 7 5 6 - 2 1  
  
Oct 15, 2007 1:17:06 AM csp.Sudoku makePuzzle  
INFO:  
6 5 9 2 1 3 4 7 8  
3 1 7 5 8 4 9 6 2  
2 8 4 9 6 7 1 3 5  
7 3 8 6 4 2 5 1 9  
1 6 5 8 3 9 2 4 7  
9 4 2 1 7 5 3 8 6  
5 7 1 3 2 8 6 9 4  
8 2 6 4 9 1 7 5 3  
4 9 3 7 5 6 8 2 1  
  
Oct 15, 2007 1:17:06 AM csp.Sudoku makePuzzle  
INFO: number of guesses:1
```