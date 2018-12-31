import os

home_dir = os.environ['HOME']
os.system("jupyter notebook --generate-config")

from notebook.auth import passwd
pwsha = passwd()

config_str = """
# Server config
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.password = u'{}'
# It is a good idea to put it on a known, fixed port
c.NotebookApp.port = 8888
c.NotebookApp.notebook_dir = u'/root/'
c.NotebookApp.allow_root = True
""".format(pwsha)

with open(home_dir+"/.jupyter/jupyter_notebook_config.py", "w") as cf:
    cf.write(config_str)
