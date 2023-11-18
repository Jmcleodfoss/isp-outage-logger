# isp-outage-logger
A simple script to monitor for ISP outages

For best results, this should be installed on a Linux system that is always up. I run it on a RaspberryPi as a cronjob executing every 5 minutes, and check it the results if the internet goes out. If it logs that there is no connectivity to the external site checked, I call my ISP and get a rebate for the day.

The checked hosts are as follows; you will probably need to change some of these depending on your setup (I have my own router connected to the ISP's modem so I don't need to change anything when I alternate provides between Bell and Rogers).

1.	192.168.0.1, the presumed local router
1.	10.0.0.1, the local IP address of the ISP modem
1.	dns.google.com, which should be up almost all the time
