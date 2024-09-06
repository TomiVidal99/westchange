# Westchange zsh plugin

It's a simple plugin that allows you to quickly change between directories.
The way it works it's that you store/save a directory to a file, later you can change to these directories by sorting through that list using the fzf utility. Simple yet effective (for it to be this way I highly recommend that you setup the hotkey to switch).

## Dependencies
- fzf (fuzzy finder)

## Installation

### Manual

Just source the entry point `$>source westchange.sh`

### Oh-my-zsh

It integrates with the plugin installer

## Settings

You can set the path of the file that stores the saved paths/directories by setting _WC_DIRECTORIES_.
By default:
```bash
WC_DIRECTORIES=${0:A:h}/directories
```
