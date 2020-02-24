@echo off
echo Starting Typhon...
echo on

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "c:\repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Users\nwbrown\Documents\TwinCAT3 workspace\lcls-plc-kfe-gmd-vac\plc\:/reg/g/pcds/epics/ioc/plc-kfe-gmd-vac" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
	"cd '/reg/g/pcds/epics/ioc/plc-kfe-gmd-vac/iocBoot/ioc-plc-kfe-gmd-vac-sim' && pytmc stcmd --template-path /ads-deploy/tools/templates --template typhon_display.py --only-motor """/reg/g/pcds/epics/ioc/plc-kfe-gmd-vac/plc-kfe-gmd-vac/plc-kfe-gmd-vac.tsproj""" > /tmp/display.py && echo 'Running Typhon...' && python /tmp/display.py; sleep 1"
