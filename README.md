# interntask1
![image](https://github.com/cadnitrahul/interntask1/assets/89523362/89118508-4f7a-44d9-a09c-5fdda4af1d34)
![image](https://github.com/cadnitrahul/interntask1/assets/89523362/3d16b07e-555a-4742-90c1-512bdb787965)
nano internsctl.sh is the command use to make the file name for the task.

Then we write the code in this file.

After this we switch to the root of the linux.

then we run chmod +x internsctl.sh

after that cp internsctl.sh /usr/local/bin

then last cd /usr/local/bin 

and we are able to perform all the task mentioned.

.TH INTERNSCTL 1 "January 2023" "internsctl v0.1.0"

.SH NAME

internsctl \- Custom Linux Command

.SH SYNOPSIS

\fBinternsctl\fR \fBCOMMAND\fR [\fBOPTIONS\fR]

.SH DESCRIPTION

Custom Linux command for various operations.

.SH COMMANDS

.TP

.B cpu getinfo

Get CPU information.

.TP

.B memory getinfo

Get memory information.

.TP

.B user create \fI<username>\fR

Create a new user.

.TP

.B user list [\fR--sudo-only\fR]

List all regular users or only those with sudo permissions.

.TP

.B file getinfo \fI<file-name>\fR [\fR--size | -s | --permissions | -p | --owner | -o | --last-modified | -m\fR]

Get information about a file. Options to obtain specific information.

.SH OPTIONS

.TP

.B \fR--help\fR

Display this help message.

.TP

.B \fR--version\fR

Display command version.

.SH EXAMPLES

Display examples here.

.SH SEE ALSO

.BR lscpu (1), \fBfree\fR (1), \fBuseradd\fR (8), \fBgroups\fR (1), \fBstat\fR (1)

.SH AUTHOR
