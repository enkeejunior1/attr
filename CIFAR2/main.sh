# Data pre-processing:
# 1. Run 00_EDA.ipynb

# 2. Train a diffusion model and generate images:
# bash scripts/run_train.sh 0 18888 5000-0.5
# bash scripts/run_gen.sh 0 0 5000-0.5

# 3. Construct the LDS benchmark:
# Train 64 models corresponding to 64 subsets of the training set
# bash scripts/run_lds_val_sub.sh 0 18888 5000-0.5 0 63

# 4. Evaluate the model outputs on the validation set
# bash scripts/run_eval_lds_val_sub.sh 0 0 5000-0.5 idx_val.pkl 0 63
# bash scripts/run_eval_lds_val_sub.sh 0 1 5000-0.5 idx_val.pkl 0 63
# bash scripts/run_eval_lds_val_sub.sh 0 2 5000-0.5 idx_val.pkl 0 63

# 4. Evaluate the model outputs on the generation set
# bash scripts/run_eval_lds_val_sub.sh 0 0 5000-0.5 idx_gen.pkl 0 63
# bash scripts/run_eval_lds_val_sub.sh 0 1 5000-0.5 idx_gen.pkl 0 63
# bash scripts/run_eval_lds_val_sub.sh 0 2 5000-0.5 idx_gen.pkl 0 63

# 5. Compute the gradients to be used for D-TRAK.
bash scripts/run_grad.sh 0 0 5000-0.5 idx-train.pkl 0 ddpm/checkpoint-8000 mean-squared-l2-norm uniform 10 32768
# bash scripts/run_grad.sh 0 0 5000-0.5 idx-train.pkl 1 ddpm/checkpoint-8000 mean-squared-l2-norm uniform 10 32768
# bash scripts/run_grad.sh 0 0 5000-0.5 idx-train.pkl 2 ddpm/checkpoint-8000 mean-squared-l2-norm uniform 10 32768
# bash scripts/run_grad.sh 0 0 5000-0.5 idx-train.pkl 3 ddpm/checkpoint-8000 mean-squared-l2-norm uniform 10 32768
# bash scripts/run_grad.sh 0 0 5000-0.5 idx-train.pkl 4 ddpm/checkpoint-8000 mean-squared-l2-norm uniform 10 32768
# bash scripts/run_grad.sh 0 0 5000-0.5 idx-val.pkl 0 ddpm/checkpoint-8000 mean-squared-l2-norm uniform 10 32768
# bash scripts/run_grad.sh 0 0 5000-0.5 idx-gen.pkl 0 ddpm/checkpoint-8000 mean-squared-l2-norm uniform 10 32768

# 6. Compute the TRAK/D-TRAK attributions and evaluate the LDS scores
# Run notebooks in methods/04_if.