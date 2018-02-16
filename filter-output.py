#!/usr/bin/python
# for use with kriderj's login.sh to generate an output file
# i.e.  login.sh 'grep syscontact /etc/snmp/snmpd.conf' > syscontact.output

from optparse import OptionParser
import sys

def main():
    tempy = ''
    parser = OptionParser()
    parser.add_option('-s', '--searchfor', dest='searchfor')
    (options, args) = parser.parse_args()
    if len(args) != 1:
        parser.print_help()
        sys.exit(-1)
    filename = sys.argv[1]
    searchfor = options.searchfor
    data = open(filename).readlines()
    if searchfor:  # if there is a -s entry to search for
        for i in range(len(data)):
            if data[i].strip().find(searchfor) != -1:     # if it finds the searchfor string
                while not data[i-1].startswith("*"):  #  goes through the output until it reaches the servername 
                    i = i - 1
                else:
                    if tempy != data[i-1]:
                        print data[i-1].strip('\n,\ ,\*\*v')
                    tempy = data[i-1]
                #if data[i-1].startswith("*"):
                #    print data[i-1].strip()
    else:       # if this script is run without -s we will give all servernames that did not have any output
        for i in range(len(data)):
            if data[i].startswith("**") and data[i+1].startswith("**"):   # check to see if the next line after the servername is another servername (**v indicates a servername)
                print data[i].strip('\n,\ ,\*\*v')

if __name__ == "__main__":
    try:
        main()
    except IOError:  # This is caused when piping to a command like head, that sends a 
        pass
    except KeyboardInterrupt:
        print "Impatient, huh?  Ok...cleaning up!"
