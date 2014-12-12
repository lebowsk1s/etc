#!/usr/bin/expect -f

set timeout 10

spawn ssh -D 8888 -g hongx@50.30.34.56
expect {
	"*password:" {
		send "hongx\r"
	}
}
interact {
	timeout 60 { send " "}
}

