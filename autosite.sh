clear
echo "==================================="
echo "=                                 ="
echo "=          ~ Auto Site ~          ="
echo "=                                 ="
echo "==================================="
echo ""
echo -n "Project name? "
read projectname
echo "Checking for $projectname.local in hosts file.."
if grep "$projectname.local" /etc/hosts
then
	clear
	echo "ERROR: $projectname.local exists!"
else
	echo "127.0.0.1	$projectname.local" >> /etc/hosts
	mkdir /var/www/$projectname
	cp ./template /etc/apache2/sites-available/$projectname
	sed -i 's/__TEMPLATE__/'"$projectname"'/g' /etc/apache2/sites-available/$projectname
	a2ensite $projectname
	clear
	echo "Done!"
fi
