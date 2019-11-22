#!/usr/bin/tclsh
#!/usr/bin/expect -f


package require Expect
package require ftp 

log_file test.log

# set wsaPrompt "wsa-hq.dcloud.cisco.com>"
# set prompt "C:\Scripts"
# set wsaUsername "admin"
# set wsaPass "C1sco12345"
set wsaHost1 198.18.133.55
set wsaHost2 198.18.133.56
# set ftp_handler [::ftp::Open $wsaHost1 $wsaUsername $wsaPass]
# set ftp_handler [::ftp::Open $wsaHost2 $wsaUsername $wsaPass]

puts "***WELCOME***"
 
proc execution1 {address} {

	if {[regexp -nocase "Reply from $address" [exec ping $address]]} {

		send_user "Connection established with $address \n"

		global wsaPrompt
		global prompt
		global this_wsaUsername
		global this_wsaUsername
		global this_wsaPass
		global this_wsaHost1
		global this_wsaHost2
		global this_ftp_handler


		set wsaPrompt "wsa-hq.dcloud.cisco.com>"
		set prompt "C:\Scripts"
		set this_wsaUsername "admin"
		set this_wsaPass "C1sco12345"
		set this_wsaHost1 "198.18.133.55"
		set this_wsaHost2 "198.18.133.56"
		set this_ftp_handler [::ftp::Open $address $this_wsaUsername $this_wsaPass]

		exec cmd.exe /c echo y | plink.exe -ssh $this_wsaUsername@$address -l $this_wsaUsername -pw $this_wsaPass exit &
		send_user "In execution \n"
		spawn plink.exe -ssh $this_wsaUsername@$address -pw $this_wsaPass


		expect $wsaPrompt
		exp_send "showlicense\r"
		expect $wsaPrompt

		exp_send "loadlicense \r"
		expect "*Are you sure you want to continue \r "
		exp_send "Y\r"

		expect "*How would you like to load a license file \r>"
		exp_send "2 \r"

		expect "Enter the name of the file in /configuration to import: \r"
		::ftp::Put $this_ftp_handler wsa_license.xml configuration/wsa_license.xml
		exp_send "wsa_license.xml \r"

		puts "License uploaded"
		expect $wsaPrompt
		exp_send "showlicense\r"
		expect $wsaPrompt
		return
 
		
	} else {

		send_user "Connection to WSA = $address not reachable"

	}
}

puts [execution1 $wsaHost1]
puts [execution1 $wsaHost2]

exit

