#!/usr/bin/env bash

source /etc/profile
source /etc/bashrc

set -Eeuxo pipefail

wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
./miniconda.sh -b -p /usr/local/conda2
rm -rf miniconda.sh

cat >> /etc/profile.d/easypy.sh <<'EOF'

export PATH=/usr/local/conda2/bin:$PATH

# To use MKL 2018 with Theano you MUST set "MKL_THREADING_LAYER=GNU" in your environement.
export MKL_THREADING_LAYER=GNU

EOF

source /etc/profile

conda install --yes jupyter scikit-learn numpy mkl nose matplotlib theano

echo "done.."

