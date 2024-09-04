#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[33m"

CHECK_ROOT(){
    if [$USERID -ne 0]
    then
        echo "Please run this script with root priveleges"
        exit 1

    fi
}

VALIDATE(){
       
       if [ $1 -ne o]
       then 
           echo -e "$2 is...FALIED"
           exit 1
        else
           echo -e "$2 is...SUCCESS"
        fi
    }

check_ROOT  

for package in $@
do

  dnf list install $PACKAGE

    if [ $? -ne 0]
    then 

      echo "$PACKAGE is not installed.going to install"
      dnf install $PACKAGE -y
      VALIDATE $? "installing $PACKAGE"
    else

      echo "$PACKAGE is already installed...nothing to do"
    
    fi
done

