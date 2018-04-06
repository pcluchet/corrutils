This simple bash script will test one's 42 push_swap efficiency

How to use :
1 - Place test.sh at the root of you push_swap folder
2 - Compile push_swap 
3 - Just launch the script using ./test.sh or bash ./test.sh
4 - You can skip remining tests if they get too loong by pressing s

This will output something similar to this:

[   3]     0     2     0     1     1     2     1     1 [   3] :     1
[   5]     7     6     7     7     6     9     6     6 [   5] :     6
[ 100]   842   779   763   735   806   758   772   773 [ 100] :   778
[ 500]  8.1k  8.2k s 8.3k       skipped  5 tests on  8 [ 500] :  8.2k

Each line is a set of tests for a different pile of the same length.
The pile is randomly generated before each tests
The length of the pile to sort is display between []
Each test result in displaying the amount of operation used by push_swap
At the end of line the average of operations amount is displayed
Said amount is colored green if it fully fullfill the 42 scale
Otherwise, it is colored yellow (between max and min) or red (above max)

Scale used for coloring :
Sets of 3 values : max 3 operations
Sets of 5 values : max 12 operations
Sets of 100 values : max 1500 operations, min 700 operations
Sets of 500 values : max 11500 operations, min 5500 operations

You can adjust those values in the settings part at the beging of the script.
