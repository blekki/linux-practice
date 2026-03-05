#!/bin/bash

RESULT_PATH="../../results/4"

SOURCE="source.txt"
DESTINATION="out.txt"
LOGS_DESTINATION="err.txt"


# Print in a console text out the "SOURCE". The same to "cat $SOURCE"
cat < $SOURCE

# take text out "SOURCE" and put into "DESTINATION"
cat $SOURCE > $RESULT_PATH/$DESTINATION
echo "\n---> spaces\n" >> $RESULT_PATH/$DESTINATION
cat $SOURCE >> $RESULT_PATH/$DESTINATION

# save errors into "stderr.txt"
cat "unexists_file" 2> $RESULT_PATH/$LOGS_DESTINATION

# throw errors into "black hole"
cat "unexists_file" 2> /dev/null