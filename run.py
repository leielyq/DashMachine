#!/usr/bin/env python3

import os
import pathlib


root_folder = pathlib.Path().absolute()
if not os.path.isdir(os.path.join(root_folder, "dashmachine", "user_data")):
    os.mkdir(os.path.join(root_folder, "dashmachine", "user_data"))
db_file_path = os.path.join(root_folder, "dashmachine", "user_data", "site.db")
try:
    os.remove(db_file_path)
except FileNotFoundError:
    pass


from dashmachine import app
from dashmachine.main.utils import dashmachine_init

dashmachine_init()

if __name__ == "__main__":
    app.run(debug=True, use_reloader=True, host="::",port=80, threaded=True)
