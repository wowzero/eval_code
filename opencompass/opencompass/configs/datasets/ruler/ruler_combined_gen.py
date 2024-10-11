from mmengine.config import read_base

with read_base():
    from .ruler_4k_gen import ruler_datasets as ruler_4k_datasets
    from .ruler_8k_gen import ruler_datasets as ruler_8k_datasets
    from .ruler_16k_gen import ruler_datasets as ruler_16k_datasets
    from .ruler_32k_gen import ruler_datasets as ruler_32k_datasets
    from .ruler_128k_gen import ruler_datasets as ruler_128k_datasets
    from .ruler_1m_gen import ruler_datasets as ruler_1m_datasets

ruler_combined_datasets = sum(
    (v for k, v in locals().items() if k.endswith('_datasets')), []
)
