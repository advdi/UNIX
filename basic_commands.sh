while true;
do
	echo "
	Menu
	0. Keluar
	1. Membuat file baru
	2. Membuat direktori baru
	3. Mengcopy file ke direktori tertentu
	4. Menghapus file
	5. Menghapus direktori
	6. Backup dengan Tar
	7. Backup dengan Rsync
	";

	read -p "Masukkan angka : " input;
	case $input in
		0) break;;
		1) read -p "Nama file : " name;
		   cat > $name;;

		2) read -p "Nama direktori : " name;
		   mkdir $name;;

		3) read -p "Nama file : " name;
		   read -p "Alamat direktori : " dest;
		   cp $name $dest;;

		4) read -p "Nama file : " name;
		   rm $name;;

		5) read -p "Nama direktori : " name;
		   rm -rf $name;;

		6) read -p "Nama file (.tar.gz) : " name;
		   read -p "Folder yang dibackup (/ = semua) : " dest
		   tar -cvpzf $name --exclude=$dest/$name.tar.gz --one-file-system $dest;;

		7) read -p "Sumber backup (/* = semua ): " name;
		   read -p "Tujuan backup : " dest;
		   rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} $name $dest;;

		*) clear;
		   echo "Silakan masukkan angka 1-7";;
	esac
done


# -A INPUT -p tcp -m state --state NEW --dport 22 -j ACCEPT

#sources
#http://www.howtogeek.com/199687/how-to-quickly-create-a-text-file-using-the-command-line-in-linux/
#https://help.ubuntu.com/community/BackupYourSystem/TAR
#https://wiki.archlinux.org/index.php/Full_system_backup_with_rsync
