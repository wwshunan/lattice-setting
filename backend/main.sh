#!/usr/bin/env bash
export EPICS_BASE=/opt/epics/base-3.15.7
export EPICS_HOST_ARCH=linux_x86-64
export EPICS_BASE_BIN=${EPICS_BASE}/bin/${EPICS_HOST_ARCH}
export EPICS_BASE_LIB=${EPICS_BASE}/lib/${EPICS_HOST_ARCH}
if [ "" = "${LD_LIBRARY_PATH}" ]; then
  export LD_LIBRARY_PATH=${EPICS_BASE_LIB}
else
  export LD_LIBRARY_PATH=${EPICS_BASE_LIB}:${LD_LIBRARY_PATH}
fi
export PATH=${PATH}:${EPICS_BASE_BIN}
export EPICS_CA_REPEATER_PORT=5065
export EPICS_CA_SERVER_PORT=5064
export PYEPICS_LIBCA=${EPICS_BASE}/lib/linux-x86/libca.so
export EPICS_CA_ADDR_LIST='192.168.3.33 192.168.3.35 192.168.3.40 192.168.6.13 192.168.6.16:5064 192.168.6.16:5066 192.168.6.16:5068 192.168.6.16:5070 192.168.6.16:5072 192.168.6.16:5074 192.168.6.16:5080 192.168.6.17:5064 192.168.6.17:5066 192.168.6.17:5068 192.168.6.17:5070 192.168.6.17:5072 192.168.6.17:5074 192.168.6.17:5076 192.168.6.17:5078 192.168.6.17:5080 192.168.6.17:5082 192.168.6.17:5084 192.168.6.17:5086 192.168.6.17:5088 192.168.6.17:5090 192.168.6.17:5092 192.168.6.17:5094 192.168.6.17:5096 192.168.6.17:5098 192.168.6.17:5100 192.168.6.17:5102 192.168.6.17:5104 192.168.6.17:5106 192.168.6.17:5108 192.168.6.17:5110 192.168.20.195 192.168.20.133 192.168.40.33 192.168.6.9 192.168.2.15 192.168.40.2 192.168.40.13 192.168.40.3 192.168.40.34 192.168.40.35 192.168.40.36 192.168.40.37 192.168.40.38 192.168.40.41 192.168.40.4 192.168.40.5 192.168.40.6'

prog_dir="$(dirname "$0")"
cd "$prog_dir"
log_file="${prog_dir}/main.log"
if [ -f "$config_file" ]; then
    chmod 400 "$config_file"
fi
touch "$log_file"
chmod 600 "$log_file"
date +"Started at %Y-%m-%d %H:%M:%S" >> "$log_file"
exec /usr/bin/python run.py >> "$log_file" 2>&1

