# CacheClear.bat

A simple Windows Batch script to clear common system caches on the **local** PC. Useful for IT support staff, such as helpdesk agents.

Specifically, CacheClear.bat performs the following:

1. Ends Internet Explorer, Adobe Flash Player and Java processes
2. Clears Internet Explorer Temporary Internet Files and Cookies
3. Clears DNS Cache
4. Clears Adobe Flash Player cache (renames cache directory)
5. Clears Java (JRE) Temporary Files (renames cache directory)
6. Clears Java Web Start cache and downloaded applets

## Requirements

This script clears system caches on the **local** PC, for the user account which executes it. For remote PCs, you'll need to copy it to the remote PC, and execute it as the intended user.

## Usage

Simply click on CacheClear.bat or run it from a Command Prompt window. 
