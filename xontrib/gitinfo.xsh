import os

__version__ = '0.1.0'
__all__ = ()

ONEFETCH = $(which onefetch)
GIT = $(which git)


def __gitinfo_show_git_info():
    if ONEFETCH:
        if os.path.exists('logo.png'):
            $[@(ONEFETCH) -i logo.png]
        else:
            $[@(ONEFETCH)]
    elif GIT:
        $[@(GIT) show -q]
        print()
        $[@(GIT) status -s]


@events.on_chdir
def __gitinfo_chdir(olddir: str, newdir: str) -> None:
    if os.path.isdir(os.path.join(newdir, '.git')):
        __gitinfo_show_git_info()
