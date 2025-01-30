# pip install torch torchvision
# pip install accelerate datasets transformers
# pip install diffusers==0.16.1
# pip install traker[fast]
# export CUDA_HOME=$CONDA_PREFIX
# # export CUDA_HOME=$CONDA_PREFIX/pkgs/cuda-toolkit
# conda install cuda-nvcc -c nvidia
# pip install --use-pep517 traker[fast]

pip install torch torchvision --no-cache-dir
pip install accelerate datasets transformers
pip install diffusers==0.16.1
conda install cuda-nvcc -c nvidia
conda install -c nvidia cuda-toolkit
export CUDA_HOME=$CONDA_PREFIX
export PYTHONPATH=$CONDA_PREFIX/lib/python3.x/site-packages:$PYTHONPATH
pip install traker[fast]
# pip install traker[fast] --use-pep517 --no-build-isolation


