# Unix & C – Unix Lab
Jorge López <jorge.lopez-c@airbus.com> - January 2022

This lab was partially taken from our lab originally developed by myself and José Reyes found in here: [https://github.com/letitbeat/unix-lab.](https://github.com/letitbeat/unix-lab)[ ](https://github.com/letitbeat/unix-lab)
The lab consists of three tasks with value 6 (for Task 1), 6 (for Task 2) and 8 (for Task 3).

## Task 1

For the first task we will be implementing a basic arithmetic calculator, our calculator should accept 2 arguments from the arguments and compute the addition, difference, multiplication and division of the provided arguments.

Example of the expected output:

```bash
$ ./calculator 20 3
sum 20 + 3 = 23
diff 20 - 3 = 17
mult 20 * 3 = 60
div 20 / 3 = 6
```
***Hints: variables, arithmetic, if statements.***

## Task 2

For the last task of this laboratory, we will fetching and manipulating data! Fetching/accessing data from the web is a very common task nowdays and Unix-like systems provide us with very handy tools to do so. 
The first step to complete this task is to fetch the data in CSV format from the following url: [https://bit.ly/2ATet9V](https://bit.ly/2ATet9V )[ ](https://bit.ly/2ATet9V )and store it in the current directory.

Once we have the file which contains information of users in the following structure: id, fist name, last name, email our task is to list the data in the following format fist name last name, email but obfuscating the email so we don't show sensitive information of the users in the console!

Example of execution:

```bash
$ ./data-processor
Leo Scoles , lscolesg@ ****.***
Emmanuel Staff , estaffa@ ****.***
Suzann Terne , sternen@ ****.***
...
...
```
***Hints: curl -L, sed***

## Task 3

As discussed in class, the utility kill requires the process id (pid) of the process to send a specific signal. killall kills processes by name, which is more convenient. However, there does not exists the killreg utility that kills processes which match a given regular expression. Your task is to implement killreg.

The program takes one or two inputs as command line arguments. The first is an optional signal, which must start with a hyphen, for example "-9", "-KILL", "-TERM". If no signal is specified, by default the "-TERM" signal should be sent. The second argument is the pattern to match in the grep convention.

These are the expected outputs:

First, with no arguments:

```bash
$./ killreg
Error, at least one argument is required !
Usage: ./killreg [-SIGNAL] <PATTERN>
    -SIGNAL: an optinal signal to pass to the programs that match the <PATTERN>, e.g., -9, -TERM, etc. By default the -TERM signal sent.
    PATTERN: a required pattern, ./killreg kills all processes which match this pattern.
```
With two arguments without the proper hyphen in the first parameter:

```bash
$ ./ killreg TERM vi
Error, the first argument must start with a hyphen Usage: ./killreg [-SIGNAL] <PATTERN>
    -SIGNAL: an optional signal to pass to the programs that match the <PATTERN>, e.g., -9, -TERM, etc. By default the -TERM signal is sent.
    PATTERN: a requried pattern , ./ killreg kills all processes which match this pattern.
```

With two arguments properly:

```bash
$ jobs
[1]  Stopped            vi a
[2]- Stopped            vim b
[3]+ Stopped            vim c

$ ./ killreg -9 vi
[1]  Killed             vi a
[2]- Killed             vim b
[3]+ Killed             vim c
$
```

With a single argument:
```bash
$ jobs
[1]  Stopped            vim a
[2]- Stopped            vi b
[3]+ Stopped            vim c

$ ./killreg vi 
$ jobs
[1]  Stopped            vim a
[2]- Stopped            vi b
[3]+ Stopped            vim c

$ fg 1
vim a
Vim: Caught deadly signal TERM. Vim: Finished.
Terminated

$ fg 2
vi b
Vim: Caught deadly signal TERM. Vim: Finished.
Terminated

$ fg 3
vim c
Vim: Caught deadly signal TERM. Vim: Finished.
Terminated
$
```

Suppress all errors from the underlying commands (kill or killall). Note how in the examples there is never a report of root user processes or others not being able to be killed.

A word of warning. Do not execute your shell script as root as you may kill some process that matches a name and you will have to restart your system. Potentially, you can kill something that may corrupt your operating system (hard to believe but, it may happen). So, please, use a regular user.

***Hint: killall, if, grep, awk, command execution, for***

## Submission instructions

Please, upload your three scripts packed in a single .tgz (or .zip, or .tar.gz) file and upload them to Moodle. I hope you have fun!