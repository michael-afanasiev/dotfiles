import os
from pathlib import Path

salvus_base = Path(os.environ['SALVUS_HOME']) / "Salvus"
petsc_dir = os.environ['PETSC_HEADERS_DIR']
third_party = os.environ['SALVUS_EXTERNAL_INSTALL']

# Compiler flags.
flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-DNDEBUG',
    '-x', 'c++',
    '-std=c++11',
    '-I', Path(salvus_base) / 'SalvusFEM' / 'include',
    '-I', Path(salvus_base) / 'SalvusUtility' / 'include',
    '-I', Path(salvus_base) / 'SalvusUtility' / 'include' / 'External' / 'rapidjson' / 'include',
    '-I', Path(salvus_base) / 'SalvusPhysics' / 'include',
    '-I', Path(salvus_base) / 'SalvusModel' / 'include',
    '-I', Path(salvus_base) / 'SalvusProblem' / 'include',
    '-I', Path(salvus_base) / 'SalvusProblem' / 'obsolete',
    '-I', Path(salvus_base) / 'SalvusIo' / 'include',
    '-I', Path(petsc_dir),
    '-I', Path(third_party) / 'include',
    '-I', Path(third_party) / 'include' / 'eigen3'
]

def FlagsForFile(filename, **kwargs):
    return {
        'flags': flags,
        'include_paths_relative_to_dir': os.path.dirname(os.path.abspath(__file__))
    }
