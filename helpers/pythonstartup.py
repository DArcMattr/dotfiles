"""
Configure the Python REPL, `python -q`
"""
try:
    import readline
    import atexit
    import os
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
    HISTORY_FILE = os.environ.get(
        "PYTHON_HISTORY_FILE", os.path.join(os.environ['HOME'],
                                            '.pythonhistory'))

    if os.path.isfile(HISTORY_FILE):
        readline.read_history_file(HISTORY_FILE)
    else:
        open(HISTORY_FILE, 'a').close()

    atexit.register(readline.write_history_file, HISTORY_FILE)
    print('Booted ~/pythonstartup.py.')
