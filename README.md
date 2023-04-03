<div align=center>
<h1>📖 42_minishell_tester</h1>
<img align=center src="https://github.com/zstenger93/42_minishell_tester/blob/main/result.png">

<h1>Disclaimer</h1>
<h2>Try to write your own test first and don't just run a tester mindlessly</h2>
<h2>You don't have to pass all the cases in this tester</h2>
<h2>If you want to check leaks outside of your manual checking:</h2>

[This is good one to check valgrind](https://github.com/thallard/minishell_tester)
<h2></h2>
<h1>The people made this tester possible</h1>

Base made by: [Tim](https://github.com/tjensen42) & [Hepple](https://github.com/hepple42)

Upgraded by: [Zsolt](https://github.com/zstenger93)

and

```
My minishell pain
```

<h1>How To Use</h1>
<h3>First you should comment out everything what prints to terminal eg "exit" at exit</h3>
<h3>Then modify your main loop:</h3>
<h3>You should only read with readline and use your own prompt when you launch the program by yourself typing ./minihsell into the terminal, you can check it this way:</h3>
</div>

```c
	if (isatty(fileno(stdin)))
		shell->prompt = readline(shell->terminal_prompt);
```

<h3 align=center>Else if it is opened by another program/tester for example then use gnl as follows</h3>

```c
	char *line;
	line = get_next_line(fileno(stdin));
	shell->prompt = ft_strtrim(line, "\n");
	free(line);
```

<h3 align=center>So it should look like something like this:</h3>

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
<div align=center>
<h3>I think from this you pretty much can figure it out, it isn't a big change :)</h3>
<h2>How to launch the tester</h2>
<h3>Clone it to the root of your minishell</h3>
<h3>cd to the testers folder</h3>

```bash
bash tester.sh m
```

<h3>options: m, b, a</h3>
<h3>Feel free to ask on slack if you have a question</h3>
<h3>Or open a pull request if you would like to add more test</h3>
<h3>Looking for people who would like to add more tests to the bonus part, because we haven't done it</h3>
</div>