#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
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


CHECK_ROOT  

dnf list install git

if [ $? -ne 0]
then 
   echo "git is not installed.going to install"
   dnf install git -y
   VALIDATE $? "installing Git"
else
   echo "Git is already installed...nothing to do"
fi

dnf list install MYSQL

if [ $? -ne 0]
then 
    echo "MYSQL is not installed.going to install"
    dnf install MYSQL
    VALIDATE $? "installing MYSQL"
else
   echo "MYSQL already installed...nothing to do"
fi