========================================================================
    CONSOLE APPLICATION : Switch Miner v2.75 Project Overview
========================================================================

Switch Miner analyzes Cisco switches. Using SNMP it creates a flat file 
that contains Interface Info, speed, duplex, MAC Addr's, Vlans, IP's and 
DNS/NBT Computer names and users for devices connected to the switch.

Switch Miner - Cisco Switch Miner for Win32
Version 2.75 (21 March 2008) By Billy Yawn - yawnb@triad.rr.com

Usage: sm.exe
        -s <switch agent>
        -c <switch community>
        -r <router agent>
        -e <router community>
        [optional options]
        -v [snmp version] 1 or 2 - default value is 2
        -x [retries] - default value is 3
        -t [timeout] - default value is 6s
        -m [max_repetitions] - maximum repetitions for getbulk - default is 40
        -n Don't consolidate CDP Neighbor switch ports
        -l walk CDP neighbors
        -y output .csv file format
        -p perform ping sweep before switch walk (More accurate results)
        -f <filename> - read switch list from file
        -o <filename> - output filename
        -d turn debug on
        -h print this message
Example:sm -s switch1 -c public -r router1 -e private
        sm -s switch1 -c public -r router1 -e private -v1 -n -d
        sm -s switch2 -c public -r router2 -e public -l
        sm -f switch_list.txt -c public -r router1 -e public
					
The -v option allows polling switches and routers that do not support SNMP
version 2.

The -n option shows all the mac addresses on a port connected with
another switch that is discovered via cdp.

-----------------------------------------------------------------------------------
						New Options in Version 2.75
-----------------------------------------------------------------------------------
Added -o option to specify an output filename. If you do not specify a output file
name the program will use the switch name. 

The following issues have been addressed in this release.
	- Fixed SNMP timeouts cause the program to exit.
	- Fixed newer switches were timing out with default VLANS 1002-1005.
	- Fixed issue with blank return values
	- Fixed some netbios names being skipped

-----------------------------------------------------------------------------------
						New Options in Version 2.51
-----------------------------------------------------------------------------------
The program now exports the files in .xls format. If you still want an output file
in .csv format you must use the -y option. If you use the -l option the .xls file
will contain multiple tabs with each of the switches discovered. You do not need
to have excel installed on the machine running Switch Miner. It writes out the file 
in Biff5 file format which is Excel 95 and up.

-----------------------------------------------------------------------------------
						New Options in Version 2.50
-----------------------------------------------------------------------------------
The -p option will perform a ping sweep before the switch walk. It pulls the subnet
information from the router specified on the command line and performs a ping sweep
of the entire subnet. This will cause the end results to be more accurate in some 
instances. If you have large subnets /16's or /8's you may not want to use this option
as it will ping every address.

We also added a few new columns for Admin speed and Admin duplex. This does not work
on all switch models so if the field is empty it could not be determined.

-----------------------------------------------------------------------------------
						New Options in Version 2.11
-----------------------------------------------------------------------------------

The -l option will attempt to walk the cdp neighbors found and build files for them.
The community string has to be the same for all the switches found as specified on 
the command line. The layer 3 device also has to be the same to resolve the ip address
to mac address bindings.

Example: sm -s top_level_switch -c public -r router2 -e public -l

The -f option allows you to specify a list of switches to be polled in a text file.
Place the name or ip address of the switches to be polled, one per line in a text file.
The community string has to be the same for all the switches listed along with the layer
3 device for the ip address to mac address bindings.

Example:
switch_list.txt
switch1
switch2
switch3

sm -f switch_list.txt -c public -r router1 -e public