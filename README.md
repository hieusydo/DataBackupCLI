# DataBackupCLI
Simple utilities to backup data. *Why did I do this?* I couldn't find a suitable alternative: SyncToy for Win was outdated and gave weird behaviors on Windows 10; Carbon Copy Cloner for Mac was expensive for my simple use case (it's a very nice piece of software tho). 

## Usage
- Each folder contains the script to run in its corresponding operating system (the script inside `unix` should be compatible with Mac OS and most Linux distros). 
- **Please edit the script and replace the source and destination folders.** You might be interested in modifying other parameters as well.
- The scripts will create a **mirror** copy, i.e. destination folder will be changed to look exactly like source. 

## Components
The scripts are essentially calling these programs behind the scene:
- [robocopy](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy)
- [rsync](https://www.man7.org/linux/man-pages/man1/rsync.1.html)

## Future Works
- [ ] Add user prompts asking for inputs and confirmation. 
- [ ] Remote backup. 
