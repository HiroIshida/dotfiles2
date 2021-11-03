#!/usr/bin/python3
import re
import sys
import os
import argparse
from os.path import expanduser

home = expanduser("~")
jump_alias_file = os.path.join(home, ".jump_alias.sh")

def get_cwd_modified():
    path = os.getcwd()
    reg = r"("+home+")(.*)"
    m = re.search(reg, path)
    path_modified = "~" + m.group(2)
    return path_modified

class Manager:
    def __init__(self):
        if not os.path.exists(jump_alias_file):
            open(jump_alias_file, 'a').close()
        with open(jump_alias_file) as fp:
            lines = fp.readlines()
            match_list = [re.search(r"(alias jj)(\w+)(=.*cd\s)(.*)(')", line) for line in lines]
            postfix_list = [m.group(2) for m in match_list if m is not None]
        mapping = {postfix:line for postfix, line in zip(postfix_list, lines)}
        self.mapping = mapping

    def add(self, key, path):
        new_alias = "alias jj"+key+"='cd "+path+"'\n"
        self.mapping[key] = new_alias

    def dump(self):
        strdump = "".join(self.mapping.values())
        strdump += "alias jj='jj0'\n"
        return strdump

if __name__=='__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('str', type=str)
    parser.add_argument("-f", action="store_true")

    args = parser.parse_args()
    isForce = args.f

    manager = Manager()

    postfix_new = sys.argv[1]
    isConflict = postfix_new in manager.mapping.keys()
    if isConflict and (isForce is False):
        print("conflict. use -f to overwrite.")
        sys.exit()

    cwdm = get_cwd_modified()
    manager.add(postfix_new, cwdm)
    strdump = manager.dump()

    with open(jump_alias_file, mode='w') as fp:
        fp.write(strdump)

    """
    import IPython
    IPython.embed()
    """
