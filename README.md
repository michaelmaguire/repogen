repogen
=======

Downloads a full set of Lua release tarballs from [lua.org] and turns
them into a [Git] commit history.

Requirements
------------

* [GNU Make] `>= 3.81`
* [Git]
* [Curl]

Usage
-----

Install the *requirements* as above, then use the command:

    make

This will generate a git repository in the `repo/` directory, which
takes approximately 30 seconds.

[License]
---------

Copyright (c) 2015, Craig Barnes.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


[License]: https://en.wikipedia.org/wiki/ISC_license "ISC License"
[lua.org]: https://www.lua.org/
[GNU Make]: https://www.gnu.org/software/make/
[Git]: https://git-scm.com/
[Curl]: https://curl.haxx.se/
