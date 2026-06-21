-- SCD2 snapshot for the LOCATION source table tracking changes over time
-- Co-authored with CoCo
{% snapshot HIST_LOCATION %}

{{
    config(
        target_schema='snapshots',
        unique_key='LOCATION_ID',
        strategy='check',
        check_cols='all'
    )
}}

SELECT * FROM {{ source('tb_101', 'LOCATION') }}

{% endsnapshot %}
