"""
Configure the Python REPL, `python -q`
"""
try:
    import atexit
    import os
    import readline
    import sys
    # import gnureadline as readline
except ImportError as exception:
    print('Shell Enhancement module problem: {0}'.format(exception))
else:
    # Enable Tab Completion
    # OSX's bind should only be applied with legacy readline.
    if sys.platform == 'darwin' and 'libedit' in readline.__doc__:
        readline.parse_and_bind("bind ^I rl_complete")
    else:
        readline.parse_and_bind("tab: complete")

    # Enable History File
    histfile = os.path.join(os.getenv("XDG_STATE_HOME", os.path.expanduser("~/.local/state")), "python_history")

    if os.path.isfile(histfile):
        readline.read_history_file(histfile)
        readline.set_history_length(1000)
    else:
        open(histfile, 'a').close()

    atexit.register(readline.write_history_file, histfile)
    print('Booted pythonstartup.py.')
