-- SCD2 snapshot for the FRANCHISE source table tracking changes over time
-- Co-authored with CoCo
{% snapshot HIST_FRANCHISE %}

{{
    config(
        target_schema='snapshots',
        unique_key='FRANCHISE_ID',
        strategy='check',
        check_cols='all'
    )
}}

SELECT * FROM {{ source('tb_101', 'FRANCHISE') }}

{% endsnapshot %}
