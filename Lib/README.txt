On UNIX the following commands need to be executed to set up the required environment and build the shared library regm.so.
This library is essential for enabling regex functionality in the application. Here's a step-by-step explanation of the commands:

- apt-get update
- apt-get install -y gcc
- apt-get install -y libpcre3-dev
- gcc -c Lib/regm.c -fPIC -lpcre -o regm.o
- gcc -shared regm.o -lpcre -o regm.so