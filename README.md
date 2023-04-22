
<h1 align=center>📖 42_minishell_tester</h1>
<img align=center src="https://github.com/zstenger93/42_minishell_tester/blob/main/result.png">
<img align=center src="https://github.com/zstenger93/42_minishell_tester/blob/main/leakcheck.png">

---

<h1>Updates</h1>
Tests without environment now are updated, separated and can be run with:

```bash
bash tester.sh ne
```

Now they should be working better, still don't trust it 100% and do test yourself as well to understand.
It's a bit tricky to do test's well in this case because if you run `env -i bash` it disables only partially.
It will still have most things, but if you do `unset PATH` afterwards, will see the difference.
Also this part is pretty much what you aren't required to handle.
The main point is to not to crash/segfault when you launch without environment.

---

<h1>Disclaimer</h1>
Don't trust 100% the leak check, try it yourself as well and the linked tester below
Try to write your own test first and don't just run a tester mindlessly
You don't have to pass all the cases in this tester
If you want to check leaks outside of your manual checking:

[This is good one to check valgrind](https://github.com/thallard/minishell_tester)
A bit more time to set it up, but worth it
The first time if you run the tester above and expect a lot of errors
Then redirect each of the output from stdin and strerror to a file otherwise you won't be able see all of the errors

---

<h1>The people made this tester possible</h1>

Base made by: [Tim](https://github.com/tjensen42) & [Hepple](https://github.com/hepple42)

Upgraded by: [Zsolt](https://github.com/zstenger93)

Parsing hell by: [Kārlis](https://github.com/kvebers)

and

```
My minishell pain
```
---

<h1>How To Install and run</h1>

To install the script, copy and run following command:

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zstenger93/42_minishell_tester/main/install.sh)" 
```

The tester will be installed in the `$HOME/42_minishell_tester` directory.

After installation an alias `mstest` will be automaticly added in `.zshrc` or `.bashrc`

So that you can run the program in any directory (where your minishell is) by calling

```
mstest
```

---

<h1>How To Use</h1>
First you should comment out everything what prints to terminal eg "exit" at exit, printf's for debugging etc
Then modify your main loop:
You should only read with readline and use your own prompt when you launch the program by yourself typing ./minihsell into the terminal, you can check it this way:


```c
	if (isatty(fileno(stdin)))
		shell->prompt = readline(shell->terminal_prompt);
```

Else if it is opened by another program/tester for example then use gnl as follows

```c
	char *line;
	line = get_next_line(fileno(stdin));
	shell->prompt = ft_strtrim(line, "\n");
	free(line);
```

So it should look like something like this:

```c
	if (isatty(fileno(stdin)))
		shell->prompt = readline(shell->terminal_prompt);
	else
	{
		char *line;
		line = get_next_line(fileno(stdin));
		shell->prompt = ft_strtrim(line, "\n");
		free(line);
	}
```

I think from this you pretty much can figure it out, it isn't a big change :)

---

<h1>How to launch the tester</h1>
Clone it to the root of your minishell
cd to the testers folder
<h2>OPTIONS</h2>

```bash
bash tester.sh m
```
```bash
bash tester.sh vm
```
```bash
bash tester.sh ne
```
```bash
bash tester.sh b
```
```bash
bash tester.sh a
```

---

Feel free to ask on slack if you have a question
Or open a pull request if you would like to add more tests
Looking for people who would like to add more tests to the bonus part, because we haven't done it
