import sys
import os

import importlib

_VERSION = '0.1.0'

if sys.argv[1] == '--version' or sys.argv[1] == '-v':
    print(f'{_VERSION}')
    exit(1)

if len(sys.argv) == 1:
    print('No found script argument')
    exit(1)

try:
    sys.argv.remove(sys.argv[0])

    sys.path.append(os.getcwd())

    module_name = sys.argv[0].replace('.py', '')
    importlib.import_module(module_name)

except Exception as e:
    print(e.with_traceback())
    exit(1)
