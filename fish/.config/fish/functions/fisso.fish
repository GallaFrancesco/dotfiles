# Defined in - @ line 1
function fisso --description alias\ fisso=ssh\ -t\ fra@fragal.eu\ -p\ 43890\ \'ssh\ fra@192.168.1.131\ -p\ 43890\'
	ssh -t fra@fragal.eu -p 43890 'ssh fra@192.168.1.131 -p 43890' $argv;
end
