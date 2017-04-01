__version__ = "4.1"
__build__ = "GIT_COMMIT"
try:
    import logging
    import subprocess
    import os
    import platform
    FNULL = open(os.devnull, 'w')
    if platform.system() == "Windows":
        args = ['git', 'describe', '--tags']
    else:
        args = ['git describe --tags']
    git_revision = subprocess.check_output(args,
                    stderr=FNULL,
                    shell=True)
    __build__ = str(git_revision).strip()
except subprocess.CalledProcessError as cpe:
    logging.warning("Error while determining build number\n  Using command:\n %s \n Output:\n %s"% (cpe.cmd,cpe.output))
