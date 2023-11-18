#!/bin/bash
declare -r timestamp=$(date)

declare -r logdir=connectivity-logs
if [[ ! -d "${logdir}" ]]; then
	mkdir "${logdir}"
fi

declare -r fn=${logdir}/$(date +%Y-%m-%d-connectivity.txt)
if [[ ! -e "${fn}" ]]; then
	echo "Connectivity check for ${timestamp}" > "${fn}"
fi

pingTarget()
{
	declare -r target=$1
	declare -r targetName=$2

	ping -c 1 -q "${target}" > /dev/null 2>&1
	declare -r pingResult=$?
	if [[ "${pingResult}" -ne 0 ]]; then
		echo "${timestamp} lost contact with ${targetName} ${target}" >> "${fn}"
		exit 1
	fi
}

# Can we ping our internal router?
pingTarget 192.168.0.1 "default gateway"

# What about the ISP's modem?
pingTarget 10.0.0.1 "ISP modem"

# Finally, let's try an external site
pingTarget dns.google.com "External site"
