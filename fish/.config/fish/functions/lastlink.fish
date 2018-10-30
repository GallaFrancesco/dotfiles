# Defined in - @ line 0
function lastlink --description alias\ lastlink=cat\ .saved_links\ \|\ tail\ -n\ 1\ \|\ cut\ -d\'\]\'\ -f2\ \|\ cut\ -d\'\ \'\ -f2
	cat .saved_links | tail -n 1 | cut -d']' -f2 | cut -d' ' -f2 $argv;
end
