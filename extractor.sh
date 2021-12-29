#!/bin/bash
#
##########################
## 7z archive extractor ##
##########################

#############################################
## extracts all .7z archives in a directory##
## outputs to current directory            ##
#############################################

###############
## Variables ##
###############
do_overs=0
#max_do_overs=3
old_dir=$(pwd)

#####################
## Open retry loop ##
#####################

#while [ $do_overs -lt $max_do_overs ]
while [ "$do_overs" -lt 3 ]
do

	echo "Extract here? y/n"
	read final_dir

		if [ $final_dir != "y" ] && [ $final_dir != "n" ]
		     then
			   	
			     echo "Invalid input, try again"
			
		else
			
				echo "Are the archives here? y/n"
				read arch_spot
		
				if [ $final_dir = "y" ] && [ $arch_spot = "y" ]
		     		     then
					for current in *.7z
						do
			     				7z x $current
		     				done 

		     			break

				elif [ $final_dir = "y" ] && [ $arch_spot = "n" ]
  		     		     then
					clear

					echo "Enter the path to the archives:"
					read arch_here
	
			     		for here in *.7z
						do
						     7z x $arch_here$here
		     				done

		     			break
		
				elif [ $final_dir = "n" ] && [ $arch_spot = "y" ]
		     		     then
					clear

					echo "Enter the path to extract to:"
					read ext_path
					cd $ext_path

					for there in *.7z
						do
							7z x "$old_dir/$there"
			     			done

					break

				elif [ $final_dir = "n" ] && [ $arch_spot = "n" ]
		     		     then
					clear
			
					echo "Enter the path to the archives:"
					read arch_path
			
					echo "Enter the path to extract into:"
	     				read ext_dir
					cd $ext_dir
			
					for arch in *.7z
						do
	  	     					7z x $arch_path$arch
			     			done

					break

				else
		      			echo "Invalid input, try again."
			
				fi
		fi
	do_overs=$((do_overs+1))
done


############
## tehfru ##
############
