-- SCD2 snapshot for the TRUCK source table tracking changes over time
-- Co-authored with CoCo
{% snapshot HIST_TRUCK %}

{{
    config(
        target_schema='snapshots',
        unique_key='TRUCK_ID',
        strategy='check',
        check_cols='all',
        transient=false
    )
}}

SELECT * FROM {{ source('tb_101', 'TRUCK') }}

{% endsnapshot %}

