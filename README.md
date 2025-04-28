# Fawry-Internship-Tasks

## Q1 : **Custom Command ([`mygrep.sh`])**
---------------------------------------------------------------

You're asked to build a mini version of the grep command. Your script will be called `mygrep.sh`
and must support:
**🔹 Basic Functionality**
• Search for a string (case-insensitive)
• Print matching lines from a text fil
**🔹 Command-Line Options:**
• `-n` → Show line numbers for each match
• `-v` → Invert the match (print lines that **do not** match)
• Combinations like `-vn`, `-nv` should work the same as using `-v` `-n`

**🛠️ Technical Requirements:**

1.  The script **must be executable** and accept input as:
    
2.  It must **handle** invalid input (e.g., missing file, too few arguments).
    
3.  Output must **mimic grep's style** as closely as possible.
    

**🧪 Hands-On Validation:** You **must test your script** with the file testfile.txt containing the following:
Hello world
This is a test
another test line
HELLO AGAIN
Don't match this line
Testing one two three
✅ Include:
• Screenshot of your terminal running the script with:
◦ ./mygrep.sh hello testfile.txt
◦ ./mygrep.sh -n hello testfile.txt
◦ ./mygrep.sh -vn hello testfile.txt
◦ ./mygrep.sh -v testfile.txt (expect: script should warn about missing search string)

**🧠 Reflective Section**
In your submission, include:

1.  A breakdown of **how your script handles arguments and options.**
    
2.  A short paragraph: **If you were to support regex or -i/-c/-l options, how would your structure change?**
    
3.  What part of the script was hardest to implement and why?
    

**🏆 Bonus:**
• Add support for `--help` flag to print usage info.
• Improve option parsing using getopts.

## Q2 : **Scenario**
-----------------

Your internal web dashboard (hosted on `internal.example.com`) is suddenly unreachable from multiple systems. The service seems up, but users get “host not found” errors. You suspect a DNS or network misconfiguration. Your task is to troubleshoot, verify, and restore connectivity to the internal service.

**🛠️ Your Task:**

1.  Verify DNS Resolution:Compare resolution from /etc/resolv.conf DNS vs. `8.8.8.8`.
    
2.  Diagnose Service Reachability:Confirm whether the web service (port 80 or 443) is reachable on the resolved IP.Use curl, telnet, netstat, or ss to find if the service is listening and responding.
    
3.  Trace the Issue – List All Possible Causes**🧪** Your goal here is to identify and list all potential reasons why [`internal.example.com`] might be unreachable, even if the service is up and running. Consider both DNS and network/service layers.
    
4.  Propose and Apply Fixes
✅ For each potential issue you identified in Point 3, do the following:
    
5.  Explain how you would confirm it's the actual root cause
    
6.  Show the exact Linux command(s) you would use to fix it
    

**🧠** **Note:**
Please include screenshots that demonstrate how you identified and resolved the issue

**🏆 Bonus:**
Configure a local /etc/hosts entry to bypass DNS for testing.
Show how to persist DNS server settings using systemd-resolved or NetworkManager.