if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

import re

@transformer
def transformer(data, *args, **kwargs):
    print (f'Number of rows before processing: {data.shape[0]}')
    data = data[data['passenger_count'] != 0]
    data = data[data['trip_distance'] != 0]
    print (f'Number of rows after removal: {data.shape[0]}')
    #data('lpep_pickup_date') = data['lpep_pickup_datetime'].date
    data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date
    snake_columns = []
    for col in list(data.columns):
        snake_case = re.sub(r'([a-z0-9])([A-Z])', r'\1_\2', col).lower()
        snake_columns.append(snake_case)
    
    data.columns = snake_columns
    return data




@test
def test_output(output, *args) -> None:

    assert output is not None, 'The output is undefined'
    vendor_list = output['vendor_id'].unique().tolist()
    print(vendor_list)
    assert all(output['vendor_id'].isin(vendor_list)), 'Vendor ID outside of list'
    assert sum(output['passenger_count'] < 0) == 0, 'Rows with negative passenger count'
    assert sum(output['trip_distance'] < 0) == 0, 'Rows with negative trip distance'