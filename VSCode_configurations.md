# Setting up VSCode to Play with WSL nicely
In order to fully use VSCode with WSL, you want to make sure that you are using the git that comes with WSL 
and not the Git for Windows since they are two different programs and will fight with each other over who
has control of the index, which will prevent you from doing anything with git aside from gitdiff. 
Also, to debug you need to have some initial configurations.

# WSL Git for VSCode
This is a two part operations. 
First, you'll need to create a `git.bat` file and store it somewhere, such as `C:\Users\Chris\git.bat`. 
This locates the `git` executable in your WSL path and sets it up as a Windows batch file so that VSCode plays along nicely. 
I have taken this setup from [here](https://gist.github.com/victor-perez/8ba25540394ec68b11f4b2699fb4d4ce).

```
@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

this also support calls that contains a absolute windows path

check of one of the params contain a absolute windows path
echo.%  findstr r c[a-z][]  nul
if %errorlevel% == 1 (
		if not just git with the given parameters
		call git %
		exit b
		)

loop though the params and replace the path with a wslpath
param_loop
set param_check=%1
if defined param_check (
		call get_wslpath %param_check% R_PATH
		if defined params (
			set params=%params% !R_PATH!
			) else (
				set params=!R_PATH!
			       )    
		) else (
			goto param_continue
		       )
	shift
	goto param_loop
	param_continue
	last call git with the new params
	call git %params%
	exit b

	git label
	git
	set params=
	first try the call with wslpath
	needed for calls that return a wslpath like git rev-parse --show-toplevel
	wsl wslpath -w $(git %) 2 nul 
	if not %errorlevel% == 0 (
			if the call didn't return a wslpath try again without wslpath
			wsl git %
			)
	exit b

	get wslpath label
	get_wslpath
	set wslpath_param=%1
	check of current param has windows path
	echo %wslpath_param%  findstr r b c[a-z][]  nul
	if %errorlevel% == 0 (
			get wslpath
			for f tokens= USEBACKQ %%F IN (`wsl wslpath %wslpath_param%`) do (
				set wslpath_result=%%F
				)
			) else (
				set wslpath_result=%wslpath_param%
			       )
	set %2=%wslpath_result%
	exit b
	@echo on
```

In `settings.json`, you'll then need to add this line (or whever you stored the
.bat file):

```
"git.path": "C:\\Tools\\git.bat",
```



# Debugging with WSL 
While I would normally suggest debugging using the [Native Debug
extension](https://github.com/WebFreak001/code-debug), it does not support WSL
and so we will use [Microsoft's C/C++
extension](https://github.com/Microsoft/vscode-cpptools). Below are the
configurations.  A note of warning, you will need to compile the program in WSL
itself in order to debug the following manner. I typically compile in command
line using makefile via the terminal that comes with VSCode.

You will have to make some changes to the specific paths, most notably where your WSL files are located (in the sourceFileMap).
You will also need to have explicit paths to the executable that you wish to debug.


```
{
	"name": "C++ Launch (WSL)",
		"type": "cppdbg",
		"request": "launch",
		"program": "/root/code/dmft-lc/debug",
		"args": [
			"-fThreading"
		],
		"stopAtEntry": false,
		"cwd": "/root/code/dmft-lc",
		// "cwd": "${workspaceRoot}/", // leave it like this
		"environment": [],
		"externalConsole": true,
		"windows": {
			"MIMode": "gdb",
			"setupCommands": [
			{
				"text": "-enable-pretty-printing",
				"description": "enable pretty printing",
				"ignoreFailures": true
			},
			{
				"text": "handle SIGPIPE nostop noprint pass",
				"description": "ignore SIGPIPE",
				"ignoreFailures": true
			}
			]
		},
		"pipeTransport": {
			"pipeCwd": "",
			"pipeProgram": "c:\\windows\\sysnative\\bash.exe",
			"pipeArgs": [
				"-c"
			],
			"debuggerPath": "/usr/bin/gdb"
		},
		"sourceFileMap": {
			"/mnt/c/": "C:\\",
			"/root": "${env:LOCALAPPDATA}/lxss/root",
		}
}
```


# Making with VSCode

The easiest way to make files is by having a makefile and using that to generate
what you need. I am still looking into how to make via VSCode but using `make`
in the terminal has not left me wanting for additional functionality, so I would
recommend using this instead.
