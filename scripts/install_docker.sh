#!/bin/bash
# Copyright (c) 2017-2018, wradlib developers.
# Distributed under the MIT License. See LICENSE.txt for more info.

cat << EOF | docker exec -i $WRADLIB_DOCKER_TAG \
                        /bin/bash

export PYTHONUNBUFFERED=1

conda config --set show_channel_urls True
conda config --add channels conda-forge

source activate wradlib

# cd /home/build/wradlib
# python -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv

# print version information
python --version
pip --version
python -c "from osgeo import gdal; print('GDAL:', gdal.__version__)"
python -c "import numpy; print('NUMPY:', numpy.__version__)"
python -c "import scipy; print('SCIPY:', scipy.__version__)"
python -c "import matplotlib; print('MATPLOTLIB:', matplotlib.__version__)"
python -c "import netCDF4; print('NETCDF4:', netCDF4.__version__, netCDF4.getlibversion(), netCDF4.__hdf5libversion__)"
python -c "import h5py; print('H5PY:', h5py.__version__, h5py.version.hdf5_version)"
python -c "import xmltodict; print('XMLTODICT:', xmltodict.__version__)"
python -c "import wradlib; print('WRADLIB:', wradlib.__version__, wradlib.__git_revision__)"
EOF
