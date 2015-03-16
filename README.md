# Pry Man

Manual pages for Pry. You might have noticed that there are parts of the system
that Pry doesn't quite reach, even if you install
[pry-doc](https://rubygems.org/gems/pry-doc), such as keywords and the vars like
`$0`, `$:`, etc. It will probably be eventually merged with Pry Doc.

This project will fix that, and anything else along these lines.

## Examples

List all mans.

```
[2] pry(main)> mans
globals: $!  $$  $&  $'  $*  $+  $,
keywords: $"  BEGIN  END  __ENCODING__
constants: ARGF  ARGV  DATA  ENV  FALSE
pry: commands  pryrc
```

Mans for Pry.

```
[1] pry(main)> ? pryrc

pryrc (pry)
--
The `.pryrc` file is analogous to the `.irbrc` file for IRB.  You can use the
`.pryrc` file to customize Pry.
...
...
```

Mans for constants

```
[3] pry(main)> ? TRUE

TRUE (constants)
--
The typical true value.
```

Mans for global variables.

```
[4] pry(main)> ? $$

$$ (globals)
--
The process number of the Ruby running this script.
```

Mans for keywords

```
[7] pry(main)> ? else

else (keywords)
--
Denotes a final conditional branch. It appears in connection with if, unless,
and case, and rescue. (In the case of rescue, the else branch is executed if no
exception is raised). The else clause is always the last branch in the entire
statement, except in the case of rescue where it can be followed by an ensure
clause.

* Execute also: ? if
* Execute also: ? unless
* Execute also: ? case
* Execute also: ? rescue
```

## Wiki-sourced.

This project's [wiki](https://github.com/kyrylo/pry-man/wiki) hosts
the canonical home for the data.

Edit away! (I mean that. I'd love to add in whatever additional thoughts you
have. The goal is to be really informative, so your perspective and examples
count for a lot.)

## License

Yeah, right!

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
<a rel="license" href="http://creativecommons.org/publicdomain/zero/1.0/">
<img src="http://i.creativecommons.org/p/zero/1.0/80x15.png" style="border-style: none;" alt="CC0" />
</a>
<br />
To the extent possible under law, <a rel="dct:publisher" href="http://github.com/rking/pry-docmore"> <span property="dct:title">☈king</span></a> has waived all copyright and related or neighboring rights to <span property="dct:title">pry-docmore</span>.

This work is published from: <span property="vcard:Country" datatype="dct:ISO3166" content="US" about="http://github.com/rking/pry-docmore"> United States</span>.
</p>
