#!/bin/bash
#######################################################################
#                                                                   _
#       _____  _                           ____  _                 |_|
#      |  _  |/ \   ____  ____ __ ___     / ___\/ \   __   _  ____  _
#      | |_| || |  / __ \/ __ \\ '_  \ _ / /    | |___\ \ | |/ __ \| |
#      |  _  || |__. ___/. ___/| | | ||_|\ \___ |  _  | |_| |. ___/| |
#      |_/ \_|\___/\____|\____||_| |_|    \____/|_| |_|_____|\____||_| 
#                                                                      
#      ================================================================
#                 More than a coder, More than a designer              
#      ================================================================
#
#
#      - Document: script.sh
#      - Author: aleen42
#      - Description: automatically generate contributions and update the
#      				  remote repo of GitHub
#      - Create Time: Apr 13th, 2016
#      - Update Time: Apr 13th, 2016
#
#
########################################################################


if [[ $1 && $2 ]]; then
	#statements
	repo=`node ./lib/start.js $2`

	if [[ $repo =~ "repo" ]]; then
		#statements
		# enter the generated repo
		cd $repo

		# create a new line
		printf "\n"

		# bind the remote url to this repo
		`git remote add origin $1`

		# force to update remote master branch
		`git push -f origin master`

		# remove the generated repo
		rm -r $repo
	else
		echo $repo
	fi
else
	echo "[Error: Miss parameters]";
fi
