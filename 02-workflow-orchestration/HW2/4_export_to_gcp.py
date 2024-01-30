from mage_ai.settings.repo import get_repo_path
from mage_ai.io.config import ConfigFileLoader
from mage_ai.io.google_cloud_storage import GoogleCloudStorage
from pandas import DataFrame
from os import path
import pyarrow as pa
import pyarrow.parquet as pq
import os

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = '/home/src/de-project-411822-448f5bd62d55.json'
project_id = 'de-project-411822'
bucket_name = 'de-2024-mage-bucket-shumeng'
table_name = 'HW2_green_taix'
root_path = f'{bucket_name}/{table_name}'
@data_exporter
def export_data_to_google_cloud_storage(data, *args, **kwargs):
 
    table = pa.Table.from_pandas(data)
    gcs = pa.fs.GcsFileSystem()
    pq.write_to_dataset(
        table,
        root_path=root_path,
        partition_cols = ['lpep_pickup_date'],
        filesystem = gcs
    )