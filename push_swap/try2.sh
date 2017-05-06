# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    try2.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcluchet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/05 14:00:40 by pcluchet          #+#    #+#              #
#    Updated: 2017/05/06 18:01:14 by pcluchet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


#################### SETTINGS #######################
testarray=(3 5 100 500);
resultarray=(3 12 700 5500);
resultarray_min=(3 12 1500 11500);
nb_tests=8;
#####################################################

sum=0;
un=0;
test_count=0;
stty -icanon time 0 min 0;
for tt in ${testarray[@]}; do
	#echo "${resultarray[$test_count]}";
	printf "[%4d] " $tt
	performed=0;
	sum=0;
	for i in `seq 1 $nb_tests`;
	do
		read -s input
		if [ "$input" = "s" ]; then
			let pfm=$performed+5;
			for z in `seq $pfm $nb_tests`
			do
				printf "      ";
			done
			let skp=$nb_tests-$performed;
			printf "\e[94mskipped %2d tests on %2d \e[39m" $skp $nb_tests;
			break;
		fi
		ARG=`ruby -e "puts (1..$tt).to_a.shuffle.join('  ')"`;
		un=`./push_swap $ARG | wc -l`;

		fmted=0;
		if [ $un -ge 1000 ]
		then
			fmted=$(awk "BEGIN {printf \"%.1f\",$un/1000}");
			printf "%4sk" $fmted
		else
			printf "%5d" $un;
		fi
		printf " ";
		let sum=sum+un;
		let performed=$performed+1;
	done

	printf "[%4d] : " $tt
	let sum=sum/$performed;
	#printf " %d\n" $sum
	fmted=0;
	if [ $sum -ge 1000 ]
	then
		fmted=$(awk "BEGIN {printf \"%.1f\",$sum/1000}");
		if [ $sum -le ${resultarray[$test_count]} ]
		then
			printf "\e[32m%4sk\e[39m\n" $fmted;
		else
			if [ $sum -ge ${resultarray_min[$test_count]} ]
			then
				printf "\e[32m%4sk\e[39m\n" $fmted;
			else
				printf "\e[33m%4sk\e[39m\n" $fmted;
			fi
		fi
	else
		if [ $sum -le ${resultarray[$test_count]} ]
		then
			printf "\e[32m%5d\e[39m\n" $sum;
		else
		if [ $sum -ge ${resultarray_min[$test_count]} ]
			then
				printf "\e[32m%5d\e[39m\n" $sum;
			else
				printf "\e[33m%5d\e[39m\n" $sum;
			fi

			#printf "\e[32m%5d\e[39m\n" $sum;
		fi

		#printf "%5d\n" $sum;
	fi
	let test_count=test_count+1;
done
stty sane;


