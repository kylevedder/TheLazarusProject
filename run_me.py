#!/usr/bin/env python3
import os

layer_file = "lazarus.layers"
layer_folder = "layers/"
install_file = "install"

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def parse_layers():
    if not os.path.isfile(layer_file):
        print(bcolors.FAIL + "No layers file \"{0}\" found!".format(layer_file) + bcolors.ENDC)
        exit(-1)
    else:
        layers = []
        with open(layer_file) as f:
            layers = f.readlines()
        # Removes extra whitespace.
        layers = [x.strip() for x in layers]
    return layers

def is_valid_layer(layer):
    if not os.path.isdir(layer_folder + layer):
        print("Unknown layer: \"{0}\"".format(layer))
        return False
    if not os.path.isfile(layer_folder + layer + "/" + install_file):
        print("\"{0}\": Missing install file!".format(layer))
        return False
    if not os.access(layer_folder + layer + "/" + install_file, os.X_OK):
        print( bcolors.FAIL + "\"{0}\": Install file not executable!".format(layer) + bcolors.ENDC)
        return False
    return True

def run_install(layer):
    print(bcolors.OKBLUE + "Installing \"{0}\"".format(layer) + bcolors.ENDC)
    current_working_directory = os.getcwd()
    os.chdir(layer_folder + layer + "/")
    return_value = os.system("./" + install_file)
    os.chdir(current_working_directory)
    return (layer, return_value)

def main():
    layers = parse_layers()
    layer_validity_list = list(map(lambda layer: is_valid_layer(layer), layers))
    if False in layer_validity_list:
        exit(-1)

    print(bcolors.HEADER + "Installing the following packages:" + bcolors.ENDC)
    for layer in layers:
        print(layer)
    print(bcolors.HEADER + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + bcolors.ENDC)

    # Runs install on the packages
    return_values = list(map(lambda layer: run_install(layer), layers))
    successes = [item for item in return_values if 0 in item]
    failures = [item for item in return_values if not 0 in item]
    for success in successes:
        print(bcolors.OKGREEN + "Layer \"{0}\" installed successfully.".format(success[0]) + bcolors.ENDC)

    for failure in failures:
        print(bcolors.FAIL + "Layer \"{0}\" failed to install with exit code \"{1}\".".format(failure[0], failure[1]) + bcolors.ENDC)



if __name__ == "__main__":
    main()
