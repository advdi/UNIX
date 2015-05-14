PS3='Silakan pilih : '
options=("Process log" "User log" "Commands log" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"Process log"	) ps aux;;
        "User log"	) last;;
        "Commands log"	) history;;
        "Quit"		) break;;
        *		) echo "Pilihan salah!";;
    esac
done


#source
#https://www.digitalocean.com/community/tutorials/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux
#http://www.thegeekstuff.com/2009/03/4-ways-to-identify-who-is-logged-in-on-your-linux-system/
#http://www.tldp.org/LDP/GNU-Linux-Tools-Summary/html/x1712.htm
