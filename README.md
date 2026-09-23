# dotcommander Homebrew tap

`ctxgo` and `jskill` download source archives from private GitHub repositories.
An authenticated GitHub token with access to each repository is required.

If you already use `gh`, pass its token to Homebrew for the command:

```sh
HOMEBREW_GITHUB_API_TOKEN="$(gh auth token --hostname github.com)" brew install dotcommander/tap/ctxgo
HOMEBREW_GITHUB_API_TOKEN="$(gh auth token --hostname github.com)" brew install dotcommander/tap/jskill
```

For an upgrade, use `brew upgrade` in place of `brew install`.

You can instead set `HOMEBREW_CTXGO_GITHUB_TOKEN` or
`HOMEBREW_JSKILL_GITHUB_TOKEN` for the corresponding formula. A formula-specific
variable takes precedence when it is set, including when set to an empty value.
Unset it to use `HOMEBREW_GITHUB_API_TOKEN`. The `gh` login alone does not pass a
token to Homebrew.

The formulas pass the token only to the archive download. Homebrew expands its
deferred environment marker at download time, keeping the credential out of
formula metadata.
