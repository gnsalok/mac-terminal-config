# Productive macOS Terminal Setup

Use this repo to bootstrap a clean, fast developer terminal on macOS. It pairs Oh My Zsh with Starship using the curated configs in `mac-terminal-files/.zshrc` and `mac-terminal-files/starship.toml`.

## 1. Install prerequisites
1. Update macOS and install the Command Line Tools:
   ```bash
   xcode-select --install
   ```
2. Install Homebrew if needed:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

## 2. Install terminal essentials
```bash
brew install zsh starship zsh-autosuggestions zsh-syntax-highlighting
```
Optional quality-of-life extras:
```bash
brew install iterm2 eza fzf bat git-delta ripgrep fd tmux
```

## 3. Set up Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
The installer adds `~/.zshrc` and sets `$ZSH` in `~/.zprofile`.

## 4. Apply the repo configuration
```bash
# Back up current files
cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d-%H%M%S)
cp ~/.config/starship.toml ~/.config/starship.toml.backup 2>/dev/null || true

# Copy curated configs
cp mac-terminal-files/.zshrc ~/.zshrc
mkdir -p ~/.config
cp mac-terminal-files/starship.toml ~/.config/starship.toml
```
Reload the shell with `exec zsh` or by opening a new terminal window.

### What `.zshrc` provides
- Sources `~/.zprofile` so exported variables apply to every interactive shell.
- Assumes an `~/.aliases` file for personal shortcuts—create it if missing.
- Enables the `robbyrussell` theme plus `git`, `zsh-autosuggestions`, and `zsh-syntax-highlighting` plugins.
- Initializes Starship (`eval "$(starship init zsh)"`).
- Adds a `clear` alias (`printf "\033c"`) for a full buffer reset.

### What `starship.toml` controls
- Fish-like prompt showing only directory, git branch, and the prompt symbol.
- Truncates directories to three segments and adds a read-only indicator.
- Colors: blue directory, purple branch, green/red prompt depending on exit status.
- Disables noisy modules (Python, Node, AWS, etc.) for focus.

## 5. Suggested `~/.aliases`
```bash
alias gs='git status -sb'
alias gl='git pull --rebase --autostash'
alias k='kubectl'
alias ll='eza -lag --icons'
```
Adjust to your workflow.

## 6. Verify the setup
1. Open a new terminal tab.
2. Run `zsh --version` to confirm the Homebrew build is active.
3. Run `ls`, `git status`, etc., and check:
   - Autosuggestions appear in gray.
   - Syntax highlighting colors commands live.
   - Prompt shows `[dir] on  branch ❯` with the colors described above.

## 7. Customize further
- Switch Oh My Zsh themes or add plugins in `~/.zshrc`.
- Toggle Starship modules by editing `~/.config/starship.toml`.
- Extend tooling via Homebrew (`brew install starship-completions mongosh awscli`, etc.).

## 8. Troubleshooting
- Prompt issues? Run `starship explain` to inspect active modules.
- Missing autosuggestions/highlighting? Reinstall the plugins via Homebrew and ensure the plugin names exist in the `plugins=(...)` array.
- Restore old settings using the backups created earlier.

You now have a solid, repeatable macOS terminal configuration optimized for daily development.
