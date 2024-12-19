set -e
export DLC=/psc/dlc
export PATH=$DLC/bin:$PATH
export PROJECT_NAME=$(echo `pwd` | rev | cut -f2 -d'/' - | rev);

# Create PASOE instance
export DLC=/psc/dlc &&\
        cd /psc/wrk &&\
        /psc/dlc/bin/pasman create -v oepas1

# Replace all occurances of logs directory to volume mount
find ./ -type f -exec sed -i -e 's/${catalina.base}\/logs/\/var\/log/gI' {} \;

# Copy application files - startup parameters - REST service
cp /app/${PROJECT_NAME}.props /psc/wrk
cp /app/${PROJECT_NAME}.war /psc/wrk

# Copy ABL files to PASInstance - extracting from zip file
unzip /app/${PROJECT_NAME}.zip -d /psc/wrk/oepas1/openedge

# Update startup parameters
cd /psc/wrk &&\
/psc/wrk/oepas1/bin/oeprop.sh -v -f /psc/wrk/${PROJECT_NAME}.props

# Deploy REST service
cd /psc/wrk &&\
/psc/wrk/oepas1/bin/tcman.sh deploy -v /psc/wrk/${PROJECT_NAME}.war