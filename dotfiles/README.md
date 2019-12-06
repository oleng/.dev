### Overview

`.bash_profile` is by default executed for interactive login shells before the initial command prompt.[¹](#1) So macOS computers have `.bash_profile` for each account, and/or other `.*profile` file for each shell. There is also a `profile` file that configures every instances of shell, this system wide profile file is in `/etc/profile`.
`.bashrc` on the other hand is for non-interactive login shell, so if you're using it you have to source it to run it.[²](#2)

On macOS, Terminal by default runs a login shell every time so `.bash_profile` is executed for every window/instances[¹](#1). This is convenient, but at the same time is also confusing, it can even be a failure/security weakness point.

This is why I'm following the consensus for exploiting `.bashrc` to separate settings and, most importantly, functionalities from `.bash_profile`:

- `.bash_profile` is the main store for `PATH` definitions,
- it is used by (mostly all) CLI applications & their dependencies,
- there are applications that frequently modifies it during their life cycle, like python's virtualenv & conda for their sessions.

Another way to see the benefit of not putting everything in `.bash_profile` is to make analogy of keeping JS & CSS definitions separate instead of inside a single HTML file. By keeping a distinct separation of functionalities in different files and linked them when needed, it's easier to track, navigate & modify different parts without risking errors (race condition is probably the worst possible scenario).

So keeping some settings apart or making them less inaccessible by _any_ application scope is important. The ease & benefit of compartementalizing configs, settings or even secret keys while still having access to that main resource are obvious when all applications are accessing the same file. This is the same reasoning behind the designs of sandbox & virtual container.

In term of importance the whole execution chain for shell(s) in macOS can be viewed like this:

					/etc/profile
						|
						|
					~/.bash_profile
						|
						|
			.secrets <--   ~/.bashrc   --> ~/.aliases


---

<a name='1'></a>
1. [https://apple.stackexchange.com/questions/51036/what-is-the-difference-between-bash-profile-and-bashrc](https://apple.stackexchange.com/a/51038)
<a name='2'></a>
2. [https://unix.stackexchange.com/questions/38175/difference-between-login-shell-and-non-login-shell/](https://unix.stackexchange.com/a/46856)
<a name='3'></a>
3. https://apple.stackexchange.com/questions/12993/why-doesnt-bashrc-run-automatically