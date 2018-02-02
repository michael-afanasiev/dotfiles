import os

# Compiler flags.
flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-DNDEBUG',
    '-x', 'c++',
    '-std=c++11',
    '-I', '/Users/mafanasiev/Development/Salvus/SalvusFEM/include',
    '-I', '/Users/mafanasiev/Development/Salvus/SalvusUtility/include',
    '-I', '/Users/mafanasiev/Development/Salvus/SalvusPhysics/include',
    '-I', '/Users/mafanasiev/Development/Salvus/SalvusModel/include',
    '-I', '/Users/mafanasiev/Development/Salvus/SalvusProblem/include',
    '-I', '/Users/mafanasiev/Development/Salvus/SalvusProblem/obsolete',
    '-I', '/opt/petsc/release_single_int64/include',
    '-I', '/usr/local/include/eigen3',
]


def FlagsForFile(filename, **kwargs):
    return {
        'flags': flags,
        'include_paths_relative_to_dir': os.path.dirname(os.path.abspath(__file__))
    }
