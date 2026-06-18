
Historically, URLs were designed to resemble file system paths.

For example:

```text
https://example.com/docs/
```

looks like a **directory**, while

```text
https://example.com/docs
```

looks like a **file**.

On a traditional web server:

```text
/docs/      -> directory
/docs       -> file
/docs/index.html -> file inside the directory
```

So these are technically **different URLs** and can return different resources.


---

### Do slashes always matter?

Yes. According to URL standards:

```text
https://example.com/favorite
```

and

```text
https://example.com/favorite/
```

are different URLs.

A server _may_ choose to treat them as equivalent, but that's server-specific behavior.

For example:

```text
https://example.com/api/users
https://example.com/api/users/
```

could return completely different responses if the server is configured that way.

---

### Why many frameworks use trailing slashes

Frameworks like Django adopted a convention similar to directories:

```text
/posts/
/users/
/products/
```

while some other frameworks and APIs (e.g. many REST APIs) prefer no trailing slash:

```text
/posts
/users
/products
```

Neither is more correct; consistency is what matters.

With Django, the usual practice is:

```python
path("favorite/", ...)
```

and then always generate URLs using:

```html
{% url 'favorite' %}
```

instead of hardcoding paths, so you never have to worry about whether the slash is present.