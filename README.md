<h1>42_minishell_tester</h1>
<h2>How To Use</h2>
<h3>First you should comment out everything what prints to terminal eg "exit" at exit</h3>
<h3>Then modify your main loop:</h3>
<h3>You should only read with readline and use your own prompt when you launch the program by yourself typing ./minihsell into the terminal</h3>

```c
	if (isatty(fileno(stdin)))
		shell->prompt = readline(shell->terminal_prompt);
```

<h3>Else if it is opened by another program/tester for example then use readline as follows</h3>

```c
	char *line;
	line = get_next_line(fileno(stdin));
	shell->prompt = ft_strtrim(line, "\n");
	free(line);
```

<h3>So it should look like something like this:</h3>

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

<h3>I think from this you pretty much can figure it out :)</h3>
<h2>How to launch the tester</h2>
<h3>Clone it to the root of your minishell</h3>
<h3>cd to the testers folder</h3>

```bash
	bash tester.sh m
```

<h3>options: m, b, a</h3>
<h3>The people made this tester possible:</h3>

Base made by: [Tim](https://github.com/tjensen42) && [Hepple](https://github.com/hepple42)
Upgraded by: [Zsolt](https://github.com/zstenger93)

```
My minishell pain
```

<h3>Feel free open a pull request to add more test</h3>
