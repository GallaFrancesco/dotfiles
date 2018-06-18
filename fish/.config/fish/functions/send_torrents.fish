function send_torrents
	scp -rvP 43891 -i .ssh/ssh_groopi_key /home/franscesco/Torrent/* francesco@192.168.1.100:/home/francesco/Torrent/
	rm /home/francesco/Torrent/*;
end
