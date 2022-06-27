HYDRA_FULL_ERROR=1 python3 main.py \
    +ci_test=True \
    training=gpt3/126m \
    run_data_preparation=False \
    run_training=True \
    run_conversion=False \
    run_finetuning=False \
    run_evaluation=False \
    bignlp_path=${GIT_CLONE_PATH} \
    data_dir=/lustre/fsw/joc/big_nlp/gpt3/prepare_dataset/the_pile/train \
    base_results_dir=${BASE_RESULTS_DIR} \
    "container='${BUILD_IMAGE_NAME_SRUN}'" \
    cluster.partition=${SLURM_PARTITION} \
    cluster.account=${SLURM_ACCOUNT} \
    cluster.gpus_per_task=null \
    cluster.gpus_per_node=null \
    cluster.job_name_prefix="${SLURM_ACCOUNT}-bignlp_ci:" \
    training.run.name=${RUN_NAME} \
    training.run.time_limit="20:00" \
    training.exp_manager.create_checkpoint_callback=False \
    training.trainer.num_nodes=4 \
    training.trainer.max_steps=100 \
    training.trainer.log_every_n_steps=1 \
    training.trainer.val_check_interval=20 \
    training.trainer.limit_val_batches=5 \
    training.model.tensor_model_parallel_size=4 \
    training.model.pipeline_model_parallel_size=4 \
    training.model.data.data_prefix=[1.0,/lustre/fsw/joc/big_nlp/gpt3/prepare_dataset/the_pile/train/my-gpt3_00_text_document]
