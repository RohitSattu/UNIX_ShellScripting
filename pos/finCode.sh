#!/bin/bash

file=medslist
regExG=[Gg]
regExD=[Dd]
zzz=[zZ][zZ][zZ]

numOfLines=0
counter=1

while read medFileLine
do
        medCodeF=`echo "${medFileLine:4:8}"`
        genNameF=`echo "${medFileLine:12:13}"`
        doseF=`echo "${medFileLine:25:14}"`

        medList="$medList$medCodeF:$genNameF:$doseF;"
        numOfLines=`expr $numOfLines + 1`
        
done < $file

echo "Enter Medication Code?"

while read userMedCode
do
        if [[ $userMedCode =~ $zzz ]]
        then
                echo "Good bye."
                exit
        else
                if [ "x$userMedCode" != "x" ]
                then
                        found=0
                        while [ $counter -le $numOfLines ]
                        do
                                medLine=`echo $medList | cut -f$counter -d';'`
                                medCode=`echo $medLine | cut -f1 -d':'`
                                genName=`echo $medLine | cut -f2 -d':'`
                                dose=`echo $medLine | cut -f3 -d':'`

                                if [[ $medCode =~ "$userMedCode" ]]
                                then
                                        if [ $found = 0 ]
                                        then
                                                echo "See Generic Name (G/g) or Dose (D/d)?"
                                                while read genNameOrDose
                                                do
                                                        if [[ $genNameOrDose =~ $regExG ]]
                                                        then
                                                                echo $medCode $genName
                                                                break
                                                        elif [[ $genNameOrDose =~ $regExD ]]
                                                        then
                                                                echo $medCode $dose
                                                                break
                                                        elif [[ $genNameOrDose =~ $zzz ]]
                                                        then
                                                                echo "Good bye."
                                                                exit
                                                        else
                                                                echo "Please enter only G or D."
                                                                echo "See Generic Name (G/g) or Dose (D/d)?"
                                                        fi
                                                done
                                                found=1
                                        else
                                                if [[ $genNameOrDose =~ $regExG ]]
                                                then
                                                        echo $medCode $genName
                                                        break
                                                elif [[ $genNameOrDose =~ $regExD ]]
                                                then
                                                        echo $medCode $dose
                                                        break
                                                fi
                                        fi
                                fi
                                counter=`expr $counter + 1`
                        done
                        if [ $found = 0 ]
                        then
                                echo "No such Medication Code."
                        fi
                        counter=1
                fi
        fi
        echo "Enter Medication Code?"
done
