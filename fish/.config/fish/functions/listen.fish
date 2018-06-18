# Defined in - @ line 0
function listen --description 'alias listen=netstat -lntu'
	netstat -lntu $argv;
end
