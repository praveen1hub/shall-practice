#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
   
    echo "plese run the script with root priveleges"
    exit 1
fi

dnf list installed git 

if [ $? -ne 0]
then
    
    echo "Git is not installed.Going to install it.."
    dnf install git -y

    if [$? -ne 0]
    then 
        
        echo "Git installing is not success...check it.."
        exit 1

    else 
    echo "Git is installation is success"
    fi

else
   
   echo " Git is installed, nothing to do.."
fi

     dnf list  installed mysql

if [$? -ne 0]
then 
   echo "MYSQL is not installed...going to install it"
   dnf install MYSQL -y
   if [$? -ne o]
   then
       echo "MYSQL installation is failure..please check"
       exit 1
    else
        echo "MYSQL installation is success"
    fi
else
    echo "MYSQL is already installed...nothing to do"
fi

